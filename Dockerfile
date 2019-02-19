FROM ubuntu:16.04 AS build

ENV PLATFORM linux_amd64
ENV TERRAFORM_VERSION 0.11.11
ENV PACKER_VERISON 1.3.4
ENV VAULT_VERSION 1.0.3

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    curl \
    wget \
    unzip \
    git \
    jq \
    awscli \
    make && rm -rf /var/lib/apt/lists/*

# Install terraform
RUN wget -O /tmp/terraform.$$ https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${PLATFORM}.zip && \
    unzip -d /usr/local/bin /tmp/terraform.$$ && \
    chmod +x /usr/local/bin

# Install packer
RUN wget -O /tmp/packer.$$ https://releases.hashicorp.com/packer/${PACKER_VERISON}/packer_${PACKER_VERISON}_${PLATFORM}.zip && \
    unzip -d /usr/local/bin /tmp/packer.$$ && \
    chmod +x /usr/local/bin/packer

# Install vault
RUN wget -O /tmp/vault.$$ https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_${PLATFORM}.zip && \
    unzip -d /usr/local/bin /tmp/vault.$$ && \
    chmod +x /usr/local/bin/vault
