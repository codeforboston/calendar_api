FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /calendar_api
WORKDIR /calendar_api
ADD Gemfile /calendar_api/Gemfile
ADD Gemfile.lock /calendar_api/Gemfile.lock
RUN bundle install
ADD . /calendar_api
