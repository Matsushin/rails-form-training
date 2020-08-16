#!/bin/bash

chmod -R 777 /var/www/web/tmp/cache
chmod -R 777 /var/www/web/log
chmod -R 777 /var/www/web/db/schema.rb
rm -rf /var/www/web/tmp/pids/*

export DISABLE_SPRING=1
export RAILS_LOG_TO_STDOUT=1

bundle install
bundle exec rails db:create
bundle exec rails db:migrate
ls -all /var/www/web/public/packs/js
ls -all /var/www/web/public/assets
# bundle exec rails db:seed

bundle exec rails s -p 3000 -b '0.0.0.0'

