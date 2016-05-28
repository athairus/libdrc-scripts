# Set these

# MACs
WII_U_MAC=aa:bb:cc:dd:ee:ff	# Wii U's MAC/BSSID
DRC_MAC=aa:bb:cc:dd:ee:ff	# DRC's (gamepad's) MAC
WIFI_MAC=aa:bb:cc:dd:ee:ff	# WiFi dongle/card's MAC

# Interface name
WLAN=wlan0

# Paths
WPA_SUPPLICANT=$HOME/Documents/drc-hostap/wpa_supplicant/wpa_supplicant
WPA_SUPPLICANT_CONFIG=$HOME/Documents/drc-sim-keyboard/wpa_supplicant/connect-to-wii-u.conf

# Leave these alone

# Set WiFi dongle's MAC the same as the gamepad
sudo ip link set dev $WLAN down 
sudo ip link set dev $WLAN address "$DRC_MAC"
sudo ip link set dev $WLAN up 

# Connect to the Wii U
sudo $WPA_SUPPLICANT -Dnl80211 -i $WLAN -c $WPA_SUPPLICANT_CONFIG -dd 
