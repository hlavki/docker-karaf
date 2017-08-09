.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+KARAF_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/karaf:${VER}-alpine -t hlavki/karaf:4.0-alpine .

deploy: build
	docker push hlavki/karaf:${VER}-alpine
	docker push hlavki/karaf:4.0-alpine
