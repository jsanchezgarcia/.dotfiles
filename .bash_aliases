# Managing dotfiles repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#*************** AFT ALIASES **************#

# Go to strawberry folder and start venv
alias gostr='cd ~/strawberry; source start.sh'

# Start AFT VPN
alias aftvpn='sudo openvpn --config /etc/openvpn/harvnet-vpn/openvpn-client.conf'

# Setup software emulator
alias setup_emu='sudo ./setup/setup-v4l2loopback.sh; ./setup/setup-vcan.sh'

# Start software emulator
alias emu='EMU_PYREALSENSE2=1 python utils/emulator.py'

# Deploy to master and robots.
# dep_all harv3-vpn js1
dep_all ()
{
  if [ "$#" -ne 2 ]
  then
    echo "Not enough arguments. Usage: dep_all harv3-vpn js1"
  else
  ./setup/deploy.sh "$1":"$2"
  ./setup/deploy.sh "$1".robot01:"$2"
  ./setup/deploy.sh "$1".robot02:"$2"
  ./setup/deploy.sh "$1".robot03:"$2"
  ./setup/deploy.sh "$1".robot04:"$2"
  fi
}

# Deploy to master and robots using -i.
# dep_all_i harv3-vpn js1
dep_all_i ()
{
  if [ "$#" -ne 2 ]
  then
    echo "Not enough arguments. Usage: dep_all harv3-vpn js1"
  else
  ./setup/deploy.sh -i "$1":"$2"
  ./setup/deploy.sh -i "$1".robot01:"$2"
  ./setup/deploy.sh -i "$1".robot02:"$2"
  ./setup/deploy.sh -i "$1".robot03:"$2"
  ./setup/deploy.sh -i "$1".robot04:"$2"
  fi
}