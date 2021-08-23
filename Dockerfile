# Use Ubuntu LTS
FROM ubuntu:groovy

# Set build environment variables.
ENV DOCKERIZED true
ARG DEBIAN_FRONTEND=noninteractive

# Configure timezones & Install dependencies for dotbot
RUN ln -snf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime \
  && echo "Asia/Bangkok" > /etc/timezone \
  && apt-get update -yq \
  && apt-get upgrade -yq \
  && apt-get install sudo git python3 -yq

# Install dependencies
COPY ./linux/deps /tmp/deps

# Install essential linux dependencies.
RUN /tmp/deps/install.sh

# Adds a new user to the sudo group
RUN useradd -ms /bin/bash poom && \
  usermod -a -G sudo poom && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup dotfiles directory
USER poom
RUN mkdir -p $HOME/dotfiles
WORKDIR /home/poom/dotfiles

# Copy dotfiles config to ~/dotfiles
COPY . .
RUN sudo chown -R $USER .

# Run dotbot installation script
RUN ./install

# Start fish shell
WORKDIR /home/poom
CMD fish
