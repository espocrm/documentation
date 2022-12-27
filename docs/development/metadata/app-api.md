# app > api

Path: metadata > app > api.

*As of v7.4.*

Definitions for API framework.

Provides the ability to add middlewares for all requests, specific routes, controllers and controller actions. Supporting the PSR-15 standard means that it's possible to use 3rd party middlewares, like [these](https://github.com/middlewares/psr15-middlewares). If a middleware you want to use has dependencies in a constructor, use DI binding to resolve them.

Example:

```json
{
    "globalMiddlewareClassNameList": [
        "Espo\\Custom\\Classes\\ApiMiddlewares\\Test1",
        "Espo\\Custom\\Classes\\ApiMiddlewares\\Test2"
    ],
    "routeMiddlewareClassNameListMap": {
        "get_/:controller": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test3"
        ]
    },
    "controllerMiddlewareClassNameListMap": {
        "Contact": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test4"
        ]
    },
    "controllerActionMiddlewareClassNameListMap": {
        "Contact_get_index": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test5"
        ],
        "Contact_post_create": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test6"
        ],
        "Contact_put_update": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test6"
        ],
        "Contact_get_read": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test7"
        ],
        "Contact_delete_delete": [
            "Espo\\Custom\\Classes\\ApiMiddlewares\\Test8"
        ]
    }
}

```

## globalMiddlewareClassNameList

*class-string<Psr\Http\Server\MiddlewareInterface>[]*

A class list of global middlewares. Global middlewares applied for all API requests. Processed before authentication.

## routeMiddlewareClassNameListMap

*Object.<string, class-string<Psr\Http\Server\MiddlewareInterface>[]>*

Middlewares for specific routes. Keys are composed in the form: `{method}_{route}`. Processed before authentication.

## controllerMiddlewareClassNameListMap

*Object.<string, class-string<Psr\Http\Server\MiddlewareInterface>[]>*

Middlewares for specific controllers. A controller-name => class-string-list map. Processed after authentication.

## controllerActionMiddlewareClassNameListMap

*Object.<string, class-string<Psr\Http\Server\MiddlewareInterface>[]>*

Middlewares for specific controller actions. Keys are composed in the form: `{ControllerName}_{method}_{actionName}`. Processed after authentication.
