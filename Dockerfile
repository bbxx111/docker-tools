FROM alpine:3.16

LABEL maintainer=bbxx111 \
  email=bbxx111@163.com

RUN apk add --update ca-certificates \
  && apk add --update -t deps curl \
  && apk add --update gettext \
  && apk add --update git

ENV KUBE_LATEST_VERSION="v1.22.15"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

RUN apk del --purge deps \
  && rm /var/cache/apk/*

ENTRYPOINT ["kubectl"]
CMD ["--help"]