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
sed -i 's/192.168.1.1/192.168.101.1/g' package/base-files/files/bin/config_generate

echo "root:$1$0DPpHGlH$50IFcWtXTfBMnEv9Su5rK0:18615:0:99999:7:::" > package/base-files/files/etc/shadow
echo "daemon:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "ftp:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "network:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "nobody:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "dnsmasq:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow

pushd package/luci-app-shadowsocks/tools/po2lmo
make && sudo make install
popd

mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull origin master
git branch --set-upstream-to=origin/master master

# 编译 po2lmo (如果有po2lmo可跳过)
pushd luci-app-openclash/tools/po2lmo
make && sudo make install
popd
