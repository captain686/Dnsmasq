# Dnsmasq Docker

## ⛷️`What`

- 使用`Dnsmasq`自建`DNS`服务器来管理内网`web`平台
- 搭配`OpenWrt`使用可避免在所有内网机器中指定`DNS`服务器
- 配合`Nginx`的`proxy_pass`可实现不同自定义域名访问同一机器上不同端口的`web`服务

## 🚩Why

- `OpenWrt`自身就使用`Dnsmasq`作为`DNS`服务器为何还要再另搭建一个？

  `A`: 增加容错率，防止因为误操改错`Dnsmasq`配置导致全部`DNS`失效，从而无法上网（`OpenWrt`的`bash`你敢动他就敢崩）

## 😶‍🌫️How

- 在`dns`目录下的`hosts.dnsmasq`文件中加入你的自定义规则

  ```bash
  docker-compose up
  ```

- `DNS`服务器监听在53端口，注意机器是否有防火墙规则
