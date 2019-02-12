# Резервное копирование и восстановление

## Как создать резервную копию EspoCRM вручную

EspoCRM состоит из файлов и информации базы данных. Все эти данные необходимы для создания полной резервной копии EspoCRM. Вот инструкции о том, как это сделать на сервере Ubuntu с MySQL.

### Шаг 1. Резервное копирование файлов

Создайте архив содержимого каталога установленного EspoCRM. Для Ubuntu путь по умолчанию - `/var/www/html`. Вы можете использовать эту команду:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Шаг 2. Резервное копирование базы данных

Чтобы создать резервную копию всех ваших данных, вам необходимо узнать имя базы данных и получить доступ к учетным данным. Имя базы данных можно найти в файле конфигурации `/ESPOCRM_DIRECTORY/data/config.php` в разделе `database`. Вы можете использовать эту команду для резервного копирования вашей базы данных:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Шаг 3. Скопируйте резервную копию

Это все. Теперь вам нужно скопировать созданную резервную копию в безопасное место.

## Как создать резервную копию EspoCRM, используя скрипт

Вы можете использовать скрипт для резервного копирования всех необходимых данных. Войдите через SSH и запустите команды (протестированные на сервере Ubuntu).

### Скачайте скрипт

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Запустите скрипт

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
где
 * `PATH_TO_ESPOCRM` путь к установленному каталогу EspoCRM.
 * `BACKUP_PATH` путь к каталогу резервных копий.

Для сервера Ubuntu:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Примечание. Если ваш пользователь MySQL не имеет необходимых прав для выгрузки базы данных, вам будет предложено ввести учетные данные другого пользователя MySQL.

После успешного создания, вы получите путь к созданной резервной копии.

## Восстановление EspoCRM из резервной копии

Вы можете восстановить EspoCRM из резервной копии, созданной, как описано выше.

### Шаг 1. Разархивируйте файлы резервной копии

Чтобы распаковать файлы, вы можете использовать Archive Manager или выполнить команду ниже. Файлы необходимо размещать в каталоге веб-сервера.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
где:
 * `/var/www/html` это директория сервера.

### Шаг 2. Установите необходимые разрешения

Файлы должны принадлежать пользователю веб-сервера и иметь правильные разрешения. Установите необходимые разрешения, следуя этой инструкции: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Шаг 3. Импортируйте дамп базы данных

Дамп базы данных должен быть импортирован в ту же базу данных с теми же учетными данными пользователя, иначе исправление должно быть сделано в файле конфигурации «ESPOCRM_DIRECTORY/data/config.php». Чтобы импортировать вашу базу данных из дампа, выполните следующую команду в терминале:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Шаг 4. Проверьте/настройте crontab

Проверьте, правильно ли настроен ваш crontab. Выполните приведенную ниже команду и проверьте правильность пути к EspoCRM:

```bash
sudo crontab -l -u www-data
```
где:
 * `www-data` ваш пользователь сервера.

Если вам нужно внести какие-либо изменения, используйте эту команду:

```bash
sudo crontab -l -u www-data
```

Более подробная информация о настройке crontab для EspoCRM описана здесь [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
