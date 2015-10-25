FROM ubuntu:15.04
MAINTAINER Stefan Berggren <nsg@nsg.cc>

# Make sure we are up-to-date
RUN apt-get -y update && apt-get -y upgrade

# Install packages needed to build the binary
RUN apt-get -y install git wget zip unzip \
	build-essential cmake libglew-dev \
	xorg-dev python-pip binutils-mingw-w64-i686 \
	gcc-mingw-w64-i686 g++-mingw-w64-i686  \
	&& apt-get -y build-dep glfw

# Install packages to package the binary
RUN apt-get -y install ruby-dev rubygems rpm \
	&& gem install fpm -v 1.3.3 --no-ri --no-rdoc

# Setup build dir
RUN mkdir /build
WORKDIR /build
