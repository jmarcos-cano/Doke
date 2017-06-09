FILES=.env .Makefile.settings.mk docker-compose-build.yml Makefile .dockerignore
SRC_CODE_PATH=doke-src
BUILD_FILE=build.txt

TARGETS= clean doke.tar.gz


ARTIFACT_NAME=doke.tar.gz
ARTIFACTS_DIR=downloads
MAX_ARTIFACTS_TO_KEEP=5




export GIT_COMMIT ?= $(shell git rev-parse --short HEAD)
export BUILD_DATE :=$(shell date "+%Y-%m-%d %H:%M:%S")
export TMP_NAME=$(GIT_COMMIT).$(shell echo $(BUILD_DATE)|tr -d " "  |tr -d ":" |tr -d "-" )

.PHONY: all $(TARGETS)

all: $(TARGETS) 

clean: ## cleans bin/ and any docker-compose asset (containers & networks)
	@echo "*********** Clean *********** "
	-rm -f  $(BUILD_FILE) */$(BUILD_FILE)
	-ls -tp $(ARTIFACTS_DIR) | grep -v '/' | tail -n +$(MAX_ARTIFACTS_TO_KEEP) | xargs -I {} rm -- {}

	

$(BUILD_FILE):
	@echo "*********** Creating build file  ***********"
	@printf "GIT_COMMIT=${GIT_COMMIT}\nBUILD_DATE=${BUILD_DATE}" > $(SRC_CODE_PATH)/$(BUILD_FILE)
	@FILES+=$(BUILD_FILE)

doke.tar.gz: $(BUILD_FILE) ## compiles the source code inside a docker container
	@echo "***********  Generating & publishing tar *********** "
	tar cvfz $@ -C $(SRC_CODE_PATH) $(FILES)
	mv $@ $(ARTIFACTS_DIR)
	cp $(ARTIFACTS_DIR)/$@ $(ARTIFACTS_DIR)/$(TMP_NAME).$@

info:
	@echo "${BUILD_DATE}"
	@echo "${GIT_COMMIT}"

default:
	all