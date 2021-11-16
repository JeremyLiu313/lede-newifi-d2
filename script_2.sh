#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

cd package/lean  
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  
git clone https://github.com/jerrykuku/luci-app-argon-config

cd ../..
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git

# po2lmo
# pushd luci-app-openclash/tools/po2lmo
# make && sudo make install
# popd

