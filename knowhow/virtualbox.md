In ubuntu 16.04:

Ensure the right versions for:
  - virtualbox -> By apt 5.0.40
  - virtualbox-dkms -> By apt 5.0.40
  - linux-headers-generic -> last kernel update with dselect-upgrade

Disable validation
  - sudo apt install mokutil
  - sudo mokutil --disable-validation

Reconfigure
  - sudo dpkg-reconfigure virtualbox-dkms
  - sudo dpkg-reconfigure virtualbox
  - sudo modprobe vboxdrv
  - reboot
  - disable UEFI BootSecure