# Use Ubuntu LTS
FROM ubuntu:groovy

# Set build environment variables.
ENV DOCKERIZED true
ARG DEBIAN_FRONTEND=noninteractive

# Configure timezones
RUN ln -snf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime && echo "Asia/Bangkok" > /etc/timezone

# Install dependencies for dotbot
RUN apt-get update -y && apt-get upgrade -yq && apt-get install sudo git python3 -y

# Install dependencies
COPY ./linux/deps /tmp/deps

# Run dotbot installation scripts, which triggers setup.sh
RUN /tmp/deps/install.sh

# Adds a new user to the sudo group
RUN useradd -ms /bin/bash phoomparin && \
  usermod -a -G sudo phoomparin && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup dotfiles directory
USER phoomparin
RUN mkdir -p $HOME/dotfiles
WORKDIR /home/phoomparin/dotfiles

# Copy dotfiles config to ~/dotfiles
COPY . .
RUN sudo chown -R phoomparin .

# Start fish shell
WORKDIR /home/phoomparin
CMD fish
