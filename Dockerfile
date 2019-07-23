FROM ruby:2.6.3

LABEL maintainer="tmmgarcia7@gmail.com"

ARG APP_DIR=/usr/src/app/

RUN apt-get update && \
  apt-get -qq install -y \
  build-essential \
  libpq-dev \
  nodejs

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR

COPY Gemfile* $APP_DIR

RUN bundle install

COPY . /myapp
