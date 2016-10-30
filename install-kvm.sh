echo -e "\e[1;32mUpgrading...\e[0m"

sudo apt-get update && sudo apt-get upgrade

if
  [ $? -eq 0 ]; then
    echo -e "\e[1;36mUpgrade complete!\e[0m"
  else
    echo -e "\e[1;31mUpgrade failed. Exiting.\e[0m"
    exit 1
fi

echo -e "\e[1;32mChecking processor info...\e[0m"
if
  [ $(egrep -c '(vmx|svm)' /proc/cpuinfo) -gt 0 ]; then
    echo -e "\e[1;36mProcessor capable of running KVM...\e[0m"
  else
    echo -e "\e[1;31mProcessor NOT capable of running KVM, exiting...\e[0m"
    exit 1
fi

if
  [ $(egrep -c ' lm ' /proc/cpuinfo) -gt 0 ]; then
    echo -e "\e[1;36mCPU has 64-bit cores available...\e[0m"
  else
    echo -e "\e[1;31mProcessor is not capable of 64-bit operations. Exiting.\e[0m"
    exit 1
fi

if
  [ $(uname -m) == "x86_64" ]; then
    echo -e "\e[1;36m64-bit kernel detected...\e[0m"
  else
    echo -e "\e[1;31m64-bit kernel not found. Exiting.\e[0m"
    exit 1
fi

echo -e "\e[1;32mInstalling qemu-kvm and libvirt-bin\e[0m"
sudo apt install qemu-kvm libvirt-bin
echo -e "\e[1;32mAdding $USER to group libvirtd...\e[0m"
sudo adduser $USER libvirtd
echo -e "\e[1;32mCopying install-kvm.service to systemd...\e[0m"
sudo cp "install-kvm.service" /lib/systemd/system/
echo -e "\e[1;32mRebooting...\e[0m"
sudo reboot now
