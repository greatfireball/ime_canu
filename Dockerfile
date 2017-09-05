FROM java:8

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential wget

RUN wget https://github.com/marbl/canu/archive/v1.6.tar.gz
RUN tar -xzf v1.6.tar.gz && rm v1.6.tar.gz
RUN cd canu-1.6/src && make -j8

VOLUME /data