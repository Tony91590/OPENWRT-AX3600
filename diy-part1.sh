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

# 移除原版软件包    
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-app-jd-dailybonus
rm -rf ./package/lean/luci-app-pushbot
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/aliyundrive-webdav
rm -rf ./package/lean/luci-app-aliyundrive-webdav
rm -rf ./package/lean/luci-app-cpufreq
rm -rf ./package/lean/luci-app-kodexplorer
  
# 添加自己的插件库
echo -e "\nsrc-git hongcz https://github.com/hongcz1104/openwrt-packages" >> feeds.conf.default
#echo -e "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
#echo -e "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
#echo -e "src-git OpenAppFilter https://github.com/destan19/OpenAppFilter" >> feeds.conf.default
