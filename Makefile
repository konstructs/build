VERSION = 2
BASE_NAME = nsgb/konstructs-build-image

all: build tag push
	:

build:
	docker build -t ${BASE_NAME}-windows:${VERSION} -f Dockerfile-windows .
	docker build -t ${BASE_NAME}-linux:${VERSION} -f Dockerfile-linux .

tag:
	docker tag -f ${BASE_NAME}-windows:${VERSION} ${BASE_NAME}-windows:latest
	docker tag -f ${BASE_NAME}-linux:${VERSION} ${BASE_NAME}-linux:latest

push:
	docker push ${BASE_NAME}-windows:${VERSION}
	docker push ${BASE_NAME}-windows:latest
	docker push ${BASE_NAME}-linux:${VERSION}
	docker push ${BASE_NAME}-linux:latest
