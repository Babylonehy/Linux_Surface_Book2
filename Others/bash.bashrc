#atom
alias atom="atom-beta"
#clash
alias clash="cd /home/lyn/Desktop/clash && sh ./clash_start.sh -d ."
alias clashoff="gsettings set org.gnome.system.proxy mode 'none' "
alias clashon="gsettings set org.gnome.system.proxy mode 'manual' "
# show
#CUDA10.2
PATH=/usr/local/cuda-10.2/bin${PATH:+:${PATH}}$
LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#PyCharm
alias pycharm="cd /home/lyn/pycharm-2019.3.3/bin && ./pycharm.sh"
#miwifi
alias miwifi="sshpass -p '9daf20d2' ssh root@192.168.31.1"
#telegram
alias telegram="/home/lyn/Telegram/Telegram"
# aria2
alias dl="aria2c "
# Gesetting
GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
# xrander
alias newdispaly="xrandr --output DP-1 --scale 2x2 && xrandr --output eDP-1 --scale 0.9999x0.9999"
# Nvidia
alias smi="watch -n 1 -d nvidia-smi "
# Surface
alias dgpuon="sudo surface dgpu set on"
alias dgpuoff="sudo surface dgpu set off"