
compilers need the following enviroment variables in order to work for you:


- `BASE_IMAGE:` tells which Docker base image to use for compiling purposes.
- `SRC_CODE_DIR:`  sets the relative path to where the source code is located.
- `OUTPUT_DIR (optional):` if the compiler outputs a static binary or a new folder, you can set where the ouput should be kept.
- `BUILD_COMMAND:` the compiler command to use in order to generate the binary or the artifact.

<br>

> Note: environment variables can be set in the current environment via export VAR=VAR or preferably in the .env file 

#### examples
given the following docker-compose-build.yml fragment
 
```bash
compiler:
    image: ${BASE_IMAGE}
    working_dir: /var/www/app/
    volumes:
      - ${SRC_CODE_DIR}:/var/www/app/
      - ./${OUTPUT_DIR}:/${OUTPUT_DIR}
    entrypoint: sh -c ${BUILD_COMMAND}
    
    labels:
      - compiler
```

and the following environment variables:
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
      temporarily: ''
    volumes:
    - /Users/marcoscano/github/Doke/src:/var/www/app:rw
    working_dir: /var/www/app/
```
