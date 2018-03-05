# Перемещение EspoCRM на другой сервер

Выполните следующие шаги, чтобы переместить EspoCRM на другой сервер:

### Шаг 1. Резервные файлы

Откройте файловый менеджер или войдите через SSH, чтобы архивировать все доступные файлы из каталога EspoCRM. Подробнее: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Шаг 2. Резервное копирование базы данных

Данные, хранящиеся в базе данных (MySQL, MariaDB), должны быть скопированы. Следуйте этой рекомендации: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Шаг 3. Скопируйте файлы и резервные копии баз данных на другой сервер

Скопируйте резервные копии файлов и вашей базы данных на новый сервер.

### Шаг 4. Файлы для архивирования без сохранения файлов

Чтобы разархивировать файлы резервных копий, вы можете использовать Archive Manager или эту инструкцию: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files.
Примечание. Файлы необходимо поместить в каталог веб-сервера.

### Шаг 5. Настройка сервера

Настройте новый сервер на основе рекомендаций здесь:
https://www.espocrm.com/documentation/administration/server-configuration/.

### Шаг 6. Правильные разрешения

Установите необходимые разрешения и владельца файлов, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Шаг 7. Импортируйте резервную копию базы данных

Во-первых, вам нужно создать новую базу данных с пользователем в MySQL. Чтобы импортировать свою базу данных из резервной копии, следуйте инструкциям: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Шаг 8. Исправьте конфигурации EspoCRM

После успешного импорта и настройки сервера, пожалуйста, исправьте конфигурацию EspoCRM в файле `ESPOCRM_DIRECTORY/data/config.php`:

 * настройки подключения к базе данных:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - если ваше доменное имя (URL) изменено:
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * владелец файлов по умолчанию (если разные):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  где `www-data` это ваш веб-сервер.

### Шаг 9. Установите crontab

Установите crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Примечание: он должен быть настроен под вашим пользователем веб-сервера.

Это все. Теперь ваш EspoCRM работает на новом сервере.
