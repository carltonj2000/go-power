FROM golang

ENV GOSRC /go/src
ENV GOBIN /go/bin
ENV GOSRCGITHUB ${GOSRC}/github.com
ENV CJGOROOT ${GOSRCGITHUB}/carltonj2000
ENV CJGOUTILS ${CJGOROOT}/cjUtils
ENV CJGOPOWER ${CJGOROOT}/cjWebserverPower
ENV WD /usr/share/nginx/html

ADD cjWebserverPower.go ${CJGOPOWER}/cjWebserverPower.go
ADD cjJson.go ${CJGOUTILS}/cjJson.go
ADD cjPowerOn.go ${CJGOUTILS}/cjPowerOn.go
ADD cjUtils.go ${CJGOUTILS}/cjUtils.go
ADD html ${WD}/html

RUN ls
RUN apt-get install git
WORKDIR ${CJGOUTILS}
RUN go get -d -v
RUN go install -v

WORKDIR ${CJGOPOWER}
RUN go get -d -v
RUN go install -v

WORKDIR ${WD}
CMD ${GOBIN}/cjWebserverPower

EXPOSE 8111
