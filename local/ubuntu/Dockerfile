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
ARG USER=jane
ARG PASS=jane_password

RUN useradd -m $USER && \
    echo "$USER:$PASS" | chpasswd && \
    usermod -aG sudo jane

USER jane
WORKDIR /home/jane
