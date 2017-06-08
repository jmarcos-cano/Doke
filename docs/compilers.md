[home](../README.md)

# Purpose
Mainly used for compiling code & running unit tests. Compilers are ephemeral containers used to run commands inside of them. 


# Requirements
Compilers need the following enviroment variables in order to work for you:


- `BASE_IMAGE:` tells which Docker base image to use for compiling purposes.
- `SRC_CODE_DIR:`  sets the relative path to where the source code is located.
- `OUTPUT_DIR (optional):` if the compiler outputs a static binary or a new folder, you can set where the ouput should be kept.
- `BUILD_COMMAND:` the compiler command to use in order to generate the binary or the artifact.

<br>

> Note: environment variables can be set in the current environment via export VAR=VAR or preferably in the .env file 


# Usage

simply copy paste this snippet into your `docker-compose-build.yml`

```bash
compiler:
    image: ${BASE_IMAGE}
    working_dir: /var/www/app/
    volumes:
      - ${SRC_CODE_DIR}:/var/www/app/
    entrypoint: sh -c ${BUILD_COMMAND}
    
    labels:
      - compiler
```


### Makefile wrapper command

`docker-compose -f docker-compose-build.yml  run --rm service_docker_image `


# Examples
using the previous snippet docker-compose-build.yml fragment
 
### nodejs (npm install)

with the following environment variables:
```bash
BASE_IMAGE=node:6.10-alpine 
OUTPUT_DIR=output
SRC_CODE_DIR=./src
BUILD_COMMAND="pwd && ls && npm install "
```

the result of `docker-compose -f docker-compose-build.yml config`
```bash
 compiler:
    entrypoint: sh -c "pwd && ls && npm install "
    image: node:6.10-alpine
    labels:
      compiler: ''
    volumes:
    - /Users/marcoscano/github/Doke/src:/var/www/app:rw
    working_dir: /var/www/app/
```

### Go (unit tests)
just rename the service as `unit`
```bash
BASE_IMAGE=golang:1.6
OUTPUT_DIR=go-demo
SRC_CODE_DIR=.
BUILD_COMMAND="go get -d -v -t && go test --cover -v ./... && go build -v -o go-demo"
```


the result of `docker-compose -f docker-compose-build.yml config`
```bash
 unit:
    entrypoint: sh -c "go get -d -v -t && go test --cover -v ./... && go build -v -o go-demo"
    image: golang:1.6
    labels:
      compiler: ''
    volumes:
    - /Users/marcoscano/github/Doke/src:/var/www/app:rw
    working_dir: /var/www/app/
```


#### Notes
> obviously you decide to hard-code the image and entrypoint in the docker-compose file, but I've found easier to set it in .env file and just use "template" like dcompose services 
