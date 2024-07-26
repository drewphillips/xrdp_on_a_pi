#!/bin/bash

apt install xrdp

service xrdp start

echo "[Allow Wifi Scan]
Identity=unix-user:*
Action=org.freedesktop.NetworkManager.wifi.scan;org.freedesktop.NetworkManager.enable-disable-wifi;org.freedesktop.NetworkManager.settings.modify.own;org.freedesktop.NetworkManager.settings.modify.system;org.freedesktop.NetworkManager.network-control
ResultAny=yes
ResultInactive=yes
ResultActive=yes" > /etc/polkit-1/localauthority/50-local.d/wifiScan.pkla

echo "[Authorize packagekit updates for remote sessions]
Identity=unix-group:*
Action=org.freedesktop.packagekit.system-sources-refresh
ResultAny=yes" > /etc/polkit-1/localauthority/50-local.d/xrdp-packagekit.pkla

adduser xrdp ssl-cert

cp /etc/X11/xrdp/xorg.conf /etc/X11/xrdp/xorg.conf.bak
cp xorg.conf /etc/X11/xrdp/xorg.conf

echo | hostname -I
echo record the IP address or create a statick one. Login with RDP.
