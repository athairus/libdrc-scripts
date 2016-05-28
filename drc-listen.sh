# Set these

# MACs
WII_U_MAC=aa:bb:cc:dd:ee:ff	# Wii U's MAC/BSSID
DRC_MAC=aa:bb:cc:dd:ee:ff	# DRC's (gamepad's) MAC
WIFI_MAC=aa:bb:cc:dd:ee:ff	# WiFi dongle/card's MAC

# Interface name
WLAN=wlan0				

# Paths
HOSTAPD=$HOME/Documents/drc-hostap/hostapd/hostapd
HOSTAPD_CONF=$HOME/Documents/drc-hostap/hostapd/wiiu_ap_normal.conf
NETBOOT=$HOME/Documents/netboot/netboot

# Leave these alone

# Set WiFi dongle's MAC the same as the Wii U
sudo ip link set dev $WLAN down 
sudo ip link set dev $WLAN address "$WII_U_MAC"
sudo ip link set dev $WLAN up 

# Set ap subnet
sudo ip a a 192.168.1.10/24 dev $WLAN
sudo ip l set mtu 1800 dev $WLAN

# Start listening for the gamepad 
sudo screen -dmS hostapd $HOSTAPD -dd $HOSTAPD_CONF
sudo screen -dmS netboot $NETBOOT 192.168.1.255 192.168.1.10 192.168.1.11 $DRC_MAC

echo './hostappd.sh'
echo './netboot.sh'
echo 'CTRL+A, D detaches'
echo "Don't forget to quit"