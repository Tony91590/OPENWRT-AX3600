# 删除并替换nss驱动
#rm -rf package/qca/nss
#svn co https://github.com/Boos4721/openwrt/trunk/package/qca/nss package/qca/nss

# 删除无用文件
rm -rf package/feeds/packages/v2raya

# 添加pppoe拨号
sed -i '/exit/i\uci set network.wan.proto='pppoe'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.username='07521205834879'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.password='123456780'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan6.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci commit network' package/lean/default-settings/files/zzz-default-settings

# 修改管理IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 修改root密码
sed -i 's/V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/bt44IxMu$i4NgW46.Dpkm5VCZeffEL0:18984/g' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（GONGCZ $(TZ=UTC+8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /HONGCZ $(TZ=UTC-8 date +"%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

# 修改主机名字为AX3600
sed -i '/uci commit system/i\uci set system.@system[0].hostname='AX3600'' package/lean/default-settings/files/zzz-default-settings

# 替换私人WIFI设置
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/main/mac80211.sh > package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认5G wifi名称
#sed -i 's/radio${devidx}.ssid=OpenWrt/radio1.ssid=CL_5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 详细到修改双频WiFi名称
#sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=CL/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/set wireless.default_radio0.ssid=CL/a\set wireless.default_radio1.ssid=CL_5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改wifi加密方式与密码
#sed -i 's/radio${devidx}.channel=${channel}/radio1.channel=44/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/radio${devidx}.disabled/radio1.disabled/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/set wireless.default_radio\${devidx}.encryption=psk2/a\set wireless.default_radio\$\{devidx\}.key=12345678123' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 取消bootstrap为默认主题，改为argon-18.06
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile
