# Use Ubuntu LTS
FROM ubuntu:groovy

# Set build environment variables.
ENV DOCKERIZED true
ENV USER poom
ENV TIMEZONE "Asia/Bangkok"
ARG DEBIAN_FRONTEND=noninteractive

# Setup time zones and install linux dependencies needed for build.
RUN ln -snf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime \
	&& echo $TIMEZONE > /etc/timezones \
	&& apt update && apt install -y sudo curl \
	&& apt clean

# Adds a new user to the sudo group
RUN useradd -ms /bin/bash $USER && \
	usermod -a -G sudo $USER && \
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install essential linux dependencies.
COPY ./setup/linux/deps /tmp/deps
RUN /tmp/deps/install.sh

# Assume the user.
USER $USER
ENV USER_HOME /home/$USER
WORKDIR $USER_HOME

# Setup the chezmoi directory.
ENV CHEZMOI_HOME $USER_HOME/.local/share/chezmoi

# Install chezmoi binary.
RUN mkdir -p $CHEZMOI_HOME \
	&& mkdir -p $USER_HOME/bin \
	&& sh -c "$(curl -fsLS git.io/chezmoi)"

# Copy the dotfiles.
COPY . $CHEZMOI_HOME

# Apply chezmoi source state and configuration.
RUN $USER_HOME/bin/chezmoi init --apply

# Start fish shell.
CMD fish

