# Modify default IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# Modify hostname
#sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# Delete default password
# sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 64位5.4内核切换5.10
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile

# 修改想要的root密码
#sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$uCK2IxJt$d.JPPvZJvJDioqTovr.2p/:18841:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings

# Modify the version number版本号里显示一个自己的名字（GONGCZ $(TZ=UTC+8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /HONGCZ $(TZ=UTC-8 date +"%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把AX3600改成喜欢的的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='AX3600'' package/lean/default-settings/files/zzz-default-settings

# 修改默认wifi名称ssid为AX3600(双频一起换了)
sed -i 's/ssid=OpenWrt/ssid=CL_5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 详细到修改双频WiFi名称
#sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=openwrtplus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/set wireless.default_radio0.ssid=openwrtplus/a\set wireless.default_radio1.ssid=openwrt' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改默认wifi密码key为你想要的密码
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改wifi加密方式与密码
sed -i '/set wireless.default_radio\${devidx}.encryption=psk2/a set wireless.default_radio\$\{devidx\}.key=12345678123' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 开启MU-MIMO
#sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#删除无用内容
rm -rf ./package/feeds/packages/v2raya

# themes添加（svn co 命令意思：指定版本如https://github）
#git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly package/luci-theme-Butterfly
#git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark package/luci-theme-Butterfly-dark
#svn co https://github.com/apollo-ng/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/luci-theme-darkmatter
#svn co https://github.com/solidus1983/luci-theme-opentomato/trunk/luci/themes/luci-theme-opentomato package/luci-theme-opentomato
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-edge package/luci-theme-edge
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argon_new package/luci-theme-argon_new
#svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
#svn co https://github.com/rosywrt/luci-theme-purple/trunk/luci-theme-purple package/luci-theme-purple
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial


##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile
