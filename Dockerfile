ARG BASE_VERSION=4.0.1-1-alpine
FROM jenkins/jnlp-slave:${BASE_VERSION}
LABEL maintainer Adam <adam@mesomer.com>

ARG HUGO_VERSION=0.54.0
ENV HUGO_ARCH Linux-64bit

USER ${user}

# Install HUGO
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz && \
    tar xzvf hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz -C /usr/bin hugo && \
    rm -rf hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
