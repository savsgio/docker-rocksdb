FROM alpine:3

ARG ROCKSDB_VERSION

RUN apk update
RUN apk add zlib-dev bzip2-dev lz4-dev snappy-dev zstd-dev
RUN apk add build-base git gflags-dev bash perl

RUN mkdir /usr/src
WORKDIR /usr/src

RUN git clone --depth 1 --branch v${ROCKSDB_VERSION} https://github.com/facebook/rocksdb.git

WORKDIR /usr/src/rocksdb
RUN make static_lib
