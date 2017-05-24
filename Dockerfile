FROM {{docker_base_image}}

### APP
ARG bin_path
ADD ${bin_path} ${APP_HOME}/


### METADATA
ARG IMAGE
ARG VERSION=1
ARG SERVICE_VERSION_NUMBER=v0.0.0
ENV SERVICE_VERSION_NUMBER=${SERVICE_VERSION_NUMBER}

ARG GIT_REPO
ARG GIT_COMMIT=123 
ARG GIT_BRANCH=master
ARG BUILD_DATE
ARG BUILD_TAG


LABEL maintainer="<devops@autoweb.com>"  \
      app_version="${VERSION}" \
      org.label-schema.org="autoweb/consumerproducts" \
      org.label-schema.description="description" \
	  org.label-schema.name="${IMAGE}" \
	  org.label-schema.version="${VERSION}" \
      org.label-schema.vcs-ref="${GIT_COMMIT}" \
      org.label-schema.vcs-url="${GIT_REPO}" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.build-id="${BUILD_TAG}"

