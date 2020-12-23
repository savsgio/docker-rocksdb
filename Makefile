.PHONY: all get build clean run
.DEFAULT_GOAL: $(BIN_FILE)

PROJECT_NAME = rocksdb

default: build

build:
	docker build -f ./Dockerfile -t savsgio/alpine-rocksdb .
