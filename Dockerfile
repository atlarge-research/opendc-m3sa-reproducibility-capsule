FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        build-essential \
        ca-certificates \
        curl \
        git \
        make \
        openjdk-21-jdk-headless \
        unzip \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

# Install M3SA requirements
WORKDIR /app/bin/m3sa
RUN python -m venv venv \
    && . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

ENV VIRTUAL_ENV=/app/bin/m3sa/venv
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

WORKDIR /app
RUN chmod +x m3sa-experiment
ENTRYPOINT ["/app/m3sa-experiment"]

