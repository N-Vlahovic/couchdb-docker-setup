# Dockerfile
FROM couchdb:latest

ENV HOME /home/dbusr

RUN apt-get install curl
RUN useradd --create-home dbusr
RUN mkdir -p $HOME

WORKDIR $HOME

ADD ./db_setup.sh $HOME
RUN ["chmod", "+x", "./db_setup.sh"]
# RUN ["./db_setup.sh"]
