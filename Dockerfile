FROM ruby:2.6.6

ENV APP_HOME /digging_manager

RUN apt-get update -qq && \
    apt-get install -y postgresql-client vim && \
    apt-get install curl imagemagick -y && \
    apt-get install -y libvips-tools

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install nodejs -y && \
    npm install yarn -g

COPY Gemfile Gemfile.lock .ruby-version ./

RUN bundle check || bundle install

COPY package.json yarn.lock ./

COPY . $APP_HOME

RUN yarn install

EXPOSE 3000
