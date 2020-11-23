# VoIP Troubleshooting

In this article:

* [How to report](#how-to-report)
* [VoIP error debug](#voip-error-debug)
* [Asterisk: The popup window is not displayed](#asterisk-the-popup-window-is-not-displayed)
* [Configure Starface/Asterisk CRON on Windows](#configure-starfaceasterisk-cron-on-windows)

## How to report

1. Provide an EspoCRM log file with the [debug error information](#voip-error-debug).
2. Provide an error description from the VoIP server side (if you have an access to a debugger or logger).
3. Provide steps to reproduce the error.
4. Provide screenshots with:
  1. Administration > Integrations > VoIP integration configs;
  2. Administration > VoIP Routing > Your VoIP number;
  3. Defined phone numbers in the user profile (if a user can't make or recieve a call).
5. Describe details of this call:
  1. Time of the call;
  2. Caller phone number;
  3. Called phone number.

## VoIP error debug

1. Enable debug mode as described [here](https://docs.espocrm.com/administration/troubleshooting/#enabling-debug-mode-for-a-logger).
2. Reproduce an error again.
3. Get an EspoCRM [log file](https://docs.espocrm.com/administration/troubleshooting/#check-logs) and send it to the support team.

## Asterisk: The popup window is not displayed

To be able to make / receive calls with the popup window, please follow these steps:

1. Configure Asterisk [server](https://www.espocrm.com/features/asterisk-integration-setup/#setup).

2. Setup a connector [cron job](https://www.espocrm.com/features/asterisk-integration-setup/#cron).

3. Configure [user internal number](https://www.espocrm.com/features/asterisk-integration-setup/#user-setup). In some cases, Asterisk server doesn't provide internal number, but you can add other user numbers in his [profile](https://www.espocrm.com/features/asterisk-integration-setup/#additional-phone-numbers).

4. Run your SIP client.

Now, you can make calls from SIP client or from EspoCRM.

## Configure Starface/Asterisk CRON on Windows

1. Create a Batch file (e.g. starface.bat, asterisk.bat, etc.). Add this commands to the file:

**For Starface:**
```
@ECHO OFF
cd C:\xampp\htdocs\espo\ && C:\xampp\php\php.exe -f command.php voip Starface
```
**For Asterisk**:
```
@ECHO OFF
cd C:\xampp\htdocs\espo\ && C:\xampp\php\php.exe -f command.php voip Asterisk
```
2. Add this Batch file to a Windows Task Scheduler. Set schedule to execute script every minute.

*Batch file commands explenation:*
- `@ECHO OFF` - disable command prompt;
- `cd C:\xampp\htdocs\espo\` - switch to the EspoCRM root directory;
- `C:\xampp\php\php.exe` - run PHP CLI from the `C:\xampp\php\` directory.

**Note.** The example above provided for the XAMPP environment. Path to the EspoCRM instance and PHP execution file may be different in the other environments.
