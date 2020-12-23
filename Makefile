.PHONY: all get build clean run
.DEFAULT_GOAL: $(BIN_FILE)

PROJECT_NAME = rocksdb
VERSION := 6.14.6


default: build

build:
	docker build -f ./Dockerfile --build-arg ROCKSDB_VERSION=$(VERSION) -t savsgio/alpine-rocksdb .
