# Use Ubuntu LTS
FROM ubuntu:groovy

# Set build environment variables.
ENV DOCKERIZED true
ENV USER poom
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
RUN useradd -ms /bin/bash $USER && \
  usermod -a -G sudo $USER && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup dotfiles directory
USER $USER
RUN mkdir -p $HOME/dotfiles
WORKDIR /home/$USER/dotfiles

# Copy dotfiles config to ~/dotfiles
COPY . .
RUN sudo chown -R $USER .

# Run dotbot installation script
RUN ./install

# Start fish shell
WORKDIR /home/$USER
CMD fish
