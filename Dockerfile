FROM ruby:3.2.2

ENV PORT 3000
ENV APP_HOME /nuuvem

RUN apt-get update -qq
RUN apt-get install -y curl dirmngr apt-transport-https lsb-release ca-certificates build-essential libpq-dev

# Install node 14
RUN curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh
RUN sh ./setup_14.sh
RUN apt update
RUN apt install nodejs

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

# Copy lib files to third party folder
COPY lib/ $APP_HOME/vendor/

ADD Gemfile* $APP_HOME/
RUN gem install bundler:2.1.4 --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

ADD . $APP_HOME

RUN bundle install

COPY ./bin/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE $PORT