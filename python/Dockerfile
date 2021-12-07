FROM python:3.8-slim as base

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    curl gnupg2 unzip software-properties-common git \
 && apt-get autoremove -y
