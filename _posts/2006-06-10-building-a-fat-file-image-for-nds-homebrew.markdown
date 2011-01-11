--- 
wordpress_id: 25
layout: post
title: Building a FAT file image for NDS Homebrew
wordpress_url: http://www.cryptosystem.org/archives/2006/06/building-a-fat-file-image-for-nds-homebrew/
---
While working on PicoDriveDS, I figured it would be easier to test if I used WMB instead of swapping SD cards all the time. I set up WMB, but much to my dismay, it didn't appear to work correctly with my SCSD - the program would start, but it couldn't read the files or directories. Due to testing by other people, I knew the CF version worked fine this way, but I didn't have a CF cartridge to use. I _did_, however, have a 256Mbit GBA cart, and chishm's FAT library has a driver called FCSR which can access a FAT image stored on a normal flash cart. The problem is finding instructions for how to build this properly. Here's how I did it:

    dd if=/dev/zero of=fat.img bs=512 count=32000
    sudo losetup /dev/loop0 fat.img
    sudo mkdosfs -F16 /dev/loop0
    sudo losetup -d /dev/loop0

Now you can mount fat.img to your favorite mountpoint, copy files to it, then unmount. After that, what you have to do is open it up in a hex editor, go to offset 0x100 (nothing should be there, don't worry), and insert the string "FCSR Chishm FAT", ensuring it is null-terminated. For write support, following this null-terminated string should be the start sectors for 4 SRAM overlays, then followed by each of their sizes (I have not tested this). If you just want a filesystem on the cart so you can access it over WMB (like me), you can flash the image to a cart now. Otherwise, any rom you wish to use should be padded so that the image will be aligned on a multiple of 512 bytes, then prepended to the image.
