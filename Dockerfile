FROM ruby:3.0.3-alpine

RUN apk add --update gcompat build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn ffmpeg imagemagick

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN bundle binstubs --all

COPY package.json /app/package.json
COPY yarn.lock    /app/yarn.lock
RUN yarn install


CMD [ "/bin/bash" ]
