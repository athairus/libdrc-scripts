# Patched MAC80211 module
# Change to reflect your setup
PATCHEDKO=$HOME/Documents/linux/src/linux-4.5/net/mac80211/mac80211.ko

# Interface Name
WLAN=wlan0		

# Unload modules in the correct order
sudo rmmod rt2800usb
sudo rmmod rt2800lib
sudo rmmod rt2x00usb
sudo rmmod rt2x00lib
sudo rmmod mac80211

# Load patched mac80211 module and rt2800 modules
sudo insmod $PATCHEDKO
sudo modprobe rt2800usb

# Set regulatory domain
sudo iw reg set US

# Give it some time to load then check if everything's OK.
sleep 1
test -f "/sys/class/net/$WLAN/tsf" && echo 'Patched mac80211 and rt2800usb loaded.'
