#!/bin/bash

patch -i ${GITHUB_WORKSPACE}/CustomFiles/mac80211_d-team_newifi-d2.patch package/kernel/mac80211/files/lib/wifi/mac80211.sh

cp -a ${GITHUB_WORKSPACE}/CustomFiles/system_d-team_newifi-d2 package/base-files/files/etc/config/system

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/Newifi-D2/g' package/base-files/files/bin/config_generate

cd package/lean  
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  
git clone https://github.com/jerrykuku/luci-app-argon-config

cd ..
mkdir luci-app-openclash
cd luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git

po2lmo
pushd luci-app-openclash/tools/po2lmo
make && sudo make install
popd

