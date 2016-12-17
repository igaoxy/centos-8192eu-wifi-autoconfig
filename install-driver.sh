#!/bin/bash

## path definition
DRIVER=Realtek-RTL8192EU-driver.tar.gz
DRIURL="https://doc-10-00-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/qnnh9alabgt7e22skl12oimfsnmfrgv2/1481940000000/12197417280545204388/*/0B_PyshAvItmPX3pwVEhKNEdDRTA?e=download"

## uname version
VERSION=$(uname -r)

## base yum config
yum -y install epel-release
yum upgrade ca-certificates

## base software
yum -y install lrzsz unzip ifconfig

## kernel-devel
yum -y install kernel-devel
yum -y install kernel-devel-$VERSION

## gcc gcc-c++ make and so on
yum -y groupinstall Development tools

## dkms
yum -y install dkms

## install iwconfig
yum -y install iwconfig

## wireless-tools
yum -y install wireless-tools

## wpa-supplicant
yum -y install wpa_supplicant

## install
tar zxvf $DRIVER
cd install_folder/
sh install.sh
iwconfig

## if wireless-network-card status is showed, that's successed.
