.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+KARAF_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/kafka:${VER}-alpine -t hlavki/karaf:4.1-alpine -t hlavki/karaf:4-alpine .

deploy: build
	docker login
	docker push -t hlavki/kafka:${VER}-alpine -t hlavki/karaf:4.1-alpine -t hlavki/karaf:4-alpine
