apt install virtinst > /home/celiyah/Code/bash-cm/run.log
echo "" >> /home/celiyah/Code/bash-cm/run.log
apt install virt-manager >> /home/celiyah/Code/bash-cm/run.log
echo "" >> /home/celiyah/Code/bash-cm/run.log
apt install virt-viewer >> /home/celiyah/Code/bash-cm/run.log
echo "" >> /home/celiyah/Code/bash-cm/run.log
rm -f /lib/systemd/system/install-kvm.service /home/celiyah/Code/bash-cm/run.log
echo "" >> /home/celiyah/Code/bash-cm/run.log
systemctl daemon-reload /home/celiyah/Code/bash-cm/run.log
echo "" >> /home/celiyah/Code/bash-cm/run.log
echo "Commands ran successfully!" >> /home/celiyah/Code/bash-cm/run.log
