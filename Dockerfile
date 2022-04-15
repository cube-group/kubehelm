FROM alpine:3.9
RUN apk update && \
    apk add --no-cache --virtual .build-deps tzdata bash curl ca-certificates && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' >/etc/timezone && \
    curl -LO https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz && \
    tar -xvf helm-v3.8.2-linux-amd64.tar.gz && mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    curl -L "https://dl.k8s.io/release/v1.23.5/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf ./*.tar.gz linux-amd64
