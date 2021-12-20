#!/bin/bash
#=================================================
# DIY script

# 移除原版软件包    
rm -rf ./package/lean/aliyundrive-webdav
rm -rf ./package/lean/luci-app-aliyundrive-webdav
rm -rf ./package/lean/go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-cpufreq
  
  
# 添加自己的插件库
echo -e "\nsrc-git hongcz https://github.com/hongcz1104/openwrt-packages" >> feeds.conf.default
#echo -e "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
#echo -e "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
#echo -e "src-git OpenAppFilter https://github.com/destan19/OpenAppFilter" >> feeds.conf.default
