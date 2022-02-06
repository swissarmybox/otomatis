# Dockerfile with Ubuntu and Ansible
FROM ubuntu:focal

RUN apt update && \
    apt install --yes sudo && \
    apt install --yes software-properties-common && \
    apt install --yes curl && \
    apt install --yes git && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt install --yes ansible

# Create non root user
ARG USER=test
ARG PASS=testpwd

RUN useradd -m $USER && \
    echo "$USER:$PASS" | chpasswd && \
    usermod -aG sudo test

USER test
WORKDIR /home/test
