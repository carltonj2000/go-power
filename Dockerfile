FROM golang

ENV CJGOROOT /go/src/github.com/carltonj2000

WORKDIR ${CJGOROOT}/cjUtils
ADD cjJson.go .
ADD cjPowerOn.go .
ADD cjUtils.go .
RUN go get -d -v
RUN go install -v

WORKDIR ${CJGOROOT}/cjWebserverPower
ADD cjWebserverPower.go .
RUN go get -d -v
RUN go install -v

WORKDIR /usr/share/nginx/html
ADD html html
ENTRYPOINT exec /go/bin/cjWebserverPower

EXPOSE 8111
