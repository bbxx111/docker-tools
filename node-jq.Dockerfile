FROM node:20

LABEL maintainer=bbxx111 \
  email=bbxx111@163.com

RUN apt update \
  && apt install -y jq \
  && apt autoremove -y \
  && apt clean
