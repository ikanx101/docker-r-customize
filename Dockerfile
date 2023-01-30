# building docker image to use R-Studio in a browser

FROM rocker/verse:latest

MAINTAINER 'Ikanx Fadhli' ikanx101@gmail.com

## create directories
RUN mkdir -p /01_data
RUN mkdir -p /02_code
RUN mkdir -p /03_output

## copy files
COPY 02_code/install_packages.R /install_packages.R

RUN apt-get clean all && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
        pandoc \
        gnupg \
        ca-certificates \
        nano \
        gdebi-core \
        build-essential \
        libgdal-dev \
        python3-pip \
        libcurl4-openssl-dev \
        libssl-dev \ 
        libxml2-dev \
        cmake \ 
        libglpk-dev \
        libcairo2-dev \
        libfontconfig1-dev \
        libavfilter-dev \
        default-jre \
        default-jdk \
        lib32gcc-s1 \
        lib32stdc++6 \
        libc6-i386 \
        libclang-10-dev \
        libclang-common-10-dev \
        libclang-dev \
        libclang1-10 \
        libllvm10 \ 
        libobjc-9-dev \
        libobjc4 \ 
		libhdf5-dev \
		libcurl4-gnutls-dev \
		libssl-dev \
		libxml2-dev \
		libpng-dev \
		libxt-dev \
		zlib1g-dev \
		libbz2-dev \
		liblzma-dev \
		libglpk40 \
		libgit2-dev \
	&& apt-get clean all && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
    
## install packages 
RUN Rscript /install_packages.R
