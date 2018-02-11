#! / Bin / bash

DEFAULT_PATH_TO_ESPO = "/ var / www / html"
DEFAULT_BACKUP_PATH = $ (PWD)

se [-z "$ 1"]; poi
    echo "Immettere un percorso completo per la directory EspoCRM ($ DEFAULT_PATH_TO_ESPO):"
    leggi PATH_TO_ESPO
    se [-z "$ PATH_TO_ESPO"]; poi
        PATH_TO_ESPO = $ DEFAULT_PATH_TO_ESPO
    fi
altro
    PATH_TO_ESPO = $ 1
fi

Se [ ! -d "$ PATH_TO_ESPO"]; poi
    echo "Errore: la directory '$ PATH_TO_ESPO' non esiste."
    uscita 1
fi

Se [ ! -r "$ PATH_TO_ESPO"]; poi
    echo "Errore: la directory '$ PATH_TO_ESPO' non è leggibile."
    uscita 1
fi

se [-z "$ 2"]; poi
    echo "Immettere un percorso completo per la directory di backup ($ DEFAULT_BACKUP_PATH):"
    leggi BACKUP_PATH
    se [-z "$ BACKUP_PATH"]; poi
        BACKUP_PATH = $ DEFAULT_BACKUP_PATH
    fi
altro
    BACKUP_PATH = $ 2
fi

Se [ ! -d "$ BACKUP_PATH"]; poi
    echo "Errore: la directory '$ BACKUP_PATH' non esiste."
    uscita 1
fi

Se [ ! -w "$ BACKUP_PATH"]; poi
    echo "Errore: la directory di backup '$ BACKUP_PATH' non è scrivibile."
    uscita 1
fi

cd $ PATH_TO_ESPO

Se [ ! -f "data / config.php"]; poi
    echo "Errore:" $ PATH_TO_ESPO "non è la directory EspoCRM."
    uscita 1
fi

DB_USER = $ (php -r "\ $ config = include ('data / config.php'); echo \ $ config ['database'] ['utente'];")
DB_PASS = $ (php -r "\ $ config = include ('data / config.php'); echo \ $ config ['database'] ['password'];")
DB_NAME = $ (php -r "\ $ config = include ('data / config.php'); echo \ $ config ['database'] ['dbname'];")

BACKUP_NAME = $ (basename $ PATH_TO_ESPO)
BACKUP_ARCHIVE_NAME = "$ (data + '% Y-% m-% d_% H% M% S'). Tar.gz"

cd $ BACKUP_PATH
mkdir $ BACKUP_NAME
cd $ BACKUP_NAME

# Crea il dump del database
mysqldump --user = $ DB_USER --password = $ DB_PASS $ DB_NAME> "db.sql" || {
    echo "Enter MySQL user:"
    leggi DB_USER

    echo "Enter MySQL password:"
    leggi DB_PASS

    mysqldump --user = $ DB_USER --password = $ DB_PASS $ DB_NAME> "db.sql" || {
        echo "Errore: impossibile eseguire il dump del database '$ DB_NAME'."
        uscita 1
    }
}

tar -czf "db.tar.gz" "db.sql"
rm "db.sql"

# Archivia file
tar -czf "files.tar.gz" -C $ PATH_TO_ESPO.

# Crea un archivio di backup completo
cd ..
tar czf "$ BACKUP_ARCHIVE_NAME" $ BACKUP_NAME /

# Rimuovi i file temporanei
rm -rf $ BACKUP_NAME

echo "Il backup è stato creato, '$ BACKUP_PATH / $ BACKUP_ARCHIVE_NAME'."