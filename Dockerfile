ARG GOTAG=1.18-alpine
FROM golang:${GOTAG} as builder
ARG MAILHOG_VERSION=latest
MAINTAINER CD2Team <codesign2@icloud.com>

RUN set -x \
  && buildDeps='git musl-dev gcc' \
  && apk add --update $buildDeps \
  && GOPATH=/tmp/gocode go install github.com/mailhog/MailHog@${MAILHOG_VERSION}

FROM alpine:latest
LABEL org.opencontainers.image.title="MailHog" \
    org.opencontainers.image.description="An extension to using an existing Dockerfile to also create a Docker Desktop Extension." \
    org.opencontainers.image.vendor="CODESIGN2" \
    com.docker.desktop.extension.api.version="0.0.1" \
    com.docker.desktop.extension.icon="https://avatars.githubusercontent.com/u/10258541?v=4"

COPY ui /ui
COPY metadata.json .
COPY docker-compose.yaml .
COPY hog.svg .

WORKDIR /bin
COPY --from=builder tmp/gocode/bin/MailHog /bin/MailHog
EXPOSE 1025 8025
ENTRYPOINT ["MailHog"]
