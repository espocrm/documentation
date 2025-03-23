# App Secrets

*As of v9.0.*

Applications secrets allow you to securely store sensitive values in Espo, such as API keys and passwords. To access them, go to: Administration > App Secrets.

Secrets are stored as instances of the *AppSecret* entity type. It's possible to read them from code and a Formula script.

## Reading in Formula

Example:

```
$secretValue = null;

$secretId = record\findOne('AppSecret', null, null, 'name', 'SECRET_NAME');

if ($secretId) {
    $secretValue = record\attribute('AppSecret', $secretId, 'value');
}
```

## Using in Workflows

In the *Send HTTP Request* action, it's possible to insert secrets into headers using the placeholder *{#secrets.name}*. Where *name* is the secret's name.
