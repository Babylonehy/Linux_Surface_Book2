1. 生成备份文件
```
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > /tmp/dconf-media-keys.dump
```
1. 清空自定义快捷键
```
dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/
```
注意 -f 选项，不要慌！

1. 一键导入自定义快捷键
```
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < /tmp/dconf-media-keys.dump
```
From：https://www.jianshu.com/p/80016da23130
