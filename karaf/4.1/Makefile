.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+KARAF_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/karaf:${VER} -t hlavki/karaf:4.1 -t hlavki/karaf:4 -t hlavki/karaf .

deploy: build
	docker push hlavki/karaf:${VER}
	docker push hlavki/karaf:4.1
	docker push hlavki/karaf:4
	docker push hlavki/karaf
