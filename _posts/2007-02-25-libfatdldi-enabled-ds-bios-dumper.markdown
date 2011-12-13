--- 
permalink: archives/2007/02/libfatdldi-enabled-ds-bios-dumper
wordpress_id: 34
layout: default
comments: 
- :comment_content: |
    <p>But your time and efforts are still appriciated, appreciated :)</p>

  :comment_date: 2007-03-01 20:38:49 -05:00
  :comment_author: Clushje
- :comment_content: |
    <p>Whoops, meant to give a thank you as well ;)</p>

  :comment_date: 2007-03-01 20:39:20 -05:00
  :comment_author: Clushje
- :comment_content: |
    <p>I'm pretty new to this, so I have a few questions:
    1. What really are the Biosdumper for?
    2. Why aren't there any sound (using R4)?
    3. The game runs slow on this emulator, but on another (no sound there either) the same roms runs perfecly. Why?</p>
    
    <p>I really appreciate your work! Keep on!</p>

  :comment_date: 2007-12-22 15:48:58 -05:00
  :comment_author: Rozzcheno
- :comment_content: |
    <p>I'm guessing the project is dead? D:</p>

  :comment_date: 2008-02-13 21:36:52 -05:00
  :comment_author: Rocky
- :comment_content: |
    <p>Will this project be started again.  Lameboy came back after a year of being dead I hope this project does too.</p>

  :comment_date: 2008-05-28 21:38:19 -04:00
  :comment_author: Nicholas
- :comment_content: |
    <p>Is this project dead?  Hope not.  I loved the genesis but I can't play so many of the games on this emulator since they get like only 5fps.</p>

  :comment_date: 2008-07-04 23:56:25 -04:00
  :comment_author: Nicholas
title: libfat/DLDI-enabled DS BIOS Dumper
wordpress_url: http://www.cryptosystem.org/archives/2007/02/libfatdldi-enabled-ds-bios-dumper/
---
I'm aware that FluBBa and pepsiman have already written BIOS dumpers, but neither of these work well with modern carts (i.e. Slot-1 carts), and no source was available. So I whipped up my own ARM7/ARM9 BIOS dumper that should work on any cart supported by DLDI:

[http://www.cryptosystem.org/projects/nds/biosdumper/](http://www.cryptosystem.org/projects/nds/biosdumper/)

Thanks to Martin Korth for the info on GBATEK, and cearn for helping me with my assembly.

Edit: And right after I posted this I found out about [DSBF_dump](http://nds.cmamod.com/2007/01/24/dsbf_dump-79-bios-firmware-dumper/). Oh well.
