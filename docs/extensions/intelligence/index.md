---
search:
  boost: 2
tags:
  - ai
  - llm
---

# Intelligence


The Intelligence [extension](https://www.espocrm.com/extensions/intelligence/) integrates EspoCRM with AI providers:

- OpenAI
- Gemini
- Claude

The extension provides the following AI features:

- [Summary](#summary)
- [Intelligent Paste](#intelligent-paste)
- [AI Email Composer](#ai-email-composer)
- [AI formula functions](ai-formula-functions.md)

Additionally, it provides the [usage log and quota](usage-and-quota.md) features.

## Setting up

Under Administration > Intelligence panel > Settings, select the default AI model: click plus button to create a new
model entry.

Enter API credentials for the selected provider under: Administration > Integrations.

### Model per feature

You can optionally override the model per feature. This allows for optimizing cost and quality,
as different models may perform better on specific tasks.

## Features

### Summary

The Summary feature can be enabled per entity type under: Administration > Entity Manager > {Entity Type} > Edit.

Users with access to the *Intelligent Summary* role scope will be able to summarize records. After enabling the feature,
the button appears in the top-right corner in the record detail view.

The summary output includes:

- Short summary
- Summary
- Sentiment
- Actions

The user can create an internal stream post with the summary or copy the summary to the clipboard.

The record name, description and stream history are provided to the AI as context.

### Intelligent Paste

The Intelligent Paste feature can be enabled per entity type under: Administration > Entity Manager > {Entity Type} > Edit.

Users with access to the *Intelligent Paste* role scope can use AI to extract data from input text and populate records.

After enabling this feature, a clipboard icon button appears in the top-right corner when creating or editing a record.

Clicking the button opens a modal window prompting the user to paste text from the clipboard.
Alternatively, the user can switch to Compose mode, which allows manual text input.

AI will attempt to extract record data from the input.
The extracted fields are then listed, allowing the user to uncheck fields they do not want to apply.

After clicking the Apply button (or pressing Ctrl + Enter), the extracted data is applied to the record form.

### AI Email Composer

Enables the ability to compose emails with AI.

The *AI Email Composer* feature can be enabled in settings at Administration > Intelligence panel > Settings.

Users with access to the *Intelligent Composer* role scope can use AI to compose emails.

When composing an email in the modal window, the *AI Composer* button is available at the top right.

The user can choose the desired tone and length and provide instructions.
Then, they can generate a message by clicking the Compose button (or pressing Ctrl + Enter).
Once the result is available, clicking the Apply button (or pressing Ctrl + Enter) copies the content to the email body.

The parent record description and stream history are provided to the AI as context.
