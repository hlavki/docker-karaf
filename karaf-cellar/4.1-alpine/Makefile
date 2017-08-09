.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+CELLAR_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/karaf-cellar:${VER}-alpine -t hlavki/karaf-cellar:4.1-alpine .

deploy: build
	docker push hlavki/karaf-cellar:${VER}-alpine
	docker push hlavki/karaf-cellar:4.1-alpine
