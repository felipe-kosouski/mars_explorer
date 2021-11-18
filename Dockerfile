FROM ruby:3.0.2-alpine

WORKDIR /app
COPY . /app

CMD [ "irb", "-r", "./mars_explorer.rb" ]