DOCKER_IMG = go-power
DOCKER_INST = go-power1

CJGO = /home/carltonj2000/cj/configsNscripts/go/src/github.com/carltonj2000
CJGOUTILS = $(CJGO)/cjUtils
CJGOPOWER = $(CJGO)/cjWebserverPower
cjHtmlSrc = /home/carltonj2000/cj/cjSourceControlled/carltonj2000/home-server/build

GOROOTDST = /go/src
GITHUBGOROOTDST = $(GOROOTDST)/github.com

HTMLDST = /usr/share/nginx/html

build:
	docker build -t $(DOCKER_IMG) .

run:
	docker run -it --rm --name $(DOCKER_INST) -p 8111:8111 $(DOCKER_IMG)

getGo:
	cp $(CJGOPOWER)/cjWebserverPower.go .
	cp $(CJGOUTILS)/cjJson.go .
	cp $(CJGOUTILS)/cjPowerOn.go .
	cp $(CJGOUTILS)/cjUtils.go .

getHtml:
	cp -rf $(cjHtmlSrc) html

putGo:
	docker cp cjWebserverPower.go $(DOCKER_INST):$(GJDODST)/cjWebserverPower/cjWebserverPower.go
	docker cp cjJson.go $(DOCKER_INST):$(GJDODST)/cjUtil/cjJson.go
	docker cp cjPowerOn.go $(DOCKER_INST):$(GJDODST)/cjUtil/cjPowerOn.go
	docker cp cjUtils.go $(DOCKER_INST):$(GJDODST)/cjUtil/cjUtils.go

putHtml:
	docker cp html $(DOCKER_INST):$(HTMLDST)/html

clean:
	docker kill $(image)
	docker rm $(image)
