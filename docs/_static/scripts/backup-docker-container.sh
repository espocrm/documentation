#!/bin/bash

# This script creates a backup of an EspoCRM Docker container, including both the database and files.
#
# EspoCRM - Open Source CRM application.
# Copyright (C) 2014-2026 EspoCRM, Inc.
# Website: https://www.espocrm.com

set -e

function printExitError() {
    local message="$1"

    local red='\033[0;31m'
    local default='\033[0m'

    printf "\n${red}ERROR${default}: ${message}\n"
    exit 1
}

DEFAULT_ESPOCRM_CONTAINER="espocrm"
DEFAULT_BACKUP_PATH="$(pwd)"

printf "NOTICE\nThis script is designed to work only with the official EspoCRM Docker image:\nhttps://docs.espocrm.com/administration/docker/installation/#install-espocrm-with-docker-compose.\n\n"
sleep 1

if [ -z "$1" ]; then
    echo "Enter an EspoCRM container name ($DEFAULT_ESPOCRM_CONTAINER):"

    read ESPOCRM_CONTAINER

    if [ -z "$ESPOCRM_CONTAINER" ]; then
        ESPOCRM_CONTAINER="$DEFAULT_ESPOCRM_CONTAINER"
    fi
else
    ESPOCRM_CONTAINER="$1"
fi

if [ -z "$2" ]; then
    echo "Enter a full path to backup directory ($DEFAULT_BACKUP_PATH):"

    read BACKUP_PATH

    if [ -z "$BACKUP_PATH" ]; then
        BACKUP_PATH="$DEFAULT_BACKUP_PATH"
    fi
else
    BACKUP_PATH="$2"
fi

# --- Validate ---

if [ ! -d "$BACKUP_PATH" ]; then
    mkdir -p "$BACKUP_PATH" || printExitError "Unable to create the directory '$BACKUP_PATH'"
fi

if [ ! -w "$BACKUP_PATH" ]; then
    printExitError "Backup directory '$BACKUP_PATH' is not writable"
fi

DB_CONTAINER=$(docker exec "$ESPOCRM_CONTAINER" printenv ESPOCRM_DATABASE_HOST || echo "")

if [ -z "$DB_CONTAINER" ]; then
    printExitError "Unable to determine the database container."
fi

DB_NAME=$(docker exec "$ESPOCRM_CONTAINER" printenv ESPOCRM_DATABASE_NAME || echo "espocrm")
DB_USER=$(docker exec "$ESPOCRM_CONTAINER" printenv ESPOCRM_DATABASE_USER || echo "espocrm")
DB_PASS=$(docker exec "$ESPOCRM_CONTAINER" printenv ESPOCRM_DATABASE_PASSWORD || echo "")

if ! docker ps --format '{{.Names}}' | grep -q "^${ESPOCRM_CONTAINER}$"; then
    printExitError "Container '$ESPOCRM_CONTAINER' is not running"
fi

if ! docker ps --format '{{.Names}}' | grep -q "^${DB_CONTAINER}$"; then
    printExitError "Container '$DB_CONTAINER' is not running"
fi

if [ -z "$DB_PASS" ]; then
    printExitError "Unable to determine the database from container environment"
fi

# --- Prepare temp dir and archive name ---

BACKUP_ARCHIVE_NAME="$(date +'%Y-%m-%d_%H%M%S').tar.gz"
TEMP_DIR="$BACKUP_PATH/espocrm_backup_tmp"

mkdir -p "$TEMP_DIR"

# --- Database backup ---

echo ">>> Backing up database '$DB_NAME'..."

DB_VERSION=$(docker exec "$DB_CONTAINER" mariadb --version 2>/dev/null || docker exec "$DB_CONTAINER" mysql --version 2>/dev/null)

if echo "$DB_VERSION" | grep -qi "mariadb"; then
    DUMP_CMD="mariadb-dump"
else
    DUMP_CMD="mysqldump"
fi

docker exec "$DB_CONTAINER" \
    $DUMP_CMD --user="$DB_USER" --password="$DB_PASS" "$DB_NAME" \
    > "$TEMP_DIR/db.sql" || printExitError "Unable to create a backup for the database '$DB_NAME'"

tar -czf "$TEMP_DIR/db.tar.gz" -C "$TEMP_DIR" "db.sql"
rm "$TEMP_DIR/db.sql"

echo ">>> Database backup done."

# --- Files backup ---

echo ">>> Backing up EspoCRM files..."

docker run --rm \
  --volumes-from "${ESPOCRM_CONTAINER}" \
  -v "${TEMP_DIR}:/backup" \
  alpine tar czf /backup/files.tar.gz -C /var/www/html . > /dev/null 2>&1

echo ">>> Files backup done."

# --- Bundle into single archive ---

echo ">>> Creating final archive..."

tar czf "$BACKUP_PATH/$BACKUP_ARCHIVE_NAME" -C "$TEMP_DIR" .

# --- Cleanup ---

rm -rf "$TEMP_DIR"

echo ""
echo "Backup created at '$BACKUP_PATH/$BACKUP_ARCHIVE_NAME'."
