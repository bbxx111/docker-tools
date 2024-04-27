FROM node:20-alpine

LABEL maintainer=bbxx111 \
  email=bbxx111@163.com

RUN apk update \
  && apk add jq

RUN rm /var/cache/apk/*
