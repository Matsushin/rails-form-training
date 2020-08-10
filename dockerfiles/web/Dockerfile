FROM ruby:2.6.5

RUN apt-get update && \
  apt-get install -y build-essential libpq-dev vim && \
  gem install bundler

WORKDIR /var/www/web

COPY ./web/Gemfile .
COPY ./web/Gemfile.lock .

RUN bundle install

COPY ./web .

COPY ./services.sh /var/www/scripts/
RUN chmod +x /var/www/scripts/services.sh

CMD ["/var/www/scripts/services.sh"]

