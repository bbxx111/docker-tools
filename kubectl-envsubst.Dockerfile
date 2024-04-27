FROM alpine:3.16

LABEL maintainer=bbxx111 \
  email=bbxx111@163.com

RUN apk add --update ca-certificates \
  && apk add --update curl \
  && apk add --update gettext \
  && apk add --update git

ENV KUBE_LATEST_VERSION="v1.28.9"
RUN curl -L https://dl.k8s.io/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

RUN rm /var/cache/apk/*

ENTRYPOINT ["kubectl"]
CMD ["--help"]