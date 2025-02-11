# API Client implementation in Rust

* [Installation](#installation)
* [HMAC authorization](#hmac-authorization)
* [API Key authorization](#api-key-authorization)
* [Basic authorization](#basic-authorization)
* [Making a request](#making-a-request)

!!! note

    This is an unofficial (3rd party) client.

For the full documentation, refer to [docs.rs](https://docs.rs/espocrm-rs/latest/espocrm_rs/).
For the source code, refer to [GitHub](https://github.com/TobiasDeBruijn/espocrm-rs).

## Installation
[![Crates.io](https://img.shields.io/crates/v/espocrm-rs)](https://crates.io/crates/espocrm-rs)  
The crate is on crates.io, so you can add it by adding it to your `[dependencies]` in your Cargo.toml:
```toml
[dependencies]
espocrm-rs = "0.2.0"
```

For the latest version, refer to [crates.io](https://crates.io/crates/espocrm-rs).

## HMAC authorization

```rust
use espocrm_rs::EspoApiClient;

let client = EspoApiClient::new("https://espocrm.example.com")
    .set_api_key("Your API Key here")
    .set_secret_key("Your API Secret")
    .build();
```
## API Key authorization

```rust
use espocrm_rs::EspoApiClient;
let client = EspoApiClient::new("https://espocrm.example.com")
    .set_api_key("Your API Key here")
    .build();
```

## Basic authorization

```rust
use espocrm_rs::EspoApiClient;
let client = EspoApiClient::new("https://espocrm.example.com")
    .set_username("Your Username here")
    .set_password("Your Password here")
    .build();
```

## Making a request

To make a GET request, you need to know a couple things:

- the request method to use;
- on what to perform the request;
- optionally, any data needed for the request.

```rust
use espocrm_rs::{EspoApiClient, Params, Where, FilterType, Value, NoGeneric};
use reqwest::Method;

let params = Params::default()
    .set_offset(0)
    .set_where(vec![
        Where {
            r#type: FilterType::IsTrue,
            attribute: "exampleField".to_string(),
            value: None
        },
        Where {
            r#type: FilterType::ArrayAnyOf,
            attribute: "exampleField2".to_string(),
            value: Some(Value::array(vec![
                Value::str("a"),
                Value::str("b"),
                Value::str("c")
            ]))
        }
    ])
    .build();

let client = EspoApiClient::new("https://espocrm.example.com")
    .set_secret_key("Your Secret Key")
    .set_api_key("Your api key")
    .build();

let result = client.request::<NoGeneric>(Method::GET, "Contact".to_string(), Some(params), None);
```

A POST, PUT, etc request is very similar:
```rust
use espocrm::EspoApiClient;
use reqwest::Method;
use serde::Serialize;

#[derive(Serialize)]
struct MyData {
    some_value: String,
    some_other_value: i64
}

let client = EspoApiClient::new("https://espocrm.example.com")
    .set_secret_key("Your Secret Key")
    .set_api_key("Your api key")
    .build();

let data = MyData {
    some_value: "value".to_string(),
    some_other_value: 10
}

let result = client.request(Method::POST, "Contact".to_string(), None, Some(data));
```

The MyData struct here will be serialized into JSON data using Serde's Serialize trait.
