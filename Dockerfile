FROM debian:bullseye-slim

RUN useradd -ms /bin/bash phoomparin

USER phoomparin
WORKDIR /home/phoomparin

COPY . /home/phoomparin

