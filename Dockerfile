FROM ruby:3.2.0-alpine

RUN addgroup -g 1000 -S deployer && \
    adduser -u 1000 -S deployer -G deployer

RUN apk add --update --no-cache \
    gcc g++ make git libffi-dev \
    libpq postgresql-dev tzdata \
    build-base nodejs yarn

WORKDIR /home/deployer/quote-editor

RUN chown deployer:deployer -R /home/deployer/quote-editor

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

USER deployer

RUN pwd

COPY Gemfile* ./

RUN bundle install && gem install foreman

COPY . .

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
