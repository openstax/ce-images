FROM ubuntu:20.04

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg2 \
    software-properties-common \
    sudo \
    tzdata \
    unzip \
    wget \
    python3.8-venv \
 && apt-get autoremove -y

#===================
# Timezone settings
# Possible alternative: https://github.com/docker/docker/issues/3359#issuecomment-32150214
#===================
ENV TZ "UTC"
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata

#===============
# Install poetry
#===============
ENV POETRY_VERSION 1.4.0
# install poetry
# keep this in sync with the version in pyproject.toml and Dockerfile
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:/opt/venv/bin:${PATH}"
