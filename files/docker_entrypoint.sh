#!/bin/sh
set -e
export image_name=psiphon_lantern_live
mkdir /tmp/live_build
cd /tmp/live_build

lb config --image-name $image_name --architectures $arch --bootappend-live "boot=live components locales=$locales keyboard-layouts=$kblayouts keyboard-options=grp:alt_shift_toggle,grp_led:scroll"

# Logo
mkdir ./config/bootloaders/syslinux_common
cp /var/files/logo/logo.svg ./config/bootloaders/syslinux_common/splash.svg
mkdir ./config/bootloaders/grub-pc
cp /var/files/logo/logo.png ./config/bootloaders/grub-pc/splash.png

# Create Shortcut
mkdir -p ./config/includes.chroot_after_packages/usr/share/applications/
cp /var/files/shortcuts/* ./config/includes.chroot_after_packages/usr/share/applications/
chown -R 0:0 ./config/includes.chroot_after_packages/usr/share/applications/*.desktop
chmod -R 644 ./config/includes.chroot_after_packages/usr/share/applications/*.desktop

#Psiphon config
mkdir -p ./config/includes.chroot_after_packages/etc/
cp /var/files/psiphon.config ./config/includes.chroot_after_packages/etc/psiphon.config
chown -R 0:0 ./config/includes.chroot_after_packages/etc/psiphon.config
chmod -R 644 ./config/includes.chroot_after_packages/etc/psiphon.config

#Packages
echo xfce4 > ./config/package-lists/my.list.chroot
echo firefox-esr >> ./config/package-lists/my.list.chroot
echo firefox-esr-l10n-all >> ./config/package-lists/my.list.chroot
echo kwrite >> ./config/package-lists/my.list.chroot
echo network-manager-gnome >> ./config/package-lists/my.list.chroot
echo gdebi >> ./config/package-lists/my.list.chroot
echo flatpak >> ./config/package-lists/my.list.chroot

echo bleachbit >> ./config/package-lists/my.list.chroot
# echo default-jdk >> ./config/package-lists/my.list.chroot # For Freenet
echo irssi >> ./config/package-lists/my.list.chroot
echo kodi >> ./config/package-lists/my.list.chroot
echo nextcloud-desktop >> ./config/package-lists/my.list.chroot
echo newsboat >> ./config/package-lists/my.list.chroot
echo onionshare >> ./config/package-lists/my.list.chroot
echo proxychains >> ./config/package-lists/my.list.chroot
echo pulseeffects >> ./config/package-lists/my.list.chroot
echo python2 >> ./config/package-lists/my.list.chroot
echo python3 >> ./config/package-lists/my.list.chroot
echo telegram-cli >> ./config/package-lists/my.list.chroot
echo telegram-desktop >> ./config/package-lists/my.list.chroot
# echo telegram-purple >> ./config/package-lists/my.list.chroot
echo thunderbird >> ./config/package-lists/my.list.chroot
echo thunderbird-l10n-all >> ./config/package-lists/my.list.chroot
echo tor >> ./config/package-lists/my.list.chroot
echo torsocks >> ./config/package-lists/my.list.chroot
echo w3m >> ./config/package-lists/my.list.chroot
echo zathura >> ./config/package-lists/my.list.chroot

# Hooks
cp /var/files/hooks/* ./config/hooks/live/
chmod +x ./config/hooks/live/*

#Build
lb build
cp -r /tmp/live_build/$image_name-$arch.hybrid.iso /shared/psiphon_lantern_live_build_$(date +'%Y.%m.%d_%H_%M').iso    
chown -R $user:$group /shared/

