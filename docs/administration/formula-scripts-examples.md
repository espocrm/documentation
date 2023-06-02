# Formula Scripts Examples

* [Creating new user](#creating-new-user)
* [Sending email with generated PDF in attachment](#sending-email-with-generated-pdf-in-attachment)


## Creating new user

```
// assuming we have $userName and $emailAddress variables defined above

$password = password\generate();
$hash = password\hash($password);

$userId = record\create('User',
    'userName', $userName,
    'password', $hash,
    'emailAddress', $emailAddress
);

$emailBody = string\concatenate(
    'Username: ', $userName, '\n',
    'Password: ', $password, '\n'
);

$emailId = record\create(
    'Email',
    'to', $emailAddress,
    'status', 'Sending',
    'subject', 'Access info',
    'body', $emailBody,
    'isHtml', false
);

ext\email\send($emailId);
```

## Sending email with generated PDF in attachment

```
$attachmentId = ext\pdf\generate(
    'Quote', entity\attribute('id'), 'copy-pdf-template-id-here', 'test.pdf'
);

$emailId = record\create('Email',
    'to', entity\attribute('emailAddress'),
    'attachmentsIds', list($attachmentId)
);

// applying email template
ext\email\applyTemplate($emailId, 'copy-email-template-id-here');

ext\email\send($emailId);
```
