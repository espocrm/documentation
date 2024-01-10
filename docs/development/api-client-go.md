# API Client implementation in Go

- [API Key authentication](#using-api-key-authentication)
- [Basic authentication](#using-basic-authentication)
- [Making a list GET request](#making-a-list-get-request)
- [Making a read GET request](#making-a-read-get-request)
- [Making a create POST request](#making-a-create-post-request)
- [Making an update PUT request](#making-an-update-put-request)
- [Making a delete DELETE request](#making-a-delete-delete-request)

For the source code, refer to [GitHub](https://github.com/definitepotato/espocrm).

## Using API Key Authentication

```go
import "github.com/definitepotato/espocrm"

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithApiKeyAuth("Your API Key here"),
)
```

## Using Basic Authentication

(**this is highly discouraged**)

```go
import "github.com/definitepotato/espocrm"

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithBasicAuth("username", "password"),
)
```

## Making a list GET request

```go
import "github.com/definitepotato/espocrm"

parameters := espocrm.NewParameters(
    espocrm.SetWhere([]espocrm.Where{
        {
            Type: espocrm.Equals,
            Attribute: "myAttribute",
            Value: "myValue",
        },
    }),
)

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithApiKeyAuth("Your API Key here"),
)

contacts, err := client.List("Contact", parameters)
```

## Making a read GET request

```go
import "github.com/definitepotato/espocrm"

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithApiKeyAuth("Your API Key here"),
)

contact, err := client.Read("Contact", "78abc123def456")
```

## Making a create POST request

```go
import "github.com/definitepotato/espocrm"

newContact := `"{ "name": "Test", "assignedUserId": "1" }"`

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithApiKeyAuth("Your API Key here"),
)

attributes, err := client.Create("Contact", newContact)
```

## Making an update PUT request

```go
import "github.com/definitepotato/espocrm"

updatePayload := `"{ assignedUserId": "1" }"`

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithApiKeyAuth("Your API Key here"),
)

attributes, err := client.Update("Contact", updatePayload)
```

## Making a delete DELETE request

```go
import "github.com/definitepotato/espocrm"

client := espocrm.NewApiClient(
    "https://espocrm.example.com",
    espocrm.WithApiKeyAuth("Your API Key here"),
)

status, err := client.Delete("Contact", "78abc123def456")
```
