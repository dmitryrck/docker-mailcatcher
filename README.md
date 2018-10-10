# Mailcatcher

Add this to your `docker-compose.yml`:

```yaml
  mailcatcher:
    image: dmitryrck/mailcatcher
    ports:
      - "1080:1080"
```

And edit `config/environments/development.rb` like:

```ruby
  config.action_mailer.smtp_settings = {
    address: ENV.fetch("MAILCATCHER_HOST", "localhost"),
    port: 1025
  }
```

Access [http://127.0.0.1:1080/](http://127.0.0.1:1080/).

For more information see [https://mailcatcher.me/](https://mailcatcher.me/).
