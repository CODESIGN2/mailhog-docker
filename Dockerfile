ARG GOTAG=1.24-alpine
FROM golang:${GOTAG} AS builder
ARG MAILHOG_VERSION=latest
MAINTAINER CD2Team <codesign2@icloud.com>

RUN set -x \
  && buildDeps='git musl-dev gcc' \
  && apk add --update $buildDeps \
  && GOPATH=/tmp/gocode go install github.com/mailhog/MailHog@${MAILHOG_VERSION}

FROM alpine:latest
WORKDIR /bin
COPY --from=builder tmp/gocode/bin/MailHog /bin/MailHog
EXPOSE 1025 8025
ENTRYPOINT ["MailHog"]
