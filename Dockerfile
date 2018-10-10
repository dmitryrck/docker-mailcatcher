from alpine:latest

run apk add --update --no-cache \
  build-base ruby-dev ruby ruby-bundler sqlite-dev && \
  gem install --no-ri --no-rdoc json mailcatcher

expose 1025

cmd ["mailcatcher", "-f", "-v", "--ip", "0.0.0.0"]
