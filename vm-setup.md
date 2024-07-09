## Overview
Setting up VM for the Inception project.

## Table of Contents
- [Installing packages](#Installing-packages)
- [Installing Docker](#Installing-Docker-on-Ubuntu-using-the-`apt`-repository)

# Installing packages
```bash
sudo apt install vim
sudo apt install make
```

# Installing Docker on Ubuntu using the `apt` repository
Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository.
Afterward, you can install and update Docker from the repository.

## Set up Docker's `apt` repository

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Install the Docker packages.

To install the latest version, run:
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
Verify that the Docker Engine installation is successful by running the hello-world image.
```bash
sudo docker run hello-world
```
This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

You have now successfully installed and started Docker Engine.

---

> **Receiving errors when trying to run without root?**
>
> The docker user group exists but contains no users, which is why you’re required to use sudo to run Docker commands. Continue to Linux postinstall to allow non-privileged users to run Docker commands and for other optional configuration steps.

1. Create the docker group.
```bash
sudo groupadd docker
```
1. Add your user to the docker group.
```bash
sudo usermod -aG docker $USER
```
2. Log out and log back in so that your group membership is re-evaluated.
If you're running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
You can also run the following command to activate the changes to groups:
```bash
newgrp docker
```
Verify that you can run docker commands without `sudo`.
