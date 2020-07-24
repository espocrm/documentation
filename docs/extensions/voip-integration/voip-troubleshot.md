# VoIP Troubleshooting

In this article:
* [How to report](#how-to-report)
* [VoIP error debug](#voip-error-debug)
* [Asterisk: The popup window is not displayed](#asterisk-the-popup-window-is-not-displayed)

## How to report

1. Provide an EspoCRM log file with the [debug error information](#voip-error-debug).
2. Provide an error description from the VoIP server side (if you have an access to a debugger or logger).
3. Provide steps to reproduce the error.
4. Provide screenshots with:
    * Administration > Integrations > VoIP integration configs;
    * Administration > VoIP Routing > Your VoIP number;
    * Defined phone numbers in the user profile (if a user can't make or recieve a call).
5. Describe details of this call:
    * Time of the call;
    * Caller phone number;
    * Called phone number.

## VoIP error debug

1. Enable debug mode as described [here](https://docs.espocrm.com/administration/troubleshooting/#enabling-debug-mode-for-a-logger).
2. Reproduce an error again.
3. Get EspoCRM [log file](https://docs.espocrm.com/administration/troubleshooting/#check-logs) and send it to the support team.

## Asterisk: The popup window is not displayed

To be able to make / receive calls with the popup window, please follow these steps:

1. Configure Asterisk [server](https://www.espocrm.com/features/asterisk-integration-setup/#setup).

2. Setup a connector [cron job](https://www.espocrm.com/features/asterisk-integration-setup/#cron).

3. Configure [user internal number](https://www.espocrm.com/features/asterisk-integration-setup/#user-setup). In some cases, Asterisk server doesn't provide internal number, but you can add other user numbers in his [profile](https://www.espocrm.com/features/asterisk-integration-setup/#additional-phone-numbers).

4. Run your SIP client.

Now, you can make calls from SIP client or from EspoCRM.
