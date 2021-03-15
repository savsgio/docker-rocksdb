FROM alpine:3

ARG ROCKSDB_VERSION=v6.16.3

RUN apk update
RUN apk add --no-cache zlib-dev bzip2-dev lz4-dev snappy-dev zstd-dev gflags-dev
RUN apk add --no-cache build-base linux-headers git bash perl

RUN mkdir /usr/src
WORKDIR /usr/src

RUN git clone --depth 1 --branch ${ROCKSDB_VERSION} https://github.com/facebook/rocksdb.git
WORKDIR /usr/src/rocksdb

# Fix 'install -c' flag
RUN sed -i 's/install -C/install -c/g' Makefile

RUN make shared_lib
RUN make install-shared

WORKDIR /

# Clean
RUN apk del build-base linux-headers git bash perl
RUN rm -rf /usr/src/rocksdb
