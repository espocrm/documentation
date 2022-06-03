#!/bin/bash

set -e

function printExitError() {
    local messsage="$1"

    local red='\033[0;31m'
    local default='\033[0m'

    printf "\n${red}ERROR${default}: ${messsage}\n"
    exit 1
}

DEFAULT_PATH_TO_ESPO="/var/www/html"
DEFAULT_BACKUP_PATH=$(pwd)

if [ -z "$1" ]; then
    echo "Enter a full path to EspoCRM directory ($DEFAULT_PATH_TO_ESPO):"

    read PATH_TO_ESPO
    if [ -z "$PATH_TO_ESPO" ]; then
        PATH_TO_ESPO="$DEFAULT_PATH_TO_ESPO"
    fi
else
    PATH_TO_ESPO="$1"
fi

if [ ! -d "$PATH_TO_ESPO" ]; then
    printExitError "The directory '$PATH_TO_ESPO' does not exist"
fi

if [ ! -r "$PATH_TO_ESPO" ]; then
    printExitError "The directory '$PATH_TO_ESPO' is not readable"
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

if [ ! -d "$BACKUP_PATH" ]; then
    printExitError "The directory '$BACKUP_PATH' does not exist"
fi

if [ ! -w "$BACKUP_PATH" ]; then
    printExitError "Backup directory '$BACKUP_PATH' is not writable"
fi

cd "$PATH_TO_ESPO"

if [ ! -f "data/config.php" ]; then
    printExitError "The '$PATH_TO_ESPO' is not EspoCRM directory"
fi

DB_NAME=$(php -r "\$config=include('data/config.php'); echo @\$config['database']['dbname'];")
DB_USER=$(php -r "\$config=include('data/config.php'); echo @\$config['database']['user'];")
DB_PASS=$(php -r "\$config=include('data/config.php'); echo @\$config['database']['password'];")

if [ -z "$DB_NAME" ]; then
    DB_NAME=$(php -r "\$config=include('data/config-internal.php'); echo @\$config['database']['dbname'];")
fi

if [ -z "$DB_USER" ]; then
    DB_USER=$(php -r "\$config=include('data/config-internal.php'); echo @\$config['database']['user'];")
fi

if [ -z "$DB_PASS" ]; then
    DB_PASS=$(php -r "\$config=include('data/config-internal.php'); echo @\$config['database']['password'];")
fi

if [ -z "$DB_NAME" ]; then
    printExitError "Unable to determine database name"
fi

BACKUP_NAME=$(basename "$PATH_TO_ESPO")
BACKUP_ARCHIVE_NAME="$(date +'%Y-%m-%d_%H%M%S').tar.gz"

cd "$BACKUP_PATH" || {
    printExitError "Permission denied on $BACKUP_PATH"
}

mkdir -p "$BACKUP_NAME"
cd "$BACKUP_NAME"

# Create database backup
mysqldump --user="$DB_USER" --password="$DB_PASS" "$DB_NAME" > "db.sql" || {
    echo "Enter MySQL user:"
    read DB_USER

    echo "Enter MySQL password:"
    read DB_PASS

    mysqldump --user="$DB_USER" --password="$DB_PASS" "$DB_NAME" > "db.sql" || {
        printExitError "Unable to create a backup for the database '$DB_NAME'"
    }
}

tar -czf "db.tar.gz" "db.sql"
rm "db.sql"

# Archive files
tar -czf "files.tar.gz" -C "$PATH_TO_ESPO" .

# Create a full backup archive
cd ..
tar czf "$BACKUP_ARCHIVE_NAME" "$BACKUP_NAME"/

# Remove temporary files
rm -rf "$BACKUP_NAME"

echo "Backup is created at '$BACKUP_PATH/$BACKUP_ARCHIVE_NAME'."
