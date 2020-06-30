TAG?=dev

build: export DOCKER_BUILDKIT = 1
build: Dockerfile ## Create the build and runtime images
	@docker build -t pythonbooster_csv:$(TAG) .

build-dev: export DOCKER_BUILDKIT = 1
build-dev: Dockerfile ## Create the dev build and runtime images
	@docker build --build-arg DEVEL=yes -t pythonbooster_csv:dev .

outdated: ## Show outdated packages in the container
	@docker run --rm pythonbooster_csv:$(TAG) pip list --outdated

pipdeptree: ## Show pipdeptree output
	@docker run --rm pythonbooster_csv:$(TAG) pipdeptree

compile: requirements/main.in ## compile latest requirements to be built into the docker image
	@docker run --rm -v $(shell pwd)/requirements:/local pythonbooster_csv:dev /bin/bash -c \
		"python -m piptools compile --upgrade --no-annotate --no-header --allow-unsafe --generate-hashes --output-file /local/main.txt /local/main.in"

clean: ## Remove the latest build
	@docker rmi -f pythonbooster_csv:$(TAG)

clean-dev: ## Remove the latest build
	@docker rmi -f pythonbooster_csv:dev

squeaky-clean: clean clean-dev ## Aggressively remove unused images
	@docker rmi python:3.8-slim
	@docker system prune -a
	@for image in `docker images -f "dangling=true" -q`; do \
		echo removing $$image && docker rmi $$image ; done

update: ## Grab latest images for project
	@docker pull python:3.8-slim

run:  ## Run the notebook server
	@docker run --rm -p 8888:8888 pythonbooster_csv:$(TAG)

repl:  ## Run an ipython REPL
	@docker run --rm -it pythonbooster_csv:$(TAG) ipython

shell:  ## Start an interactive shell
	@docker run --rm -it pythonbooster_csv:$(TAG) bash

help: ## This help.
	@awk 'BEGIN 	{ FS = ":.*##"; target="";printf "\nUsage:\n  make \033[36m<target>\033[33m\n\nTargets:\033[0m\n" } \
		/^[a-zA-Z_-]+:.*?##/ { if(target=="")print ""; target=$$1; printf " \033[36m%-10s\033[0m %s\n\n", $$1, $$2 } \
		/^([a-zA-Z_-]+):/ {if(target=="")print "";match($$0, "(.*):"); target=substr($$0,RSTART,RLENGTH) } \
		/^\t## (.*)/ { match($$0, "[^\t#:\\\\]+"); txt=substr($$0,RSTART,RLENGTH);printf " \033[36m%-10s\033[0m", target; printf " %s\n", txt ; target=""} \
		/^## .*/ {match($$0, "## (.+)$$"); txt=substr($$0,4,RLENGTH);printf "\n\033[33m%s\033[0m\n", txt ; target=""} \
	' $(MAKEFILE_LIST)

.PHONY: help build build-dev outdated pipdeptree compile clean clean-dev squeaky-clean update shell
