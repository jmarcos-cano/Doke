[home](../README.md)
# .Makefile.settings.mk

Cosmetics and build args calculation


List of targets included here:

- help: an actual help wrapper for your Makefile targets, just use this in order to get help for any of your targets.
```
target: dependencies ## target description that will show up in help
```
- label: prints out label-schema metadata that will be inserted your Docker image.

It also calculates a few enviroment variables that are later used as docker-compose build-args (builder service)

- `GIT_COMMIT:` short git commit id (SHA-1)
- `GIT_BRANCH:` current branch
- `GIT_REPO:` actual git-repository 
- `BUILD_DATE:` build date using rfc-3339
- `BUILD_TAG:` If used in Jenkins it with use BUILD_TAG environment variables or default to ${HOSTNAME} 

## Targets output examples 
`$ make help`

```
clean     cleans bin/ and any docker-compose asset (containers & networks)
compile   compiles the source code inside a docker container
docker    generates a Docker image with label-schema included
config    shows docker-compose config command
label     prints out label-schema metadata
help      prints this help message
```


`$ make label`

```
=> Docker image was created 
 IMAGE: mcano/doke-giphy:v0.0.0 
 BUILD_DATE: 2017-06-07 22:46:45 
 GIT_REPO: git@github.com:jmarcos-cano/Doke.git 
 GIT_COMMIT: c8a0b0d 
 GIT_BRANCH: master  
 BUILD_TAG: MarcosMac.local 
```

> Note that the actual output is colored.

