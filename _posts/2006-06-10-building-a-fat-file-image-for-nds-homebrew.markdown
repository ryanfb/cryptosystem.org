--- 
permalink: archives/2006/06/building-a-fat-file-image-for-nds-homebrew
wordpress_id: 25
layout: post
comments: 
- :comment_content: |
    <p>Erm, I'm a programming n00b. how can I do this easily? is there some program  that allows me to do that easily?</p>

  :comment_date: 2006-06-21 12:36:30 -04:00
  :comment_author: Bibin
- :comment_content: |
    <p>Not yet - for Windows it might be possible to build the FAT image with <a href=http://www.winimage.com/winimage.htm rel=\\\"nofollow\\\" rel=\"nofollow\" rel="nofollow">WinImage</a>, which might be easier for that part. The rest isn't all that difficult - any hex editor will do the job, you just have to be confident in your abilities. If it doesn't work, just try to figure out where you went wrong and reflash your cart, it shouldn't affect anything.</p>

  :comment_date: 2006-06-23 18:40:32 -04:00
  :comment_author: ryanfb
- :comment_content: |
    <p>Simpler way:
    dd if=/dev/zero of=fat.img bs=512 count=32000
    mkdosfs -F16 fat.img
    mount -o loop fat.img /mountpoint</p>
    
    <p>Possibilities for windows users:
    1. colinux (i highly recommend this...it may be a bit tricky to set up, but then it is very nice)
    2. knoppix
    3. vmware or similar</p>

  :comment_date: 2006-06-25 13:43:15 -04:00
  :comment_author: Davr
- :comment_content: |
    <p>Just a note so that people who find this page know about it. There's a windows utility by GPF for creating FCSR images. Also includes a linux script to automate it.</p>
    
    <p>http://gpf.dcemu.co.uk/</p>
    
    <p>It's in the left sidebar as fcsrimage.zip</p>

  :comment_date: 2006-11-29 09:09:32 -05:00
  :comment_author: Davr
title: Building a FAT file image for NDS Homebrew
wordpress_url: http://www.cryptosystem.org/archives/2006/06/building-a-fat-file-image-for-nds-homebrew/
---
While working on PicoDriveDS, I figured it would be easier to test if I used WMB instead of swapping SD cards all the time. I set up WMB, but much to my dismay, it didn't appear to work correctly with my SCSD - the program would start, but it couldn't read the files or directories. Due to testing by other people, I knew the CF version worked fine this way, but I didn't have a CF cartridge to use. I _did_, however, have a 256Mbit GBA cart, and chishm's FAT library has a driver called FCSR which can access a FAT image stored on a normal flash cart. The problem is finding instructions for how to build this properly. Here's how I did it:

    dd if=/dev/zero of=fat.img bs=512 count=32000
    sudo losetup /dev/loop0 fat.img
    sudo mkdosfs -F16 /dev/loop0
    sudo losetup -d /dev/loop0

Now you can mount fat.img to your favorite mountpoint, copy files to it, then unmount. After that, what you have to do is open it up in a hex editor, go to offset 0x100 (nothing should be there, don't worry), and insert the string "FCSR Chishm FAT", ensuring it is null-terminated. For write support, following this null-terminated string should be the start sectors for 4 SRAM overlays, then followed by each of their sizes (I have not tested this). If you just want a filesystem on the cart so you can access it over WMB (like me), you can flash the image to a cart now. Otherwise, any rom you wish to use should be padded so that the image will be aligned on a multiple of 512 bytes, then prepended to the image.
