# Formula > Functions > Password

## password\generate

`password\generate()`

Generates and returns a password.

## password\hash

`password\hash(PASSWORD)`

Hashes a password. You need to hash the password before setting *password* field of *User* record.

Example:

```
$password = password\generate();
$hash = password\hash($password);
```
