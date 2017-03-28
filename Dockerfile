FROM ubuntu

# Install OpenSSH and basics
RUN apt-get update && apt-get install -y openssh-server

# Make ssh run when the container starts
ENTRYPOINT service ssh restart && bash

# ------------------------ Ruby installation -------------------------

# Install Ruby dependencies

RUN apt-get install -y software-properties-common autoconf bison build-essential libssl-dev libyaml-dev
RUN apt-get install -y git libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

# Add Ruby repository

RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN apt-get update

# Install Ruby versions

RUN apt-get install ruby2.3 -y
RUN apt-get install ruby2.3-dev -y

# Install Ruby switcher and bundler

RUN apt-get install ruby-switch -y
RUN gem install bundler

# Create user deployer
RUN useradd deployer -m -s /bin/bash -d /home/deployer
RUN mkdir -p /home/deployer/.ssh

# Add user to sudoers


# Install Git and Copy GitHub keys
RUN apt-get install git -y
RUN touch /etc/sudoers.d/deployer
RUN echo "deployer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/deployer

COPY id_rsa /home/deployer/.ssh/id_rsa
COPY id_rsa.pub /home/deployer/.ssh/id_rsa.pub


# Create authorized keys
RUN cp /home/deployer/.ssh/id_rsa.pub /home/deployer/.ssh/authorized_keys

# Set permissions for files and folders created

RUN chmod 400 /home/deployer/.ssh/id_rsa
RUN chmod 600 /home/deployer/.ssh/id_rsa.pub
RUN chown -R deployer:deployer /home/deployer
