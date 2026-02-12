#!/bin/bash

# 自定义脚本

# 添加 iStore 源
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store
./scripts/feeds install -d y -p istore luci-i18n-store-zh-cn

# 设默认首页为 iStore
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/99-istore-index <<EOF
#!/bin/sh
uci set luci.main.index=/cgi-bin/luci/istore
uci commit luci
EOF
chmod +x files/etc/uci-defaults/99-istore-index
