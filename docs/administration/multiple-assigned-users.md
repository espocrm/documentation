# Multiple Assigned Users

## The new way

*As of v8.5.*

Multiple assigned users can be enabled for custom entity types and for some built-in entity type. Enable at: Administration > Entity Manager > {Entity Type} > Edit > check *Multiple Assigned Users* and save.

!!! important

    Existing assigned users set in the *Assigned User* field won't be transferred to the new *Assigned Users* field after enabling multiple assigned users.


The maximun number of assigned users allowed per record can configured set at: Administration > Entity Manager > {Entity Type} > Fields > Assigned Users > Max Count. By default, it's set to 10.

## The old way, prior v8.5

!!! important

    This feature requires the config parameter `customPrefixDisabled` set to true.

Out-of-the-box EspoCRM allows to assign only one user to a certain record. It's possible to add the ability to assign multiple users for a specific entity type.

For this, you just need to create a many-to-many relationship between the needed entity type and the *User* entity type, with the name `assignedUsers`. *Link Multiple Field* must be checked.

![assigned users](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/multiple-assigned-users/1.png)

!!! note

    Make sure that you chose link names that do not already exist in the system.

!!! note

    Make sure that the old *Assigned User* field is not set as required (at Entity Manager > fields). Make it not required otherwise.
