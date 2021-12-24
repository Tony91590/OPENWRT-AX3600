# 增加私人设置
svn co https://github.com/hongcz1104/Openwrt_Build/trunk/config package/base-files/files/etc/config

# 修改管理IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 修改root密码
sed -i 's/V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/bt44IxMu$i4NgW46.Dpkm5VCZeffEL0:18984/g' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（GONGCZ $(TZ=UTC+8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /HONGCZ $(TZ=UTC-8 date +"%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把AX3600改成喜欢的的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='AX3600'' package/lean/default-settings/files/zzz-default-settings

# 修改默认5G wifi名称ssid为AX3600(双频一起换了)
sed -i 's/radio${devidx}.ssid=OpenWrt/radio1.ssid=CL_5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 详细到修改双频WiFi名称
#sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=CL/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/set wireless.default_radio0.ssid=CL/a\set wireless.default_radio1.ssid=CL_5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改wifi加密方式与密码
sed -i 's/radio${devidx}.disabled/radio1.disabled/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio\${devidx}.encryption=psk2/a\set wireless.default_radio\$\{devidx\}.key=12345678123' package/kernel/mac80211/files/lib/wifi/mac80211.sh

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile

#删除并替换某些文件
rm -rf ./package/feeds/packages/v2raya
rm -rf package/qca/nss
svn co https://github.com/Boos4721/openwrt/trunk/package/qca/nss package/qca/nss
