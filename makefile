DOCKER_IMG = go-power
DOCKER_INST = go-power1

GOSRC = /home/carltonj2000/cj/configsNscripts/go/src/github.com/carltonj2000
GODST = /go/src/github.com/carltonj2000

GOUTILS = $(GOSRC)/cjUtils
GOUTILSDST = $(GODST)/cjUtils

GOPOWER = $(GOSRC)/cjWebserverPower
GOPOWERDST = $(GODST)/cjWebserverPower

HTMLSRC = /home/carltonj2000/cj/cjSourceControlled/carltonj2000/home-server/build
HTMLDST = /usr/share/nginx/html/html

build:
	docker build -t $(DOCKER_IMG) .

run:
	docker run -it --rm --name $(DOCKER_INST) -p 8111:8111 \
	-v $(HTMLSRC):$(HTMLDST) \
	-v $(GOUTILS):$(GOUTILSDST) \
	-v $(GOPOWER):$(GOPOWERDST) \
		$(DOCKER_IMG)

clean:
	docker rm -f $(shell docker ps -a | grep $(DOCKER_INST) | cut -b 1-12)

stopnrun: stopnrun1

stopnrun1: stopnrun2 run

stopnrun2: stopnrun3 build

stopnrun3: clean
