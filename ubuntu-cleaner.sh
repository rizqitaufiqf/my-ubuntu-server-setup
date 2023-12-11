#!/usr/bin/env bash
set -eu

# mark a few packages as explicitly installed
mark-wanted() {
  apt install -y \
    bash git tmux vim htop \
    unattended-upgrades \
    software-properties-common;
}

# install ansemjo/dotfiles
install-dotfiles() {
  dot=/usr/local/etc/dotfiles;
  if [[ ! -d $dot ]]; then
    git clone "https://github.com/ansemjo/dotfiles" "$dot";
    bash "$dot/install.sh" -bgtv;
  fi;
}

# remove unwanted packages and purge leftover configuration
purge-unwanted() {
  apt autoremove --purge -y \
    snapd lxd-agent-loader ufw command-not-found \
    apport alsa-ucm-conf alsa-topology-conf byobu \
    cloud-init cloud-guest-utils cloud-initramfs-copymods cloud-initramfs-dyn-netconf \
    landscape-common motd-news-config pollinate popularity-contest ubuntu-advantage-tools \
    open-iscsi multipath-tools accountsservice cryptsetup-initramfs open-vm-tools;
  rm -rvf \
    /root/snap \
    /etc/pollinate \
    /etc/cloud \
    /var/lib/cloud \
    /var/lib/command-not-found;
}

# install virtualization packages
install-virtualization() {
  add-apt-repository -y ppa:jacob/virtualisation;
  apt install -y qemu-kvm libvirt-daemon-system libvirt-clients virtinst;
}

# install firewalld
install-firewalld() {
  apt install -y firewalld;
}

# ---------------

mark-wanted
purge-unwanted
#install-virtualization
install-firewalld
install-dotfiles
