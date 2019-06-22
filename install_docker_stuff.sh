#!/bin/bash

sudo pacman -S docker docker-compose
sudo systemctl start docker.service

# allow docker commands to be run without always needing sudo since the docker group is
# root
sudo usermod -aG docker $USER
