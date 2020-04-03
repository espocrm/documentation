# Sending telegram message with Workflows

Since Advanced Pack version 2.4.0 it’s possible to send HTTP requests with Workflows and BPM tools.

* [Workflow configuration](#workflow-configuration)
* [Telegram configuration](#telegram-configuration)


### Workflow configuration

Create a workflow rule. specify needed conditions and then add action Send HTTP Request.

Set:
**Request Type:** POST

**Content-type:** None

**URL:** https://api.telegram.org/bot<TELEGRAM_BOT_AUTH_TOKEN>/sendMessage

Example: `https://api.telegram.org/bot3457233623:AAGKRIhcGSJ7bKFFh6DJMRWhyRbVBSRS53c/sendMessage`

**Payload:**

```
{
    "chat_id": "CHAT_ID",
    "text": "Created new Contact:\n {$name}/n *Phone number:* {$phoneNumber}",
    "parse_mode": "Markdown"
}
```

* chat_id supports 2 formats:
	- -1003332162016
	- @chat-name
* text supports:
	- plain text.
	- Target Entity variables (e.g. {$description}, {$name}, {$phoneNumber}, etc.).
	- Markdown text. 
* "parse_mode" is optional parameter. Can send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.

You read more about bot request methods and payloads [here](https://core.telegram.org/bots/api).

### Telegram configuration

1. Create a new Telegram chanel.
2. Create a new [Telegram bot](https://core.telegram.org/bots#3-how-do-i-create-a-bot).
3. Add the bot to your Telegram chanel.
4. Add the bot to the chanel admins group.