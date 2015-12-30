BASE_NAME = nsgb/konstructs-build-image
VERSION_LINUX = 2
VERSION_WINDOWS = 5
VERSION_DOCS = 3

all: build tag push
	:

build: build-windows build-linux build-docs

build-windows:
	docker build -t ${BASE_NAME}-windows:${VERSION_WINDOWS} -f Dockerfile-windows .

build-linux:
	docker build -t ${BASE_NAME}-linux:${VERSION_LINUX} -f Dockerfile-linux .

build-docs:
	docker build -t ${BASE_NAME}-docs:${VERSION_DOCS} -f Dockerfile-docs .

tag:
	docker tag -f ${BASE_NAME}-windows:${VERSION_WINDOWS} ${BASE_NAME}-windows:latest
	docker tag -f ${BASE_NAME}-linux:${VERSION_LINUX} ${BASE_NAME}-linux:latest
	docker tag -f ${BASE_NAME}-docs:${VERSION_DOCS} ${BASE_NAME}-docs:latest

push:
	docker push ${BASE_NAME}-windows:${VERSION_WINDOWS}
	docker push ${BASE_NAME}-windows:latest
	docker push ${BASE_NAME}-linux:${VERSION_LINUX}
	docker push ${BASE_NAME}-linux:latest
	docker push ${BASE_NAME}-docs:${VERSION_DOCS}
	docker push ${BASE_NAME}-docs:latest
