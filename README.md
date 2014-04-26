# Forward Me

A simple self-hosted e-mail forwarder making use of the Sendgrid Parse API

## Requirements
- Ruby 1.9.3 (or newer)
- Rails 4.1
- Postgres (we make use of Postgres arrays to store forwarding
recipients)

## Installation
- Clone this repo locally: `git clone git@github.com:jayzes/forward-me.git`
- Set up a new Heroku app and push to it: `heroku create <my-forward-me-instance> && git push heroku master`
- Configure a secret key for the app: `heroku config:set SECRET_KEY_BASE=\`rake secret\``
- Configure the Sendgrid starter addon: `heroku addons:add sendgrid`
- Configure an inbound parse API redirect in the Sendgrid addon settings. You'll
  need to customize your MX records as well, but the URL will be
  `https://your-heroku-app.herokuapp.com/email_processor`
- Configure your sending address - something like `forwarder@yourdomain.com`: heroku config:set FORWARDING_FROM_ADDRESS=forwarder@yourdomain.com`
- Set up some forwards to send. Right now this is done manually in the console: `ForwardingAddress.create! source_emails: [ 'info@example.com' ], recipient_emails: [ 'somebody@example.com' ]`

## LICENSE
MIT
