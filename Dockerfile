FROM alpine:latest
MAINTAINER CD2Team <codesign2@icloud.com>

RUN set -x \
  && buildDeps='go git bzr musl-dev' \
  && apk add --update $buildDeps \
  && GOPATH=/tmp/gocode go get github.com/mailhog/MailHog \
  && mv /tmp/gocode/bin/MailHog /usr/local/bin/ \
  && apk del $buildDeps \
  && rm -rf /var/cache/apk/* /tmp/*

EXPOSE 1025 8025
ENTRYPOINT ["MailHog"]

