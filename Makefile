.PHONY: build clean

VERSION=latest
IMAGE=hojerst/shell

build:
	docker build . -t $(IMAGE):$(VERSION)

clean:
	docker builder prune -af

test:
	container-structure-test test -c container-structure-test.yml -i $(IMAGE):$(VERSION)
