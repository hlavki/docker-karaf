.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+KARAF_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/karaf:${VER} -t hlavki/karaf:4.0 .

deploy: build
	docker push hlavki/karaf:${VER}
	docker push hlavki/karaf:4.0
