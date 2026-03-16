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

WORKDIR /opt/capsule
COPY . .

# Build Python M3SA
WORKDIR /opt/capsule/bin/m3sa
RUN python -m venv venv \
    && ./venv/bin/pip install --upgrade pip \
    && ./venv/bin/pip install -r requirements.txt

ENV VIRTUAL_ENV=/opt/capsule/bin/m3sa/venv
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

WORKDIR /opt/capsule
RUN chmod +x m3sa-experiment

ENTRYPOINT ["/bin/bash"]