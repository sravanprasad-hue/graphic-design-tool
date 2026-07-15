#!/bin/bash

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  git \
  unzip

# Install Docker
install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo ${UBUNTU_CODENAME:-$VERSION_CODENAME}) stable" \
  > /etc/apt/sources.list.d/docker.list

apt-get update

apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

# Install Java
apt-get install -y openjdk-21-jre

# Install Jenkins
install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key \
  -o /etc/apt/keyrings/jenkins-keyring.asc

echo \
  "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

apt-get update

apt-get install -y jenkins

usermod -aG docker jenkins

systemctl enable jenkins
systemctl restart jenkins

# Install Terraform
cd /tmp

TERRAFORM_VERSION="1.15.8"

curl -fsSLO \
  "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

unzip \
  "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

install terraform /usr/local/bin/terraform

# Clone application
cd /opt

git clone \
  https://github.com/sravanprasad-hue/graphic-design-tool.git \
  graphic-design-tool

chown -R ubuntu:ubuntu /opt/graphic-design-tool

echo "Server provisioning completed"
