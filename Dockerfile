FROM ruby:3.0.3-alpine

RUN apk add --update gcompat build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN bundle binstubs --all

RUN touch $HOME/.bashrc

RUN echo "alias ll='ls -alF'" >> $HOME/.bashrc
RUN echo "alias la='ls -A'" >> $HOME/.bashrc
RUN echo "alias l='ls -CF'" >> $HOME/.bashrc
RUN echo "alias q='exit'" >> $HOME/.bashrc
RUN echo "alias c='clear'" >> $HOME/.bashrc

COPY package.json /app/package.json
COPY yarn.lock    /app/yarn.lock
RUN yarn install --ignore-engines

CMD [ "/bin/bash" ]
