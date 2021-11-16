#!/bin/bash

mkdir package/luci-app-openclash
cd package/luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git

po2lmo
pushd luci-app-openclash/tools/po2lmo
make && sudo make install
popd