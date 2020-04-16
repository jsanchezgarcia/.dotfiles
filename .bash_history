pip install --upgrade pip
./setup/setup-venv.sh 
./setup/setup-vcan.sh 
python tests/run.py 
ssh gpu
ssh harv6-vpn
sudo apt-get update
sudo apt-get upgrade -y
nano ~/.ssh/config 
ssh harv6-vpn
nano ~/.ssh/config 
ssh harv4-vpn
aftvpn
ssh harv4-vpn
ssh gpu
ssh harv3-vpn
code /home/juan/.ssh/config 
ssh harv6-vpn
ssh aftmaster-r6
ssh aftmaster_r6
ping aft-harv006.advanced.farm
ping h6.aft.tips
ssh harv6-vpn
ssh-copy-id harv6-vpn
ssh harv6-vpn
sudo nano /etc/default/grub 
update-grub
sudo update-grub
sudo nano /etc/default/grub 
sudo update-grub
sudo apt-get install --install-recommends linux-generic-hwe-16.04 xserver-xorg-hwe-16.04
sudo apt autoremove
xinput list
sudo gedit /usr/share/x11/xorg.conf.d/*synaptics-quirks.conf
sudo nano /usr/share/x11/xorg.conf.d/*synaptics-quirks.conf
sudo apt-get install xserver-xorg-input-libinput-hwe-16.04 libinput-tools xorg-input-abi-24
sudo reboot -h now
sudo gedit /usr/share/X11/xorg.conf.d/*synaptics.conf
sudo gedit /usr/share/X11/xorg.conf.d/*libinput.conf
sudo reboot -h now
ifconfig
sudo lshw -class-network
sudo lshw -class network
sudo chmod 755 /etc/pm/config.d/
nano /etc/pm/config.d/config
sudo nano /etc/pm/config.d/config
sudo reboot -h now
dotfiles config --local status.showUntrackedFiles no
