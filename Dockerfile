FROM ubuntu:noble

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy libxtst6 \
libxt-dev libglib2.0-0 libfreetype6 libxrender1 fontconfig

