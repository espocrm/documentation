# Formula > Functions > Ext

* [ext\account\findByEmailAddress](#extaccountfindbyemailaddress)
* [ext\currency\convert](#extcurrencyconvert)
* [ext\email\send](#extemailsend)
* [ext\email\applyTemplate](#extemailapplytemplate)
* [ext\sms\send](#extsmssend)
* [ext\pdf\generate](#extpdfgenerate)
* [ext\user\sendAccessInfo](#extusersendaccessinfo)
* [ext\calendar\userIsBusy](#extcalendaruserisbusy)
* [ext\acl\checkEntity](#extaclcheckentity)
* [ext\acl\checkScope](#extaclcheckscope)
* [ext\acl\getLevel](#extaclgetlevel)
* [ext\acl\getPermissionLevel](#extaclgetpermissionlevel)

## ext\account\findByEmailAddress

`ext\account\findByEmailAddress(EMAIL_ADDRESS)`

Finds an account by an email address. If no full match found, then tries to find by domain name.
Free email provider domains are ignored. Returns ID or null.

## ext\currency\convert

`ext\currency\convert(AMOUNT, FROM_CODE, [TO_CODE])`

*As of v7.4.*

Converts a currency amount from one currency code (FROM_CODE) to another currency code (TO_CODE). If TO_CODE is omitted, then
the system default currency is used. Returns an amount represented as string.

!!! example

    ```
    $convertedValueString = ext\currency\convert(amount, amountCurrency);
    $convertedValue = number\parseFloat($convertedValue);
    ```

## ext\email\send

`ext\email\send(EMAIL_ID)`

Sends an email. EMAIL_ID is an ID of an email record. Returns TRUE if sent, false if not sent.

If *from* address is not set in the email, then the system email address will be used. If there's match between *from* address and 
the address of some group email account, then SMTP setting of the group email account will be used.

!!! example

    ```
    $id = record\create(
        'Email',
        'from', 'from-address@test.com',
        'to', 'to-address@test.com',
        'subject', 'Test from formula',
        'body', 'Hi,\n\nThis is a test.',
        'isHtml', false,
        'status', 'Sending'
    );
    ext\email\send($id);
    ```

## ext\email\applyTemplate

`ext\email\applyTemplate(EMAIL_ID, EMAIL_TEMPLATE_ID, [PARENT_TYPE, PARENT_ID])`

Applies an email template to an existing email record. Parent record can be passed optionally.

!!! example

    ```
    $emailId = record\create(
        'Email',
        'to', 'to-address@test.com',
        'status', 'Draft',
        'parentId', entity\attribute('id'),
        'parentType', 'Case'
    );
    ext\email\applyTemplate($emailId, 'some-email-template-id');
    ext\email\send($emailId);
    ```

## ext\sms\send

`ext\sms\send(SMS_ID)`

Sends an SMD. SMS_ID is an ID of an SMS record. Returns TRUE if sent, false if not sent. (Available as of v7.0)

!!! example

    ```
    $smsId = record\create(
        'Sms',
        'to', '+1 000 111 222',
        'body', 'This is a test.'
    );

    ext\sms\send($smsId);
    ```

If *from* address is not set in the SMS, then the system SMS from number will be used.

The extension with SMS providers can be downloaded [here](https://github.com/espocrm/ext-sms-providers/releases).

## ext\pdf\generate

`ext\pdf\generate(ENTITY_TYPE, ENTITY_ID, TEMPLATE_ID, [FILENAME])`

Generates PDF file and returns attachment ID. If failed, then returns NULL. TEMPLATE_ID is an ID of PDF template.

!!! example

    ```
    $attachmentId = ext\pdf\generate(
        'Lead',
        entity\attribute('id'),
        'pdf-template-id',
        'test.pdf'
    );

    $emailId = record\create('Email',
        'subject', 'Test PDF',
        'body', 'PDF is attached',
        'to', entity\attribute('emailAddress'),
        'attachmentsIds', list($attachmentId)
    );

    ext\email\send($emailId);
    ```

Note, that this won't work for new records in before-create script because a record is not yet created. It will work in Workflows.

## ext\user\sendAccessInfo

`ext\user\sendAccessInfo(USER_ID)`

Send an email with access info to a specific user (via email). A user password will be reset. The user will be promted to specify their 
new password. This function is useful when creating a new user via formula. (as of v7.1)

!!! example

    ```
    $userId = record\create(
        'User',
        'userName', $userName,
        'firstName', $firstName,
        'lastName', $lastName,
        'type', 'portal',
        'portalsIds', list($portalId)
    );

    ext\user\sendAccessInfo($userId);
    ```
    
## ext\calendar\userIsBusy

*As of v7.5.*

`ext\calendar\userIsBusy(USER_ID, FROM, TO, [ENTITY_TYPE, ID])`

Returns TRUE if a user is has calendar activities within a given range. FROM and TO should be date-time strings.

If ENTITY_TYPE and ID specified, then this record will be ignored when checking. Useful when editing an existing record.

!!! example

    ```
    if (entity\isNew() && ext\calendar\userIsBusy(assignedUserId, dateStart, dateEnd)) {
        // throw exception
    }
    ```

## ext\acl\checkEntity

*As of v8.3.*

`ext\acl\checkEntity(USER_ID, ENTITY_TYPE, ID, [ACTION])`

Returns TRUE if a user has access to an entity. Optional ACTION should be one of the values: Create, Read, Edit, Delete, Stream.


## ext\acl\checkScope

*As of v8.3.*

`ext\acl\checkScope(USER_ID, SCOPE, [ACTION])`

Returns TRUE if a user has access to a SCOPE. Optional ACTION should be one of the values: Create, Read, Edit, Delete, Stream.


## ext\acl\getLevel

*As of v8.3.*

`ext\acl\getLevel(USER_ID, SCOPE, ACTION)`

Returns an access level. ACTION should be one of the values: Create, Read, Edit, Delete, Stream.

## ext\acl\getPermissionLevel

*As of v8.3.*

`ext\acl\getPermissionLevel(USER_ID, PERMISSION)`

Returns a permission level.
