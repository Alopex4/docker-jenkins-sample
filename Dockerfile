#FROM ubuntu:16.04
#MAINTAINER James Turnbull "james@example.com"
#ENV REFRESHED_AT 2016-06-01
#RUN apt-get update
#RUN apt-get -y install ruby rake
#RUN gem install --no-rdoc --no-ri rspec ci_reporter_rspec

FROM ubuntu:16.04
MAINTAINER alfie
ENV REFRESHED_AT 2014-06-01
RUN apt-get update && apt-get -yqq install wget curl gnupg2 libcurl3 build-essential redis-tools \
zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN cd /tmp
RUN wget --no-check-certificate https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz
RUN tar -zxvf ruby-2.5.0.tar.gz && cd ruby-2.5.0 && ./configure --prefix=/usr/local && make && make install
RUN ln -s /usr/local/bin/ruby /usr/bin/ruby
RUN gem install --no-rdoc --no-ri rspec ci_reporter_rspec
