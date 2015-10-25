VERSION = 2

all: build tag push
	:

build:
	docker build -t nsgb/konstructs-build-image:${VERSION} .

tag:
	docker tag -f nsgb/konstructs-build-image:${VERSION} nsgb/konstructs-build-image:latest

push:
	docker push nsgb/konstructs-build-image:${VERSION}
	docker push nsgb/konstructs-build-image:latest
