FROM alpine:3

ARG ROCKSDB_VERSION=v6.14.6

RUN apk update
RUN apk add zlib-dev bzip2-dev lz4-dev snappy-dev zstd-dev gflags-dev
RUN apk add build-base linux-headers git bash perl

RUN mkdir /usr/src
WORKDIR /usr/src

RUN git clone --depth 1 --branch ${ROCKSDB_VERSION} https://github.com/facebook/rocksdb.git

# Fix install '-c' flag
RUN sed -i 's/install -C/install -c/g' Makefile

WORKDIR /usr/src/rocksdb
RUN make shared_lib
RUN make install-shared

WORKDIR /
RUN rm -rf /usr/src/rocksdb
