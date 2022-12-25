# app > api

Path: metadata > app > api.

*As of v7.4.*

Definitions for API framework. Middleware classes should implement [PSR-15](https://www.php-fig.org/psr/psr-15/) `Psr\Http\Server\MiddlewareInterface` interface.

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
        ]
    }
}

```

## globalMiddlewareClassNameList

*class-string<Psr\Http\Server\MiddlewareInterface>[]*

A class list of global middlewares. Global middlewares applied for all API requests.

## routeMiddlewareClassNameListMap

*Object.<string, class-string<Psr\Http\Server\MiddlewareInterface>[]>*

Middlewares for specific routes. Keys are composed in the form: `{method}_{route}`.

## controllerMiddlewareClassNameListMap

*Object.<string, class-string<Psr\Http\Server\MiddlewareInterface>[]>*

Middlewares for specific controllers. A controller-name => class-string-list map.

## controllerActionMiddlewareClassNameListMap

*Object.<string, class-string<Psr\Http\Server\MiddlewareInterface>[]>*

Middlewares for specific controller actions. Keys are composed in the form: `{ControllerName}_{method}_{actionName}`.
