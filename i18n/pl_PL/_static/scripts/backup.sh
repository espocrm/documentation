#!/bin/bash

DEFAULT_PATH_TO_ESPO="/var/www/html"
DEFAULT_BACKUP_PATH=$(pwd)

if [ -z "$1" ]; then
    echo "Enter a full path to EspoCRM directory ($DEFAULT_PATH_TO_ESPO):"
    read PATH_TO_ESPO
    if [ -z "$PATH_TO_ESPO" ]; then
        PATH_TO_ESPO=$DEFAULT_PATH_TO_ESPO
    fi
else
    PATH_TO_ESPO=$1
fi

if [ ! -d "$PATH_TO_ESPO" ]; then
    echo "Error: The directory '$PATH_TO_ESPO' does not exist."
    exit 1
fi

if [ ! -r "$PATH_TO_ESPO" ]; then
    echo "Error: The directory '$PATH_TO_ESPO' is not readable."
    exit 1
fi

if [ -z "$2" ]; then
    echo "Enter a full path to backup directory ($DEFAULT_BACKUP_PATH):"
    read BACKUP_PATH
    if [ -z "$BACKUP_PATH" ]; then
        BACKUP_PATH=$DEFAULT_BACKUP_PATH
    fi
else
    BACKUP_PATH=$2
fi

if [ ! -d "$BACKUP_PATH" ]; then
    echo "Error: The directory '$BACKUP_PATH' does not exist."
    exit 1
fi

if [ ! -w "$BACKUP_PATH" ]; then
    echo "Error: Backup directory '$BACKUP_PATH' is not writable."
    exit 1
fi

cd $PATH_TO_ESPO

if [ ! -f "data/config.php" ]; then
    echo "Error: The '$PATH_TO_ESPO' is not EspoCRM directory."
    exit 1
fi

DB_USER=$(php -r "\$config=include('data/config.php'); echo \$config['database']['user'];")
DB_PASS=$(php -r "\$config=include('data/config.php'); echo \$config['database']['password'];")
DB_NAME=$(php -r "\$config=include('data/config.php'); echo \$config['database']['dbname'];")

BACKUP_NAME=$(basename $PATH_TO_ESPO)
BACKUP_ARCHIVE_NAME="$(date +'%Y-%m-%d_%H%M%S').tar.gz"

cd $BACKUP_PATH
mkdir $BACKUP_NAME
cd $BACKUP_NAME

# Create database dump
mysqldump --user=$DB_USER --password=$DB_PASS $DB_NAME > "db.sql" || {
    echo "Enter MySQL user:"
    read DB_USER

    echo "Enter MySQL password:"
    read DB_PASS

    mysqldump --user=$DB_USER --password=$DB_PASS $DB_NAME > "db.sql" || {
        echo "Error: Cannot dump the database '$DB_NAME'. "
        exit 1
    }
}

tar -czf "db.tar.gz" "db.sql"
rm "db.sql"

# Archive files
tar -czf "files.tar.gz" -C $PATH_TO_ESPO .

# Create a full backup archive
cd ..
tar czf "$BACKUP_ARCHIVE_NAME" $BACKUP_NAME/

# Remove temporary files
rm -rf $BACKUP_NAME

echo "Backup is created, '$BACKUP_PATH/$BACKUP_ARCHIVE_NAME'."
