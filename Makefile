BASE_NAME = nsgb/konstructs-build-image
VERSION_LINUX = 3
VERSION_WINDOWS = 5
VERSION_DOCS = 3

all: build tag
	:

build: build-windows build-linux build-docs

build-windows:
	docker build -t ${BASE_NAME}-windows:${VERSION_WINDOWS} -f Dockerfile-windows .
build-linux:
	docker build -t ${BASE_NAME}-linux:${VERSION_LINUX} -f Dockerfile-linux .
build-astyle:
	docker build -t ${BASE_NAME}-astyle:${VERSION_LINUX} -f Dockerfile-astyle .
build-docs:
	docker build -t ${BASE_NAME}-docs:${VERSION_DOCS} -f Dockerfile-docs .

tag: tag-windows tag-linux tag-docs tag-astyle

tag-windows:
	docker tag -f ${BASE_NAME}-windows:${VERSION_WINDOWS} ${BASE_NAME}-windows:latest
tag-linux:
	docker tag -f ${BASE_NAME}-linux:${VERSION_LINUX} ${BASE_NAME}-linux:latest
tag-astyle:
	docker tag -f ${BASE_NAME}-astyle:${VERSION_LINUX} ${BASE_NAME}-astyle:latest
tag-docs:
	docker tag -f ${BASE_NAME}-docs:${VERSION_DOCS} ${BASE_NAME}-docs:latest

push: push-windows push-linux push-docs push-astyle

push-windows: build-windows tag-windows
	docker push ${BASE_NAME}-windows:${VERSION_WINDOWS}
	docker push ${BASE_NAME}-windows:latest
push-linux: build-linux tag-linux
	docker push ${BASE_NAME}-linux:${VERSION_LINUX}
	docker push ${BASE_NAME}-linux:latest
push-astyle: build-astyle tag-astyle
	docker push ${BASE_NAME}-astyle:${VERSION_LINUX}
	docker push ${BASE_NAME}-astyle:latest
push-docs: build-docs tag-docs
	docker push ${BASE_NAME}-docs:${VERSION_DOCS}
	docker push ${BASE_NAME}-docs:latest
