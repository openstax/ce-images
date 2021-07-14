FROM python:3.8-slim as base

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    curl gnupg2 unzip software-properties-common\
 && apt-get autoremove -y