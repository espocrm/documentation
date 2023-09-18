# Portal

Portal provides the ability to access specific CRM data and functions for your customers and partners. Administrators can create multiple portals. Each portal can have its own settings, dashboard, user list, access control settings.

To create portal follow Administration > Portals, click Create Portal button.

* *Is Active*. If not checked, the portal won't be available for anybody.
* *Is Default*. Means that the portal will be available by shorter url: `https://YOUR_ESPO_URL/portal`.
* *Roles*. Specify one or multiple portal roles that will be applied to users logged into the portal. More information about the portal roles is below.
* *Tab List*. Tabs which will be shown in the navigation bar.
* *Dashboard Layout*. Specify dashlets that will be displayed on the home page of the portal. Note that portal users can't configure their dashboard.
* *URL*. Read-only field that displays the link you can access the portal with.
* *Layout Set*. Provides the ability to use different layouts from the portal. See more [info](layout-manager.md#different-layouts-for-teams-portals).

## Portal Users

Administrators can create portal users.

1. Administration > Portal Users.
2. Click *Create Portal User* button.
3. Select Contact the portal user will be linked with or *Proceed w/o Contact*
4. Fill needed fields on the form and click *Save*.

Portal user should be linked to Portal record to be able to access that portal.

Portal users can have one or multiple additional *Portal Roles*. These roles will be merged with roles specified for a portal.

Portal users can have a specific *Dashboard Layout*. It allows certain users to have a specific layout that differs from the default portal layout.

## Portal Roles

Portal roles are similar to regular roles in EspoCRM but with a few distinctions.

* not-set ‒ Denies access.
* own ‒ Records created by the user. E.g. a portal user created some case and this case is owned by this user.
* account ‒ Records related to the account the portal user is related to. Relation (link) should be named `account` or `accounts`.
* contact ‒ Records related to the contact the portal user is related to. Relation (link) should be named `contact` or `contacts`.

*Assigned User* and *Teams* fields are read-only for portal users.

Portal roles can be applied to:

* Portal ‒ all users of the portal will receive this role (multiple roles are merged);
* Portal User ‒ to grant certain users specific permissions.

### Example

*Portal users should be able to create cases, view cases related to their account; they should be able to view knowledge base.*

1. Open Create Portal Role form (Administration > Portal Roles > Create Role).
2. Enable access to Cases, set: *create – yes, read – account, edit – no, delete – no, stream – account*.
3. Enable access to Knowledge Base, set: *create – no, read – account, edit – no, delete – no*.
4. Edit your portal record (Administration > Portals). Select your portal role in Roles field and then save.

## Access to Portal

You can find the URL for your portal in the *URL* field of the portal record. It's also possible to use server configuration tools (such as mod_rewrite) to be able to access by different url. For this case, you need to fill in 'Custom URL' field.

* [Apache configuration](portal/apache-configuration.md)
* [Nginx configuration](portal/nginx-configuration.md)

## See also

* [ACL customization](../development/acl.md#custom-acl-for-entity-type)
