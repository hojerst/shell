.PHONY: build

VERSION=latest

build:
	docker build . -t hojerst/shell:${VERSION}
