# Mailcatcher

Add this to your `docker-compose.yml`:

```yaml
  mailcatcher:
    image: dmitryrck/mailcatcher
    ports:
      - "1080:1080"
```

Edit `config/environments/development.rb` like:

```ruby
  config.action_mailer.smtp_settings = { address: "mailcatcher", port: 1025 }
```

Access [http://127.0.0.1:1080/](http://127.0.0.1:1080/).

For more information see [https://mailcatcher.me/](https://mailcatcher.me/).

## _port is already allocated_

If you receive an error like this:

```
Recreating projectx_mailcatcher_1 ... error

ERROR: for projectx_mailcatcher_1  Cannot start service mailcatcher: b'driver failed programming external connectivity on endpoint projectx_mailcatcher_1 (1064f60adea86c673edd57afb7fbf5a057db74255b965e1585eaa825f0de062b): Bind for 0.0.0.0:1080 failed: port is already allocated'

ERROR: for mailcatcher  Cannot start service mailcatcher: b'driver failed programming external connectivity on endpoint projectx_mailcatcher_1 (1064f60adea86c673edd57afb7fbf5a057db74255b965e1585eaa825f0de062b): Bind for 0.0.0.0:1080 failed: port is already allocated'
ERROR: Encountered errors while bringing up the project.
```

Change the `ports` params:

```yaml
  mailcatcher:
    image: dmitryrck/mailcatcher
    command: "mailcatcher -f -v --ip 0.0.0.0"
    ports:
      - "1081:1080"
```

Access [http://127.0.0.1:1081/](http://127.0.0.1:1081/) or the port that you
have set.

## Use an environment var to configure mailcatcher

Use an environment variable to set the host for mailcatcher:

```ruby
  config.action_mailer.smtp_settings = {
    address: ENV.fetch("MAILCATCHER_HOST", "localhost"),
    port: 1025
  }
```

This way mailcatcher can be used for docker and rvm/rubyenv/chruby users.
Docker users set `MAILCATCHER_HOST=mailcatcher` and rvm users don't.

## Special thanks

* [Mateus Pontes](https://github.com/mateuspontes).
