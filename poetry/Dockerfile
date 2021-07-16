FROM 373045849756.dkr.ecr.us-east-2.amazonaws.com/python3-base:20210716.163018 as base

ENV POETRY_VERSION 1.1.7

# install poetry
# keep this in sync with the version in pyproject.toml and Dockerfile
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
ENV PATH "/root/.poetry/bin:/opt/venv/bin:${PATH}"
