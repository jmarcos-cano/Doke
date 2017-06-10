SHELL=/bin/bash -e -o pipefail



.DEFAULT_GOAL := all

# Docker build-args
export GIT_REPO ?= $(shell git config --get remote.origin.url )
export GIT_BRANCH ?= $(shell git branch|cut -d" " -f 2 )

export GIT_COMMIT ?= $(shell git rev-parse --short HEAD)
export GIT_COMMIT_DETAILS ?= $(shell git log -1 --pretty=oneline )
#export BUILD_DATE := $(shell date --rfc-3339=seconds )
export BUILD_DATE :=$(shell date "+%Y-%m-%d %H:%M:%S")
export BUILD_TAG ?= $(shell hostname)



# Cosmetics
RED := "\e[1;31m"
YELLOW := "\e[1;33m"
NC := "\e[0m"
INFO := @bash -c 'printf $(YELLOW); printf "=> $$1 \n"; printf $(NC)' MESSAGE
WARNING := @bash -c 'printf $(RED); printf "WARNING: $$1 \n"; printf $(NC)' MESSAGE

## Meta
metadata_file=.metadata
metadata= "Docker image was created  \n\
      IMAGE: $(IMAGE):$(VERSION) \n\
      BUILD_DATE: $(BUILD_DATE) \n\
      GIT_REPO: $(GIT_REPO) \n\
      GIT_COMMIT: $(GIT_COMMIT) \n\
      GIT_BRANCH: $(GIT_BRANCH)  \n\
      BUILD_TAG: $(BUILD_TAG) \n\
      "

## default values
_BASE_IMAGE= alpine:3.6
_SRC_CODE_DIR= .
_VERSION= v0.0.0
_IMAGE= $(shell basename $(shell pwd)|sed 's/[^a-z  A-Z]//g')

dot_env_fle= " \n\
\#\# Compile time vars \n\
BASE_IMAGE=$(_BASE_IMAGE) \n\
OUTPUT_DIR=output \n\
SRC_CODE_DIR=$(_SRC_CODE_DIR) \n\
BUILD_COMMAND=\"pwd && ls\"  \n\
\#\# Doker image vars  \n\
IMAGE=$(_IMAGE) \n\
VERSION=$(_VERSION) \n"



label: ## prints out label-schema metadata
	@ ${INFO} ${metadata}
	@printf ${metadata} > ${metadata_file}



init: ## generates .env content
	@ ${INFO} "Generating .env file according to your project"
	@read  -p "What BASE_IMAGE will you like to compile your code with? [defaults to: $(_BASE_IMAGE)] " _BASE_IMAGE
	@read  -p "Where is your source code located? (SRC_CODE_DIR) [defaults to: $(_SRC_CODE_DIR)] " _SRC_CODE_DIR
	@read  -p "What would you like to name your generated Docker image? (IMAGE) [defaults to: $(_IMAGE)] " _IMAGE
	@read  -p "What is the version you'll like to use? (VERSION) [defaults to: $(_VERSION)" _VERSION
	@ ${INFO} "Copy and paste this in your .env file"
	@printf ${dot_env_fle} 



help: ## prints this help message
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

