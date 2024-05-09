# app > authentication

## beforeLoginHookClassNameList

Array of hook class names. Fired before logging in before credentials are checked. Can throw an exception. Should implement `Espo\Core\Authentication\Hook\BeforeLogin` interface.

!!! important

    Need to have `__APPEND__` item in the beginning of the array when extending.

## onLoginHookClassNameList

*As of v8.3.*

Array of hook class names. Fired before when a user is found, credentials are fine. Can throw an exception. Should implement `Espo\Core\Authentication\Hook\OnLogin` interface.

!!! important

    Need to have `__APPEND__` item in the beginning of the array when extending.

## onFailHookClassNameList

Array of hook class names. Fired once logging in is failed. Should implement `Espo\Core\Authentication\Hook\OnResult` interface.

!!! important

    Need to have `__APPEND__` item in the beginning of the array when extending.

## onSuccessHookClassNameList

Array of hook class names. Fired once logging in is success (not by auth token). Should implement `Espo\Core\Authentication\Hook\OnResult` interface.

!!! important

    Need to have `__APPEND__` item in the beginning of the array when extending.

## onSuccessByTokenHookClassNameList

Array of hook class names. Fired once logging in by a token is success. Should implement `Espo\Core\Authentication\Hook\OnResult` interface.

!!! important

    Need to have `__APPEND__` item in the beginning of the array when extending.

## onSecondStepRequiredHookClassNameList

Array of hook class names. Fired once first step is success and second step is required. Should implement `Espo\Core\Authentication\Hook\OnResult` interface.

!!! important

    Need to have `__APPEND__` item in the beginning of the array when extending.
