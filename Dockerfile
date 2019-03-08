# work from latest LTS ubuntu release
FROM ubuntu:18.04

# set environment variables
ENV vcftools_version 0.1.16

# Install dependencies
RUN apt-get update -y && apt-get install -y \
    build-essential \
    libnss-sss \
    vim \
    wget \
    curl \
    less \
    gawk \
    zlib1g-dev \
    pkg-config

# Install vcftools
WORKDIR /usr/local/bin/
RUN curl -SL https://github.com/vcftools/vcftools/releases/download/v${vcftools_version}/vcftools-${vcftools_version}.tar.gz \
    > vcftools-${vcftools_version}.tar.gz
RUN tar -xzvf vcftools-${vcftools_version}.tar.gz
WORKDIR /usr/local/bin/vcftools-${vcftools_version}
RUN ./configure
RUN make
RUN make install


# default command
CMD ["vcftools"]
