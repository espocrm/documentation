# Multiple Assigned Users

Note: This function is experimental and available only since the version 5.2.0. Flowless work and compatibility with other features is not guaranteed.

Out-of-the-box EspoCRM allows to assign only one user to the certain record. It's possible to add the ability to assign multiple users for a specific entity type.

For this you just need to create a many-to-many relationship between the needed entity type and the User entity type, with the name 'assignedUsers'. Link Multiple Field must be checked.

![exclusive gateway convergent](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/multiple-assigned-users/1.png)

