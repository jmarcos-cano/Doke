FILES=.env .Makefile.settings.mk docker-compose-build.yml Makefile .dockerignore
SRC_CODE_PATH=doke-src
ARTIFACT_NAME=doke.tar.gz
DOWNLOAD_DIR=downloads


TARGETS= clean doke.tar.gz


export GIT_COMMIT ?= $(shell git rev-parse --short HEAD)
export BUILD_DATE :=$(shell date "+%Y-%m-%d %H:%M:%S")


.PHONY: all $(TARGETS)

all: $(TARGETS) 

clean: ## cleans bin/ and any docker-compose asset (containers & networks)
	@echo "*********** Clean *********** "
	

doke.tar.gz:  ## compiles the source code inside a docker container
	@echo "***********  Generating & publishing tar *********** "
	tar cvfz $@ -C $(SRC_CODE_PATH) $(FILES)
	mv $@ $(DOWNLOAD_DIR)
	cp $(DOWNLOAD_DIR)/$@ $(DOWNLOAD_DIR)/${GIT_COMMIT}.$@

info:
	@echo "${BUILD_DATE}"
	@echo "${GIT_COMMIT}"

default:
	all