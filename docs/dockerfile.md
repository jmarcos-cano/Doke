[home](../README.md)

``` bash
### RUNTIME base image
FROM node:6.10-alpine  

### APP 
ENV APP_HOME=/var/www/app
WORKDIR ${APP_HOME}

ARG BIN_PATH 
ADD ${BIN_PATH} ./

CMD ["node", "./app.js"]
EXPOSE 3000

### label-schema METADATA passed as build-args, some defaults here.
ARG IMAGE
ARG VERSION=0.0.0
ARG GIT_REPO
ARG GIT_COMMIT=123 
ARG GIT_BRANCH=master
ARG BUILD_DATE
ARG BUILD_TAG

LABEL maintainer="<jmarcos.cano@gmail.com>"  \
      org.label-schema.org="marcos/giphy-server" \
      org.label-schema.description="simple Express app that will go to giphy and show some random cute pug giphys" \
	  org.label-schema.name="${IMAGE}" \
	  org.label-schema.version="${VERSION}" \
      org.label-schema.vcs-ref="${GIT_COMMIT}" \
      org.label-schema.vcs-url="${GIT_REPO}" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.build-id="${BUILD_TAG}"

```