FROM alpine:3.17.1 AS repo

WORKDIR /output

RUN apk add curl

ARG QEMU_VERSION=7.2.0-1

WORKDIR /output/qemu-user-static

RUN curl -k -LO \
  https://github.com/multiarch/qemu-user-static/releases/download/v$QEMU_VERSION/qemu-aarch64-static

RUN chmod u+x qemu-aarch64-static         &&\
  ln -sf qemu-aarch64-static qemu-aarch64

WORKDIR /output

ARG GCC_VERSION=11.2-2022.02
ARG GCC_REV=33c6e30e5ac64e6dba8f0431f2c35f1b
ARG GCC_HASH=9918A05BF47621B632C7A5C8D2BB438FB80A4480

# ref: https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
RUN curl -k -L -o gcc-arm-$GCC_VERSION-x86_64-aarch64-none-linux-gnu.tar.xz \
  "https://developer.arm.com/-/media/Files/downloads/gnu/$GCC_VERSION/binrel/gcc-arm-$GCC_VERSION-x86_64-aarch64-none-linux-gnu.tar.xz?rev=$GCC_REV&hash=$GCC_HASH"

RUN tar -Jxvf gcc-arm-$GCC_VERSION-x86_64-aarch64-none-linux-gnu.tar.xz &&\
  mv gcc-arm-$GCC_VERSION-x86_64-aarch64-none-linux-gnu gcc-arm


FROM ubuntu:20.04

ENV PATH=$PATH:/opt/gcc-arm/bin

RUN sed -i 's/archive.ubuntu.com/mirrors.tencent.com/g' /etc/apt/sources.list &&\
  sed -i 's/security.ubuntu.com/mirrors.tencent.com/g' /etc/apt/sources.list

RUN apt update                                  &&\
  apt install -y make gdb-multiarch             &&\
  apt clean                                     &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=repo /output/qemu-user-static/* /usr/bin/

COPY --from=repo /output/gcc-arm /opt/gcc-arm
