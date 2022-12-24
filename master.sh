#!/bin/bash
sudo docker swarm init --advertise-adr=192.168.15.100
sudo docker swarm join-token nodwork |grep docker > /vagrant/nodwork.sh