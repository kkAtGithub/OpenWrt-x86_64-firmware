#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i 's#192\.168\.1\.1#192.167.101.1#g'package/base-files/files/bin/config_generate

echo "root:$1$0DPpHGlH$50IFcWtXTfBMnEv9Su5rK0:18615:0:99999:7:::" > package/base-files/files/etc/shadow
echo "daemon:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "ftp:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "network:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "nobody:*:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "dnsmasq:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow

git clone https://github.com/shadowsocks/openwrt-feeds.git package/feeds
git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev
git clone https://github.com/shadowsocks/luci-app-shadowsocks.git package/luci-app-shadowsocks
git clone https://github.com/kuoruan/openwrt-frp.git package/frp
