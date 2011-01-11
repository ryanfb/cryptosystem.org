--- 
wordpress_id: 32
layout: post
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
