# Arnaldo Bot

A simple bot for helping you with your financial life, read more [here](http://karreiro.com/2018/09/25/financial-bot.html).


## Demo
[![Demo](http://karreiro.com/assets/demo-bot.gif "Demo")](http://karreiro.com/assets/demo-bot.gif)


## Configuring

Configure an instance of the bot by following the next 3 simple steps:

### 1) Telegram environment variables

First of all, configure the **TELEGRAM_TOKEN** and the **TELEGRAM_ID** environment variables.

You'll need to create a bot on Telegram, by adding the *BotFather* and following the instructions there. He will help you with everything and, in the end, you will get the bot token.

Considering that the token is something like `"111111111:AAAAaa11aaaaAA1aAAaAA1AAaAaaaAaaaAA"`, the **TELEGRAM_TOKEN** value must be `"bot111111111:AAAAaa11aaaaAA1aAAaAA1AAaAaaaAaaaAA"` (noticed that it's necessary to add the word _bot_ in the beginning).

For the **TELEGRAM_ID**, variable, which your user id, you can ask for it to the @jsondumpbot ;-)


### 2) Google API environment variables

The variables configured in this steps are: **GOOGLE_ACCOUNT_TYPE**, **GOOGLE_CLIENT_EMAIL** and **GOOGLE_PRIVATE_KEY**.

First, go to [Google Developers Console](https://console.developers.google.com/project), click the Library section, enable Google Sheets API, and finally, in the Service account section, create a service account without roles, with the "G Suite Domain-wide Delegation" enabled.

Finally, click on the "Create key" button and Download the JSON file with the three variables that we need.


### 3) The spreadsheet

Create a spreadsheet on Google Drive. The URL is something like this `https://docs.google.com/spreadsheets/d/AAAAAA/edit`, and the `AAAAAA` is the **SPREADSHEET_ID** that we're looking for.

Finally, share the spreadsheet with the e-mail from the **GOOGLE_CLIENT_EMAIL** variable, and boom! It's done :-)


## Contributing
  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create a new Pull Request
