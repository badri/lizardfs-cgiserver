FROM      ubuntu:14.04
MAINTAINER Lakshmi Narasimhan <badri.dilbert@gmail.com>

RUN apt-get -y install wget

RUN wget http://packages.lizardfs.com/lizardfs.key 
RUN apt-key add lizardfs.key

RUN echo "deb http://packages.lizardfs.com/ubuntu/trusty trusty main" > /etc/apt/sources.list.d/lizardfs.list
RUN echo "deb-src http://packages.lizardfs.com/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/lizardfs.list

RUN apt-get -y update

RUN apt-get install -y lizardfs-cgiserv

EXPOSE 9425

RUN sed -i 's/LIZARDFSCGISERV_ENABLE=false/LIZARDFSCGISERV_ENABLE=true/g'  /etc/default/lizardfs-cgiserv

ENTRYPOINT  ["lizardfs-cgiserver"]
