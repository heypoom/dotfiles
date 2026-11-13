# Ubuntu 24.04 with a non-root sudo user, for testing bootstrap.sh.
FROM ubuntu:24.04

ARG USERNAME=poom
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q \
  && apt-get install -yq --no-install-recommends sudo curl ca-certificates git \
  && rm -rf /var/lib/apt/lists/* \
  && userdel -r ubuntu \
  && useradd -m -s /bin/bash "$USERNAME" \
  && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME"

USER $USERNAME
WORKDIR /home/$USERNAME
