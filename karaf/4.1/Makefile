.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+KARAF_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/kafka:${VER} -t hlavki/karaf:4.1 -t hlavki/karaf:4 -t hlavki/karaf .

deploy: build
	docker login
	docker push -t hlavki/kafka:${VER} -t hlavki/karaf:4.1 -t hlavki/karaf:4 -t hlavki/karaf
