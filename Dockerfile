FROM ubuntu:14.04

MAINTAINER Y.K. Goon (ykgoon@gmail.com)
# This file can also be cloned from https://github.com/ykgoon/casperjs-docker

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update

# Install node.js
RUN apt-get install -y nodejs

# Install casperjs
RUN npm install -g casperjs
WORKDIR /usr/local/share
RUN apt-get install wget
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN tar xjf phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
RUN ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
RUN apt-get install -y build-essential chrpath git-core libssl-dev libfontconfig1-dev
RUN echo "export NODE_PATH=/usr/lib/node_modules/" >> /root/.bashrc

# Install nodemailer
RUN npm install -g nodemailer
RUN npm install -g nodemailer-smtp-transport

WORKDIR /srv/aristotle

VOLUME ['/srv/aristotle']
