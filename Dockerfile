FROM hashicorp/terraform:latest as terraform

FROM bitnami/google-cloud-sdk:0.508.0 as gcloud

FROM python:3.13.0-slim

COPY --from=terraform /bin/terraform /bin/terraform
COPY --from=gcloud /opt/bitnami/google-cloud-sdk/ /google-cloud-sdk

ENV USER=ingest-user \
  PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  UV_PROJECT_ENVIRONMENT=/usr/local

RUN apt-get update && apt-get install --no-install-recommends -y \
  curl wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -m -s /bin/bash $USER

COPY --from=ghcr.io/astral-sh/uv:0.5.5 /uv /uvx /bin/

ENV APP_DIR=/home/$USER/src
ENV PATH $PATH:/google-cloud-sdk/bin

WORKDIR $APP_DIR

COPY . $APP_DIR

ENV PYTHONPATH=$APP_DIR
