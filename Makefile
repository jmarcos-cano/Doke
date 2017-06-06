include .Makefile.settings.mk


TARGETS= clean compile docker label


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

clean: ## cleans bin/ and any docker-compose asset (containers & networks)
	@ ${INFO} "Cleaning"
	-rm -rf bin
	$(DOCKER_COMPOSE) stop
	$(DOCKER_COMPOSE) kill
	$(DOCKER_COMPOSE) down

compile: #clean ## compiles the source code inside a docker container
	@ ${INFO} "Starting source-code compiler..."
	$(DOCKER_COMPOSE) run --rm  compiler


docker: compile ## generates a Docker image with label-schema included
	@ ${INFO} "Building Docker image ${IMAGE}:${VERSION} ..."
	$(DOCKER_COMPOSE) build --no-cache --force-rm service_docker_image 
	
config: ## shows docker-compose config command
	$(DOCKER_COMPOSE) config
 
default:
	all