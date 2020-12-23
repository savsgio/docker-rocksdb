FROM alpine:3

ARG ROCKSDB_VERSION=v6.14.6

RUN apk update
RUN apk add zlib-dev bzip2-dev lz4-dev snappy-dev zstd-dev
RUN apk add build-base linux-headers git gflags-dev bash perl

RUN mkdir /usr/src
WORKDIR /usr/src

RUN git clone --depth 1 --branch ${ROCKSDB_VERSION} https://github.com/facebook/rocksdb.git

WORKDIR /usr/src/rocksdb
RUN make static_lib
