FROM ruby:2.6.5

RUN apt-get update && \
  apt-get install -y build-essential libpq-dev vim nodejs npm && \
  gem install bundler

WORKDIR /var/www/web

COPY Gemfile .
COPY Gemfile.lock .

RUN npm install -g yarn
RUN bundle install

COPY ./ .
RUN RAILS_ENV=production SECRET_KEY_BASE=1 bundle exec rails assets:precompile
RUN ls -all /var/www/web/public/packs/js
RUN ls -all /var/www/web/public/assets

COPY ./services.sh /var/www/scripts/
RUN chmod +x /var/www/scripts/services.sh

CMD ["/var/www/scripts/services.sh"]

