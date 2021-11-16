#!/bin/bash

patch -i ${GITHUB_WORKSPACE}/CustomFiles/mac80211_d-team_newifi-d2.patch package/kernel/mac80211/files/lib/wifi/mac80211.sh

cp -a ${GITHUB_WORKSPACE}/CustomFiles/system_d-team_newifi-d2 package/base-files/files/etc/config/system

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/Newifi-D2/g' package/base-files/files/bin/config_generate