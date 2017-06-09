[home](../README.md)

# .env file

docker-compose [.env](https://docs.docker.com/compose/environment-variables/#the-env-file) file to declare all default variables for:

- Compilers
- Builders



# Example

```bash
### BUILD
BASE_IMAGE=node:6.10-alpine 
OUTPUT_DIR=output
SRC_CODE_DIR=./src
BUILD_COMMAND="pwd && ls && npm install "

### APP
IMAGE=mcano/doke-giphy
VERSION=v0.0.0

```