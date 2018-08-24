FROM ruby
COPY . EMA_api
WORKDIR EMA_api
RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends nodejs
RUN bundle install
run rake db:setup
ENTRYPOINT rails server
EXPOSE 3000
