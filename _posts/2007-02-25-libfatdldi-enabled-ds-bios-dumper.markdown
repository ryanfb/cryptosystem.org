--- 
wordpress_id: 34
layout: post
title: libfat/DLDI-enabled DS BIOS Dumper
wordpress_url: http://www.cryptosystem.org/archives/2007/02/libfatdldi-enabled-ds-bios-dumper/
---
I'm aware that FluBBa and pepsiman have already written BIOS dumpers, but neither of these work well with modern carts (i.e. Slot-1 carts), and no source was available. So I whipped up my own ARM7/ARM9 BIOS dumper that should work on any cart supported by DLDI:

[http://www.cryptosystem.org/projects/nds/biosdumper/](http://www.cryptosystem.org/projects/nds/biosdumper/)

Thanks to Martin Korth for the info on GBATEK, and cearn for helping me with my assembly.

Edit: And right after I posted this I found out about [DSBF_dump](http://nds.cmamod.com/2007/01/24/dsbf_dump-79-bios-firmware-dumper/). Oh well.
