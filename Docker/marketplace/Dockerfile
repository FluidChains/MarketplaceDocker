FROM ruby:2.6.3

ARG railsEnv
ARG rackEnv
ARG gitUrl
ARG hostAppDir

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
 apt-get install -y build-essential \
 libpq-dev nodejs 

run apt install -y yarn

RUN gem install bundler

ENV RAILS_ROOT ${hostAppDir}
RUN mkdir -p $RAILS_ROOT 
RUN git clone ${gitUrl} $RAILS_ROOT

# Setting env up
ENV RAILS_ENV=${railsEnv}
ENV RACK_ENV=${rackEnv}

WORKDIR $RAILS_ROOT
RUN bundle version
RUN bundle install

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails","s"]
