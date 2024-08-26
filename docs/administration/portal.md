# Portal

A Portal provides the ability to access specific CRM data and functions for your customers and partners. Administrators can create multiple Portals. Each Portal can have its own settings, dashboard, user list and access control settings.

To create a Portal, follow Administration > Portals > *Create Portal*.

* *Is Active*. If not checked, the Portal won't be available for anybody.
* *Is Default*. Means that the Portal will be available by shorter URL: `https://YOUR_ESPO_URL/portal`.
* *Roles*. Specify one or multiple Portal Roles that will be applied to Users logged into the Portal. More information about the Portal Roles is below.
* *Tab List*. Tabs which will be shown in the navigation bar in the Portal.
* *Dashboard Layout*. Specify dashlets that will be displayed on the home page of the Portal. Note that Portal Users can't configure their dashboard.
* *URL*. Read-only field that displays the link you can access the Portal with.
* *Layout Set*. Provides the ability to use different layouts from the Portal. See more [info](layout-manager.md#different-layouts-for-teams-portals).

## Portal Users

Administrators can create portal users.

1. Administration > Portal Users.
2. Click *Create Portal User* button.
3. Select Contact the Portal User will be linked with or *Proceed w/o Contact*
4. Fill needed fields on the form and click *Save*.

A Portal User should be linked to a Portal record in order to be able to access that Portal.

Portal Users can have one or multiple additional *Portal Roles*. These roles will be merged with roles specified for a Portal.

Portal Users can have a specific *Dashboard Layout*. It allows certain users to have a specific layout that differs from the default Portal's layout.

## Portal Roles

Portal roles are similar to regular roles in EspoCRM but with a few distinctions.

* not-set ‒ Denies access.
* own ‒ Records created by the user. E.g. a portal user created some case and this case is owned by this user.
* account ‒ Records related to the account the portal user is related to. Relation (link) should be named `account` or `accounts`.
* contact ‒ Records related to the contact the portal user is related to. Relation (link) should be named `contact` or `contacts`.

*Assigned User* and *Teams* fields are read-only for portal users.

Portal roles can be applied to:

* Portal ‒ all users of the portal will receive this role (multiple roles applied to one Portal are merged into one);
* Portal User ‒ to grant certain users specific permissions.

### Example

*Portal Users should be able to create Cases, view Cases related to their Account; they also should be able to view Knowledge Base.*

1. Open Create Portal Role form (Administration > Portal Roles > Create Role).
2. Enable access to Cases, set: *create – yes, read – account, edit – no, delete – no, stream – account*.
3. Enable access to Knowledge Base, set: *create – no, read – account, edit – no, delete – no*.
4. Edit the Portal record (Administration > Portals). Select your portal role in Roles field and then save.

!!! note

    When creating custom relationships for built-in entity types, a *c* prefix is automatically added to link names. It means that links named *account*, *contact*, *accounts* and *contacts* won't override *contact* and *account* level access for built-in entity types due the added prefix. Though it's possible to disable prefix addition with the config parameter *customPrefixDisabled*. You can set it to true temporarily just to create needed relationships.

## Access to Portal

You can find the URL for your Portal in the *URL* field of the Portal record. It's also possible to use server configuration tools (such as mod_rewrite) to be able to access the Portal by a different URL. For this case, you need to fill in 'Custom URL' field.

* [Apache configuration](portal/apache-configuration.md)
* [Nginx configuration](portal/nginx-configuration.md)

## See also

* [ACL customization](../development/acl.md#custom-acl-for-entity-type)
