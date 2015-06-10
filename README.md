# HR-TIL

Welcome to the Hashrocket 'Today I Learned' repository. The purpose of this project is to document our learning and publish it to the world through concise blog posts.

### Install

```
hclone hr-til
rake db:setup
rails s
```

An optional setup task is to get a copy of the production database (requires Heroku access):

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

1. We have two incoming webhooks in the API, 'tilbot' (posts to #til, production only) and 'tilbot-testbot' (posts to #testing, all other environments)
2. Set `slack_post_endpoint` to the path of the webhook (e.g. the part after the domain) for the appropriate bot
