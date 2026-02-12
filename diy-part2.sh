# 设默认首页为 iStore
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/99-istore-index <<EOF
#!/bin/sh
uci set luci.main.index=/cgi-bin/luci/istore
uci commit luci
EOF
chmod +x files/etc/uci-defaults/99-istore-index
