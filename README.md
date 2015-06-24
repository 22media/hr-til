# HR-TIL

Welcome to the Hashrocket 'Today I Learned' repository.

TIL is a project by Hashrocket to catalogue the sharing & accumulation of knowledge as it happens day-to-day. Posts have a 200-word limit and any Hashrocket team member can contribute.

### Install

```
hclone hr-til
rake db:setup
rails s
```

An optional setup task is to restore a copy of the production database (requires Heroku access):

```
rake db:restore_production_dump
```

Authentication is managed by Omniauth and Google. Visit '/admin' and log in with your Hashrocket email address.

### Hosting

Staging and production are hosted on Heroku.

* http://hr-til-staging.herokuapp.com
* http://til.hashrocket.com

### Environmental Variables

```
google_client_id
google_client_secret
basic_auth_credentials # required format: username:password
slack_post_endpoint
```

### Slack Integration

1. We have two incoming webhooks in the API, 'tilbot' (production) and 'tilbot-testbot' (all other environments)
2. Set `slack_post_endpoint` to the path of the webhook (e.g. the part after the domain) for the appropriate bot
