ARG osversion=8
FROM openjdk:${osversion}

ARG VERSION=master
ARG VCS_REF
ARG BUILD_DATE

RUN echo "VCS_REF: "${VCS_REF}", BUILD_DATE: "${BUILD_DATE}", VERSION: "${VERSION}

LABEL maintainer="frank.foerster@ime.fraunhofer.de" \
      description="Dockerfile providing the canu assembler for long reads" \
      version=${VERSION} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/greatfireball/ime_canu.git"

RUN apt-get update && \
    apt-get --yes install \
       build-essential \
       wget \
       gnuplot && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log

WORKDIR /opt
RUN wget -O - https://github.com/marbl/canu/archive/v1.6.tar.gz | \
    tar -xzf - && \
    cd canu-1.6/src && \
    make -j8

ENV PATH=/opt/canu-1.6/Linux-amd64/bin:${PATH}

VOLUME /data
WORKDIR /data
