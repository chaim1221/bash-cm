wget -O /home/celiyah/Downloads/vagrant_1.8.6_x86_64.deb "https://releases.hashicorp.com/vagrant/1.8.6/vagrant_1.8.6_x86_64.deb"
sudo dpkg -i /home/celiyah/Downloads/vagrant_1.8.6_x86_64.deb
sudo apt install -f
# confused why this is apt-get and not apt-get install?
sudo apt-get build-dep vagrant ruby-libvirt
sudo apt-get install qemu libvirt-bin ebtables dnsmasq
sudo apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
vagrant plugin install vagrant-libvirt
