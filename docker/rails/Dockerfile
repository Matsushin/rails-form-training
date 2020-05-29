FROM ruby:2.6.5
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
                       build-essential \
                       libpq-dev \
                       nodejs \
                       default-mysql-client-core \
                       default-libmysqlclient-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn
RUN curl -SL https://deb.nodesource.com/setup_9.x | bash
RUN apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app
ADD ./Gemfile /app/Gemfile
ADD ./Gemfile.lock /app/Gemfile.lock
RUN cat Gemfile.lock | tail -1 | tr -d " " > BUNDLER_VERSION
RUN gem update --system && gem install bundler -v `cat BUNDLER_VERSION`
#RUN bundle config set without 'test development local'
RUN bundle install --jobs=4
ADD . /app

EXPOSE 3000
# 次の行は本番環境でしか実行されない
CMD ["unicorn", "-p", "3000", "-c", "/app/config/unicorn.rb", "-E", "production"]