--- 
permalink: archives/2005/03/kernel-development-with-qemu
wordpress_id: 5
layout: post
title: Kernel development with qemu
wordpress_url: http://www.cryptosystem.org/wordpress/?p=5
---
I was doing some kernel development, and I was getting a little tired of rebooting my laptop into the new kernel after each build. Having heard about [qemu](http://fabrice.bellard.free.fr/qemu/), I decided to give it a go. I found [a sample script](http://lists.gnu.org/archive/html/qemu-devel/2003-07/msg00043.html) for building a disk image to boot qemu off of, but it didn't seem to work. For example, the uuencoded information in that script produces output that makes gunzip complain that it's invalid. So I decided to roll my own disk image with the following commands:

    dd if=/dev/zero of=diskimage.img bs=1M count=512
    losetup /dev/loop0 diskimage.img
    mke2fs /dev/loop0
    mkdir mounted
    mount /dev/loop0 mounted
    debootstrap sid mounted/ http://ftp.us.debian.org/debian/

You should now have a nice base Debian install to diskimage.img. Clean up your mounts with:

    umount mounted
    losetup -d /dev/loop0

Then you can launch qemu with a command like:

    qemu -hda diskimage.img -kernel /path/to/bzImage -append 
      "root=/dev/hda sb=0x220,5,1,5 
      ide1=noprobe ide2=noprobe ide3=noprobe ide4=noprobe ide5=noprobe"

Ta-da! Once you're done, make sure you shutdown with "`shutdown -h now`" before closing out qemu, or you'll probably have to mount the image to loopback again and e2fsck it manually. You can also mount the image any time you'd like with "`mount -o loop diskimage.img mounted`" and muck about in the filesystem, or even act like you're on it locally by using the `chroot` command after you've mounted it. If you get an error like:

    Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0)

when you try to boot, make sure you have ext2 support built in to your kernel, also set `CONFIG_IDE`, `CONFIG_BLK_DEV_IDE`, and `CONFIG_BLK_DEV_IDEDISK` to be built in as well.
