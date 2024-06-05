FROM ubuntu:22.04

LABEL maintainer=bbxx111 \
  email=bbxx111@163.com

ENV LANG C.UTF-8

RUN sed -i "s@http://.*.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list \
    && apt-get update \
	&& apt-get install -y lcov git g++ gdb python3 wget

ARG TARGETPLATFORM

RUN wget --no-check-certificate -O /usr/bin/bazelisk https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-$(echo $TARGETPLATFORM | cut -d / -f 2)
RUN wget --no-check-certificate -O /usr/bin/buildifier https://github.com/bazelbuild/buildtools/releases/download/v7.1.2/buildifier-linux-$(echo $TARGETPLATFORM | cut -d / -f 2)
RUN chmod +x /usr/bin/bazelisk /usr/bin/buildifier

RUN apt-get -y autoremove wget && apt-get clean
