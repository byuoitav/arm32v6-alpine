ORG=byuoitav
NAME=arm64v8-alpine
BRANCH=latest

UNAME=$(shell echo $(DOCKER_USERNAME))
PASS=$(shell echo $(DOCKER_PASSWORD))

DOCKER=docker
DOCKER_BUILD=$(DOCKER) build 
DOCKER_LOGIN=$(DOCKER) login
DOCKER_PUSH=$(DOCKER) push

all: build deploy
build:
	./build.sh
	$(DOCKER_BUILD) -t $(ORG)/$(NAME):$(BRANCH) .

deploy: 
	$(DOCKER_LOGIN) -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	$(DOCKER_PUSH) $(ORG)/$(NAME):$(BRANCH)
