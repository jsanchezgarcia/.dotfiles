alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'



alias gostr='cd ~/strawberry; source start.sh'

alias depmaster='./setup/deploy.sh aftmaster:master; ./setup/deploy.sh aftwc1:master; \
./setup/deploy.sh aftwc2:master; ./setup/deploy.sh aftwc3:master; ./setup/deploy.sh \
aftwc4:master;'

alias depjs1='./setup/deploy.sh aftmaster:js1; ./setup/deploy.sh aftwc1:js1; \
./setup/deploy.sh aftwc2:js1; ./setup/deploy.sh aftwc3:js1; ./setup/deploy.sh \
aftwc4:js1;'

alias depmastervpn='./setup/deploy.sh aftmastervpn:master; ./setup/deploy.sh aftwc1vpn:master; \
./setup/deploy.sh aftwc2vpn:master; ./setup/deploy.sh aftwc3vpn:master; ./setup/deploy.sh \
aftwc4vpn:master;'

alias depjs1vpn='./setup/deploy.sh aftmastervpn:js1; ./setup/deploy.sh aftwc1vpn:js1; \
./setup/deploy.sh aftwc2vpn:js1; ./setup/deploy.sh aftwc3vpn:js1; ./setup/deploy.sh \
aftwc4vpn:js1;'

alias aftvpn='sudo openvpn --config /etc/openvpn/harvnet-vpn/openvpn-client.conf'

alias setup_emu='sudo ./setup/setup-v4l2loopback.sh; ./setup/setup-vcan.sh'
alias emu='EMU_PYREALSENSE2=1 python utils/emulator.py'
