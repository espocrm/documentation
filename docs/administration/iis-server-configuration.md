# IIS (Internet Information Services) server configuration for EspoCRM v7

Note that all configuration settings listed here are made on **Wndows Server 2019**.

## Physical Path / Virtual Path

### Physical Path adjusting

1. Go to **IIS Manager**, select your *Site*.

![IIS Manager](../../_static/images/administration/iis/iis-manager.png)

2. Right-click on your *Site* > *Manage Website* > *Advanced Settings*.

![Physical Path](../../_static/images/administration/iis/physical-path.png)

3. Specify your EspoCRM public directory path (e.g., ***C:\inetpub\wwwroot\EspoCRM-7.2.5\public***) in the *Physical Path* field.
4. Click on *OK*.

![Physical Path-2](../../_static/images/administration/iis/physical-path-2.png)

### Virtual Path adjusting

1. Right-click on your *Site* in **IIS manager** > *Add Virtual Directory*.

![Virtual Path](../../_static/images/administration/iis/virtual-path.png)

2. Type *client* name in the *Alias* field.
3. Specify your EspoCRM client directory path (e.g., ***C:\inetpub\wwwroot\EspoCRM-7.2.5\client***) in the *Physical Path* field.
4. Click *OK*.

![Virtual Path-2](../../_static/images/administration/iis/virtual-path-2.png)

## Handler Mappings

### Via IIS Manager

1. Navigate **Handler Mappings** scope of your *Site*.

![Handler Mappings](../../_static/images/administration/iis/handler-mappings.png)

2. Select *PHP_via_FastCGI* module > *Actions* > *Edit*.

![FastCGI](../../_static/images/administration/iis/fast-cgi.png)

4. Specify ***"C:\Program Files\PHP\v7.4\php-cgi.exe"*** path in the *Executable (Optional)* field (***double quotes are requiered***).

![Edit Module](../../_static/images/administration/iis/edit-module.png)

5. Navigate *Request Restrictions* > *Verbs*.
6. Specify the verbs to be handled. Select ***All verbs*** or specify *One of the following verbs:* ***GET,HEAD,POST,PUT,DELETE,PATCH***, click on *OK*.

![Verbs](../../_static/images/administration/iis/verbs.png)

7. Click on *OK* and *Yes*.

![Confirmation](../../_static/images/administration/iis/confirmation.png)

### Via Text Editor (Notepad as Administrator, Sublime Text, VSCode, etc.)

1. Open **%windir%\system32\inetsrv\config\applicationhost.config** file.
2. Locate the *< handlers >* tag.
3. Locate **"PHP_via_FastCGI"** section, add all HTTP methods modifiyng ***verb="GET,HEAD,POST"*** value to ***verb="GET,HEAD,POST,PUT,DELETE,PATCH"***.
4. Save the **ApplicationHost.config** file.

**Reboot your IIS server after all the steps are done.**
