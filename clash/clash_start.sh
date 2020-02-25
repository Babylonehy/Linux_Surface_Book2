echo "set proxy to manual!"
echo "http://clash.razord.top/"
gsettings set org.gnome.system.proxy mode 'manual'
./clash-linux-amd64 -d .
