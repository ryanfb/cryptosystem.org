--- 
permalink: archives/2007/01/simple-gba-mode-switcher
wordpress_id: 32
layout: post
comments: 
- :comment_content: |
    <p>thats kool, hmm.. what if you make it vice versa? i mean like instead of a nds file switching to gba mode, make a gba. file that switched into nintendo ds mode for ds users.</p>

  :comment_date: 2007-01-25 15:45:22 -05:00
  :comment_author: wangtang
- :comment_content: |
    <p>One problem I had is that the DS doesn't always keep the most recent personal settings at that one location (it uses two that I have seen in my own firmware dumps, at any rate).</p>
    
    <p>Here is the code I used to get around that:
    http://l33t.spod.org/~cory1492/EZDStoGBA_V2.zip
    (also EZDStoGBA_V4.zip, EZDStoGBA_V3_Framed.zip, EZDStoGBA.zip at that same base url).</p>
    
    <p>Not nearly as tidy as yours, mind, and with ez4 specifically in mind for a couple things (bankswitching OS NOR for the reboot).</p>
    
    <p>Any rate, thanks for the goodies; I'm sure alot of people will indeed appreciate the tiny util :)</p>

  :comment_date: 2007-01-28 21:32:40 -05:00
  :comment_author: cory1492
- :comment_content: |
    <p>This is a very nice piece of software.... I was really looking for something like this I have an M3 Simply + EZ2 PS, so for me this is a great software.
    Thanks a lot!!!</p>

  :comment_date: 2007-02-01 12:54:20 -05:00
  :comment_author: Caco
- :comment_content: |
    <p>wangtang: I don't know of any way to switch back to DS mode once the GBA BIOS has been loaded and the DS is in GBA mode, so I'm not sure that's possible.</p>
    
    <p>cory1492: Thanks for the tip and the code, I'll have to have a look at it. I was going off the information in the NDSTech wiki as to where the copy of the personal settings was stored, and it seemed to work on my DS's (then again they both have FlashMe V7 installed).</p>

  :comment_date: 2007-02-01 20:42:25 -05:00
  :comment_author: ryanfb
- :comment_content: |
    <p>How to replace black border of GBA games on DS with an image.</p>
    
    <p>http://scdev.org/forum/viewtopic.php?t=5192&amp;start=60</p>

  :comment_date: 2007-02-06 04:21:06 -05:00
  :comment_author: GAA-GSG
- :comment_content: |
    <p>Have you perhaps heard of cartreset?  It allows you to boot a slot-2 and is in the form of an nds rom.  Works seamlessly on my DS-x w/ a G6 Lite.  It was a bit hard to find, but if you search for 'cartreset.zip' you should be able to find it in the DS-x forums.  I recall the coder also created LoveLite.</p>

  :comment_date: 2007-02-15 20:59:04 -05:00
  :comment_author: mboehm
- :comment_content: |
    <p>Hi, nice mini-app
    Do you have any idea how to switch back to the NDS main menu from an NDS app ?
    The (slot1) flash cart I use boots straight into its loader rather than allowing the option to go to the main NDS menu, and I'd like an app to load via the loader but make it return to the main NDS menu (with pictochat/download-play etc available).</p>

  :comment_date: 2007-02-21 15:35:34 -05:00
  :comment_author: Hiryu
- :comment_content: |
    <p>wangtang: If that was possible then there would be no market for pass-card devices (or the various new Slot1 carts). Any slot2 flash cart would be able to boot in GBA mode, switch to DS mode, and load NDS games from a Slot2 cart. It's something that Nintendo protected fairly well, and as far as I know noone has been able to work around it (except for by booting from Slot1 using either a passcard device or a slot1 card, or re-flashing their DS bios)</p>

  :comment_date: 2007-02-27 01:19:42 -05:00
  :comment_author: Hiryu
- :comment_content: |
    <p>could you some how have a border injecter so when we use your gba switch we can use a nice border instead of seeing the black space around the games?</p>

  :comment_date: 2007-04-03 03:44:38 -04:00
  :comment_author: Shadow
- :comment_content: |
    <p>This is great! I was looking for something like this. What release of DKA does this work on?</p>

  :comment_date: 2007-04-06 20:25:07 -04:00
  :comment_author: TeenDev
- :comment_content: "<p>[...] Here&#8217;s the newest build of GBAMP Multiboot . It adds the ability to boot the GBAMP in to GBA mode. The GBA booting code I was using was outdated and didn&#8217;t compile with my environment so you must use a 3rd party GBA booter such as HyperHacker&#8217;s or RyanFB&#8217;s\xC3\x82\xC2\xA0and rename it gbaboot.nds and put it at the root of your card. The program is pretty self explanitory when you load it up. [...]</p>\n"
  :comment_date: 2007-04-09 17:39:32 -04:00
  :comment_author: TeenDev &raquo; Blog Archive &raquo; GBAMP Multiboot Selector v1.2
- :comment_content: |
    <p>This is a very useful little program... thanks! I agree with Shadow, though... being able to use 'frames' for GBA mode would make this utility perfect!</p>

  :comment_date: 2007-04-10 22:24:12 -04:00
  :comment_author: Banjo
- :comment_content: |
    <p>Can anyone compile this in PALib? I'm using PALib for an app, and I would like to add a 'Boot GBA' option.</p>

  :comment_date: 2007-05-19 04:36:51 -04:00
  :comment_author: Spinal
- :comment_content: |
    <p>I've updated this code to work with the latest devkitARM &amp; libnds, get it here:</p>
    
    <p>ARM7
    http://paste.uni.cc/16216</p>
    
    <p>ARM9
    http://paste.uni.cc/16217</p>

  :comment_date: 2007-06-10 10:12:27 -04:00
  :comment_author: chuckstudios
- :comment_content: |
    <p>I'm betting I sound like a complete idiot when I say this but
    can you run GBA roms like this?</p>
    
    <p>(I have a slot-1 R4/M3 simply)</p>

  :comment_date: 2007-07-01 16:36:40 -04:00
  :comment_author: fuzoid
- :comment_content: |
    <p>Chuckstudios I can't compile that code with the lastest  Devkit.
    Can you give me an advice for it ? What is the template for this code ? My attempts always failed. Thanks</p>

  :comment_date: 2007-07-12 03:14:07 -04:00
  :comment_author: Dumb
- :comment_content: |
    <p>im having the same issue as Hiryu posted a few months back. ive seen other people with m3 perfects and their nds' load into the normal nds start screen but my passcard loads straight into m3. id really like to be able to start off with the option of choosing whether to load m3 or play with the settings, pictochat etc without having to eject the passcard every time. any suggestions?</p>

  :comment_date: 2007-09-19 10:04:13 -04:00
  :comment_author: kiyo
- :comment_content: |
    <p>Thank you for this great app!
    i have a problem with using this with my m3 real
    I put the downloaded nds file with the code in the root 
    when this code/nds file is launched it loads which ever gba rom was recently played / stored in the gba expansion ram and says "loading..." on the screen</p>

  :comment_date: 2008-02-02 10:38:33 -05:00
  :comment_author: Petervenkman
- :comment_content: |
    <p>fuzoid: i highly doubt that you would be able to use roms, but its possible</p>

  :comment_date: 2008-03-15 11:10:25 -04:00
  :comment_author: sWiTcHmE
title: Simple GBA Mode Switcher
excerpt: With Slot-1 DS flash carts, you sometimes want to boot a GBA cart in Slot-2. There's probably something already out there for this, but I couldn't find one so I made a small and simple [GBA mode switcher](http://www.cryptosystem.org/projects/nds/gbaswitch.nds). It uses the setting you've selected in your DS firmware to determine which screen to run on. This is probably the shortest DS code I'll ever write, so source is included in this post.
wordpress_url: http://www.cryptosystem.org/archives/2007/01/simple-gba-mode-switcher/
---
With Slot-1 DS flash carts, you sometimes want to boot a GBA cart in Slot-2. There's probably something already out there for this, but I couldn't find one so I made a small and simple [GBA mode switcher](http://www.cryptosystem.org/projects/nds/gbaswitch.nds). It uses the setting you've selected in your DS firmware to determine which screen to run on. This is probably the shortest DS code I'll ever write, so source is included in this post.

<!--more-->

ARM7:

    #include <nds.h>
    
    int main(void) {
        uint8 current, backlight;
        if(((PERSONAL_DATA *)0x023FFC80)->gbaScreen) {
                backlight = ~PM_BACKLIGHT_TOP;
        }
        else {
                backlight = ~PM_BACKLIGHT_BOTTOM;
        }
        // Reset the clock if needed
        rtcReset();
    
        //enable sound
        powerON(POWER_SOUND);
        SOUND_CR = SOUND_ENABLE | SOUND_VOL(0x7F);
    
        REG_SPICNT = SPI_ENABLE | SPI_DEVICE_POWER | SPI_BAUD_1MHz | SPI_CONTINUOUS;
        REG_SPIDATA = 0x80;
    
        SerialWaitBusy();
        REG_SPICNT = SPI_ENABLE | SPI_DEVICE_POWER | SPI_BAUD_1MHz ;
        REG_SPIDATA = 0;
    
        SerialWaitBusy();
        current = REG_SPIDATA & 0xff;
    
        current = current & backlight;
    
        SerialWaitBusy();
        REG_SPICNT = SPI_ENABLE | SPI_DEVICE_POWER | SPI_BAUD_1MHZ | SPI_CONTINUOUS;
        REG_SPIDATA = 0;
        SerialWaitBusy();
        REG_SPICNT = SPI_ENABLE | SPI_DEVICE_POWER | SPI_BAUD_1MHZ;
        REG_SPIDATA = current;
    
        SerialWaitBusy();
        swiSwitchToGBAMode();
    
        return 0;
    }

ARM9:

    #include <nds.h>
    
    int main(void) {
        if(((PERSONAL_DATA *)0x023FFC80)->gbaScreen) {
                POWER_CR &= ~POWER_SWAP_LCDS;
        }
        else {
                POWER_CR |= POWER_SWAP_LCDS;
        }
        return 0;
    }
