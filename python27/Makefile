VERSION=latest
IMAGE=bnotions/python27
REGISTRY='registry.bnotions.com:5000/${IMAGE}'
LATEST=$(shell docker images | grep '${IMAGE}' | grep -v '${REGISTRY}' | awk '{print $$3}')

all: build

build:
	docker build -t ${IMAGE}:${VERSION} .

test:
	docker build -i -t ${IMAGE}:${VERSION}

push:
	docker tag ${LATEST} ${REGISTRY}:${VERSION}
	docker push ${REGISTRY}

clean:
	docker rmi ${LATEST}
	docker rmi ${REGISTRY}:${VERSION}
