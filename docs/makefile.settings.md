[home](../README.md)

Cosmetics and build args calculation


List of targets included here:

- help
- label


# Target examples 
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

