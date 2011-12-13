--- 
permalink: archives/2006/06/picodriveds-genesis-emulator-port-for-nintendo-ds
wordpress_id: 24
layout: default
comments: 
- :comment_content: |
    <p>Great Work! 
    (It works with M3-SD)</p>
    
    <p>Can't wait till the next Version ;-)</p>

  :comment_date: 2006-06-07 04:05:26 -04:00
  :comment_author: CoolFool
- :comment_content: |
    <p>Amazing. I can't wait to see what it can do after some rendering optimization. One thing I noticed though, you are scaling the smaller Genesis resolution oddly when you could probably avoid scaling it at all, or just vertically. There is that Genesis resolution that is 256x240 or something similar. Battletoads, Mega Man, and Teenage Mutant Ninja Turtles all run in that. Castlevania as well I believe. Anyways, this is an awesome start.</p>

  :comment_date: 2006-06-08 12:33:30 -04:00
  :comment_author: MottZilla
- :comment_content: |
    <p>I tried Ghosts and Ghouls and it works fine although there is no sound atm, is that normal?</p>

  :comment_date: 2006-06-09 06:02:24 -04:00
  :comment_author: Sulcalibur
- :comment_content: |
    <p>oops sorry just saw the post bit bout no sound, Doh!</p>
    
    <p>Superb work though.</p>

  :comment_date: 2006-06-09 06:05:16 -04:00
  :comment_author: Sulcalibur
- :comment_content: |
    <p>And so many people said that it couldnt be done, with some more work Im sure you could get this perfect.</p>

  :comment_date: 2006-08-27 09:42:54 -04:00
  :comment_author: echoes
title: PicoDriveDS - Genesis Emulator Port for Nintendo DS
wordpress_url: http://www.cryptosystem.org/archives/2006/06/picodriveds-genesis-emulator-port-for-nintendo-ds/
---
Ported this over the weekend, I think it's in a state now where some people will be able to use it. Initial reports are that it has issues running on CF-based carts, I only have a SuperCard SD to test with so I haven't been able to debug it on CF to see what's going on.

Built against SaTa's modified FAT libraries from REIN (SD users probably want this):

*   [http://www.cryptosystem.org/projects/nds/picodriveds.nds](http://www.cryptosystem.org/projects/nds/picodriveds.nds)
*   [http://www.cryptosystem.org/projects/nds/picodriveds.nds.gba](http://www.cryptosystem.org/projects/nds/picodriveds.nds.gba)

Built against chishm's FAT libraries with just CF enabled:

*   [http://www.cryptosystem.org/projects/nds/picodriveds-cf.nds](http://www.cryptosystem.org/projects/nds/picodriveds-cf.nds)
*   [http://www.cryptosystem.org/projects/nds/picodriveds-cf.nds.gba](http://www.cryptosystem.org/projects/nds/picodriveds-cf.nds.gba)

Copy it to your media, then copy over the Genesis ROMs you want to play (it should be able to play ROMs with .BIN, .GEN, and .SMD extensions). There's no sound, but since it uses the Cyclone 68k core which is optimized for ARM it runs well for the most part. Scaling is done in-software right now so the downscale isn't as fast or good as it could be. There's no double buffering yet so you might see tearing on some games. Y/B/A are A/B/C.

Screenshots:

*   [http://www.cryptosystem.org/projects/nds/picodriveds-0.1-1.jpg](http://www.cryptosystem.org/projects/nds/picodriveds-0.1-1.jpg)
*   [http://www.cryptosystem.org/projects/nds/picodriveds-0.1-2.jpg](http://www.cryptosystem.org/projects/nds/picodriveds-0.1-2.jpg)
*   [http://www.cryptosystem.org/projects/nds/picodriveds-0.1-3.jpg](http://www.cryptosystem.org/projects/nds/picodriveds-0.1-3.jpg)
*   [http://www.cryptosystem.org/projects/nds/picodriveds-0.1-4.jpg](http://www.cryptosystem.org/projects/nds/picodriveds-0.1-4.jpg)

Video:

*   [http://www.cryptosystem.org/projects/nds/spaceharrier2.wmv](http://www.cryptosystem.org/projects/nds/spaceharrier2.wmv)
