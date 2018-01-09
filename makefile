ORG=byuoitav
NAME=arm32v6-alpine
BRANCH=latest

UNAME=$(shell echo $(DOCKER_USERNAME))
PASS=$(shell echo $(DOCKER_PASSWORD))

DOCKER=docker
DOCKER_BUILD=$(DOCKER) build 
DOCKER_LOGIN=$(DOCKER) login
DOCKER_PUSH=$(DOCKER) push

all: build deploy
build: bin/resin-xbuild
	go build -ldflags "-w -s" -o bin/resin-xbuild resin-xbuild.go
	$(DOCKER_BUILD) -t $(ORG)/$(NAME):$(BRANCH) .

deploy: 
	$(DOCKER_LOGIN) -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	$(DOCKER_PUSH) $(ORG)/$(NAME):$(BRANCH)
