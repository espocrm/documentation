# Управление ролями

## Обзор

Чтобы ограничить доступ для некоторых пользователей, вам нужно использовать роли. Администратор может управлять ролями в панели администрирования. Каждая роль определяет доступ к определенным областям, которые применяются к пользователям, которые владеют этой ролью.

Один пользователь может иметь несколько ролей. Эти роли могут быть выбраны для определенного пользователя (поле «Роли» в записи пользователя) и/или быть унаследованы от команд, к которым принадлежит пользователь.

Если у пользователя несколько ролей, они будут объединены, так что разрешающее правило будет иметь более высокий приоритет. Это позволяет администратору легко и гибко управлять уровнем доступа.

Можно увидеть, какие разрешения применяются к определенному пользователю, нажав кнопку «Доступ» на подробном представлении пользователя.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/roles-management/scope-level.png)

## Пример

Например, пользователь принадлежит команде `Продажи`. У этой команды есть единственная роль `Продавца`. Таким образом, все пользователи из этой команды получат роль `Продавца`.

Роль `продавца` определяется следующим образом:

Управление:
```
создание - да
чтение - командное
редактирование - собственное
удаление - нет
поток - командное
```

Возможности:
```
создание - да
чтение – командное
рекдатирование – собственное
удаление – нет
поток - командное
```

Пользователи смогут читать только те роли и возможности, которые принадлежат команде `Отдел продаж` (поле «Команды»).
Пользователь сможет редактировать только те роли и возможности, которым они назначены, или те, которые они создали.
Пользователи не смогут удалять или иметь какие-нибудь другие права.

Мы хотим предоставить больше прав определенному пользователю, занимающему должность менеджера по продажам в компании. Этот сотрудник должен иметь возможность читать/редактировать/удалять все записи из команды `Продажи`. Пользователь должен принадлежать нашей команде `Продажи`. Но нам нужно создать новую роль `Менеджер продаж` и выбрать эту роль для этого пользователя в поле `Роли`.

Роль `менеджера продаж` определяется следующим образом:

Управление:
```
создание - да
чтение – командное
редактирование – командное
удаление – командное
поток - командное
```

Возможности:
```
создание - да
чтение – командное
редактирование – командное
удаление – командное
поток - командное
```

Наш пользователь сможет управлять всеми лидерами и возможностями из команды `Продажи`.

## Special Permissions

### Assignment Permission

Set this parameter to restrict ability to re-assign records to another user and/or teams. If you set `team` - then it will be possible to assign only to users from own team(s). If `no` - users won't be able to re-assign at all.

It also defines whether user is able to post to stream of another users/teams.

### User Permission

Allows to restrict an ability for users to view activities, calendar and stream of other users.

### Portal Permission

Defines an access to portal information, ability to post messages to portal users.

### Group Email Account Permission

Defines an access to group email accounts, an ability to send emails from group SMTP.

### Export Permission

Defenies whether user have an ability to export records. (since version 4.9.0)

## Permissions by Default 

By default (if there are no any applied) users can read and edit all records. But can't delete any ones except those they have created and they are assigned to at the same time.

There is an ability to restrict an access applied by default by enabling 'ACL Strict Mode' at Administration > Settings.

## Field Level Security

Allows to control an access for a specific fields.

By default user can read all fields if one can read the record. User can edit any field if one can edit the record. You can restrict access to specific fields using Field Level Security.

In edit view  of a role record in Field Level section click plus icon next to the specific scope then select needed field. Then you will be able to specify the access level for `read` and `edit` actions. There are to options: `yes` and `no`.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/roles-management/field-level-secutiry.png)
