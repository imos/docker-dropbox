FROM ubuntu:14.04
MAINTAINER Kentaro Imajo <docker@imoz.jp>
RUN useradd --home-dir=/home/cloud-admin --create-home --uid=20601 --user-group --shell=/bin/bash cloud-admin
RUN apt-get update -qq && apt-get install -y wget
RUN mkdir -p /config
RUN wget -O /config/dropbox.tar.gz "https://www.dropbox.com/download?plat=lnx.x86_64"
ADD config/setup.sh /config/setup.sh
CMD sudo --user=cloud-admin --login -- /home/cloud-admin/.dropbox-dist/dropboxd
