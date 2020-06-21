# inspired by https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db

dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

.PHONY: help login build-from-repo run compose up stop rm clean

DOCKER_TARGET ?= .

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

login: ## Login to docker repo
	@echo $(DOCKER_PASSWORD) | sudo docker login -u $(DOCKER_USERNAME) --password-stdin

build: ## Build local container
	@docker build -t $(APP_NAME) .

run: 
  ifneq ($(HOST_PORT),) 
    ifneq ($(INTERNAL_PORT),) 
      PORT += -p $(HOST_PORT):$(INTERNAL_PORT)
    endif
  endif
run: ## Run container with expose ports
	@docker run -d $(PORT) --name $(APP_NAME) $(APP_NAME) 

up: ## Build and run local container with expose ports
	@build run

run-from-repo:
  DOCKER_TARGET=$(DOCKER_USERNAME)/$(APP_NAME)
run-from-repo: login run ## Build and run the container from username/app_name repo

# compose: ## Run using docker-compose
# 	@docker-compose up --build $(APP_NAME)

stop: ## Stop and remove the container
	@docker stop $(APP_NAME)

rm: stop # Stop and remove the container
rm:
	@docker rm $(APP_NAME)

clean: ## Clean up generated files
	@echo "nothing clean ..."

watch: ## Start local watch service watching container for continuous deployment
	docker run -d -e REPO_USER -e REPO_PASS --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower ${APP_NAME} --debug -i 10 

rm-watch:
	@docker stop watchtower
	@docker rm watchtower

deploy: ## Run from repo and start watch service for continuous deployment
	run-from-repo watch