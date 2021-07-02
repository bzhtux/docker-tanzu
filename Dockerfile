FROM alpine:latest

LABEL maintainer="Yannick Foeillet <bzhtux@gmail.com>"

ARG TANZU_VERSION="1.3.1"
ARG KUBECTL_VERSION="1.21.0"
ARG VELERO_VERSION="1.6.0"

RUN apk upgrade \
    && apk add --no-cache \
    bash \
    busybox-extras \
    curl \
    git \
    jq \
    openldap-clients \
    openssl \
    python3 \
    && ln -sf python3 /usr/bin/python \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade yq jinja2 jinja2-cli \
    && mkdir -p /tmp/tanzu \
    && cd /tmp/tanzu \
    && rm -rf /var/cache/apk/* 

RUN curl "http://dl.bzhtux-lab.net/tools/tanzu-cli-bundle-v${TANZU_VERSION}-linux-amd64.tar" -o tanzu-cli.tar \
    && tar xvf tanzu-cli.tar \
    && cp cli/core/v${TANZU_VERSION}/tanzu-core-linux_amd64 /usr/bin/tanzu \
    && tanzu plugin install --local cli all \
    && curl -L "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl \
    && curl -L https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz -o helm.tar.gz \
    && tar xvf helm.tar.gz \
    && cp linux-amd64/helm /usr/bin/ \
    && curl -L https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx_v0.9.3_linux_x86_64.tar.gz -o kubectx_v0.9.3_linux_x86_64.tar.gz \
    && tar xvf kubectx_v0.9.3_linux_x86_64.tar.gz \
    && cp kubectx /usr/bin/ \
    && curl -L https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens_v0.9.3_linux_x86_64.tar.gz -o kubens_v0.9.3_linux_x86_64.tar.gz \
    && tar xvf kubens_v0.9.3_linux_x86_64.tar.gz \
    && cp kubens /usr/bin/ \
    && curl -L "https://github.com/vmware-tanzu/velero/releases/download/v${VELERO_VERSION}/velero-v${VELERO_VERSION}-linux-amd64.tar.gz" -o velero.tar.gz \
    && tar xvf velero.tar.gz \
    && cp  velero-v${VELERO_VERSION}-linux-amd64/velero /usr/bin/ \
    && curl -L -o - "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" | tar -C /usr/bin -xvzf - govc