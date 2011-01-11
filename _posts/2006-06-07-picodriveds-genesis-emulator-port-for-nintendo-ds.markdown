--- 
wordpress_id: 24
layout: post
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
