#!/bin/bash
if [ $# != 4 ] ; then
	echo "USAGE: $0 wifi-name wifi-pwd wireless-card-id"
	echo " e.g.: $0 foreaver 123456 eth0" 
exit 1; 

WIFI=$1
PSWD=$2
CARD=$3

## add wifi-id wifi-pass to config file
wpa_passphrase $WIFI $PSWD >> /etc/wpa_supplicant/wpa_supplicant.conf
## enable this wifi
wpa_supplicant -B -D wext -i $CARD -c /etc/wpa_supplicant/wpa_supplicant.conf
## allocate one ip to this wireless network card
dhclient $CARD

## config the auto-run by system start
echo "echo $PSWD | sudo wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf" >> /etc/rc.d/rc.local
echo "echo $PSWD | sudo dhclient wlan0" >> /etc/rc.d/rc.local
