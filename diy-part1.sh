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
#echo -e "src-git OpenAppFilter https://github.com/destan19/OpenAppFilter" >> feeds.conf.default
