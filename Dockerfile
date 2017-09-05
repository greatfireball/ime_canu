FROM java:8

LABEL maintainer="frank.foerster@ime.fraunhofer.de"
LABEL description="Dockerfile providing the canu assembler for long reads"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential wget gnuplot

RUN wget https://github.com/marbl/canu/archive/v1.3.tar.gz
RUN tar -xzf v1.3.tar.gz && rm v1.3.tar.gz
RUN cd canu-1.3/src && make -j8

ENV PATH=/canu-1.3/bin:${PATH}

VOLUME /data
