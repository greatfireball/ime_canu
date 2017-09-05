FROM java:8

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential wget

RUN wget https://github.com/marbl/canu/archive/v1.5.tar.gz
RUN tar -xzf v1.5.tar.gz && rm v1.5.tar.gz
RUN cd canu-1.5/src && make -j8

VOLUME /data
