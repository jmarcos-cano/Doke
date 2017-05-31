include .Makefile.settings.mk


TARGETS= clean compile docker info


DOCKER_COMPOSE_FILE= docker-compose-build.yml
DOCKER_COMPOSE_ENV_FILE= .env
DOCKER_COMPOSE= docker-compose -f $(DOCKER_COMPOSE_FILE) 


include $(DOCKER_COMPOSE_ENV_FILE)

# NUSPEC_FILE= *.nuspec
# NUGET_PACK_FLAGS= -properties "BUILD_NUMBER=$(BUILD_NUMBER); BUILD_DATE=$(BUILD_DATE);   \
# 	              GIT_REPO=$(GIT_REPO); GIT_COMMIT=$(GIT_COMMIT); BUILD_TAG = $(BUILD_TAG); "
# NUGET_PACK= nuget pack $(NUSPEC_FILE) $(NUGET_PACK_FLAGS)



.PHONY:
	all $(TARGETS)

all: $(TARGETS) 

clean: ## cleans bin/, packages/, nuget (nupkg) and any docker-compose asset (container)
	@ ${INFO} "Cleaning"
	-rm -rf bin
	$(DOCKER_COMPOSE) stop
	$(DOCKER_COMPOSE) kill

compile: #clean ## compiles the solution inside a docker container
	@ ${INFO} "Starting source-code compiler..."
	$(DOCKER_COMPOSE) run --rm  compiler


docker: compile ## runs nuget package
	@ ${INFO} "Building Docker image ${IMAGE}:${VERSION} ..."
	$(DOCKER_COMPOSE) build --no-cache image_generator 
	


default:
	all