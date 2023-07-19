# Multiple Assigned Users

Out-of-the-box EspoCRM allows to assign only one user to a certain record. It's possible to add the ability to assign multiple users for a specific entity type.

For this, you just need to create a many-to-many relationship between the needed entity type and the *User* entity type, with the name `assignedUsers`. *Link Multiple Field* must be checked.

![exclusive gateway convergent](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/multiple-assigned-users/1.png)

!!! note

    Make sure that you chose link names that do not already exist in the system.

!!! note

    Make sure that the old *Assigned User* field is not set as required (at Entity Manager > fields). Make it not required otherwise.
