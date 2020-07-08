FROM debian:bullseye-slim

# Install dependencies for dotbot.
RUN apt-get update && apt-get install sudo git python3 -y

# Install dependencies
COPY ./linux/deps /tmp/deps
RUN /tmp/deps/install.sh

# Adds a new user to the sudo group.
RUN useradd -ms /bin/bash phoomparin && \
  usermod -a -G sudo phoomparin && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER phoomparin
WORKDIR /home/phoomparin

COPY . /home/phoomparin

RUN sudo ./install
