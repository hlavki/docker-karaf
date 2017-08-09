.DEFAULT_GOAL := build
.PHONY: build deploy

VER := $(shell sed -n -e 's/^.\+CELLAR_VERSION\s\+\(.\+\)/\1/p' < Dockerfile)

build:
	docker build -t hlavki/karaf-cellar:${VER} -t hlavki/karaf-cellar:4.0 .

deploy: build
	docker push hlavki/karaf-cellar:${VER}
	docker push hlavki/karaf-cellar:4.0
