# https://jamielinux.com/docs/libvirt-networking-handbook/bridged-network.html
MAC=$(ip address show dev enp0s25 | awk '$1=="link/ether" {print $2}')
#echo "${MAC}"
echo "net.bridge.bridge-nf-call-ip6tables=0"  > /etc/sysctl.d/bridge.conf
echo "net.bridge.bridge-nf-call-iptables=0"  >> /etc/sysctl.d/bridge.conf
echo "net.bridge.bridge-nf-call-arptables=0"  >> /etc/sysctl.d/bridge.conf
echo 'ACTION=="add", SUBSYSTEM=="module", KERNEL=="br_netfilter", RUN+="/sbin/sysctl -p /etc/sysctl.d/bridge.conf"'  > /etc/udev/rules.d/99-bridge.rules
apt install bridge-utils
cp ./interfaces.template ./interfaces
sed -i -e "s/\[MAC\]/${MAC}/g" ./interfaces
mv /etc/network/interfaces /etc/network/interfaces.old
mv ./interfaces /etc/network
ip address flush enp0s25 scope global && ifup br0
brctl show br0

echo "You should now be ready to use bridging with VMs."
