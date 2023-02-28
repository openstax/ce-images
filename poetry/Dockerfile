FROM openstax/python3-base:latest as base

ENV POETRY_VERSION 1.4.0

# install poetry
# keep this in sync with the version in pyproject.toml and Dockerfile
RUN curl -sSL https://install.python-poetry.org | python -
ENV PATH "/root/.local/bin:/opt/venv/bin:${PATH}"
