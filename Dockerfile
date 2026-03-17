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

WORKDIR /app
COPY . .

# Install M3SA requirements
RUN python -m venv venv \
    && . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r bin/m3sa/requirements.txt

ENV VIRTUAL_ENV=/app/venv
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

RUN chmod +x m3sa-experiment
ENTRYPOINT ["/app/m3sa-experiment"]

