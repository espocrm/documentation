# Password recovery by user

If user has forgotten his password and wants to recover it on his own, he needs to do the following:

1. Go to the login page and click **Forgot Password?**.
2. Enter login and email, then click **Submit**.

After that, user will receive an email with a link, which he must follow to enter a new password and confirm it.

---

**Important:** It is advisable not to delete the email sent to you with a link to reset your password until you have finally changed your password. Because EspoCRM has a setting that prevents new requests from being created (1 request per 3 hours) until you follow the link in the first password recovery request and complete this operation.

For example, you requested password recovery and did not find the email or accidentally deleted it. In this case, you will need to wait 3 hours before you can request a new password reset.

Note that administrator can change the password for a regular user as many times in a row as he likes.
