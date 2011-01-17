--- 
permalink: archives/2005/07/not-this-again
wordpress_id: 18
layout: post
title: Not This Again
wordpress_url: http://www.cryptosystem.org/archives/2005/07/not-this-again/
---
Well, I got an [80GB PQI mPack P800](http://www.pqi.com.tw/product2.asp?oid=8&CATE1=8&PROID=1) a few days ago after a bit of searching. The [iAudio X5-series](http://www.cowonamerica.com/products/iaudio/x5/) devices were at the top of the list for quite a while, as I rip most of my albums to FLAC and it's one of about four players that supports it. The video support appeared kind of tacked-on (low-resolution low-fps only), however, and since I would be spending the money anyway it was a feature I was looking for. The [i-Station series](http://www.digital-cube.co.kr/) portables got some consideration, but there are basically no US distributors. I looked over Archos's offerings, but none seemed to play video files over 700x480 or so. The mPack's availability from NewEgg, broad format support, and large drive space won me over in the end.

Sadly though, the device is far from perfect. The interface is pretty clumsy, and if you want to use the device in USB mass storage mode only without their Windows-only transfer utility, you lose the music database functionality and quite a few other things. If you have a directory structure like:

	Funk/
	 Funk.mp3
	Funk Rock/
	 Funk Rock.mp3
	-Funk- Rock/
	 -Funk- Rock.mp3
 
Then play Funk.mp3, it will just play it over and over instead of moving on to Funk Rock.

Worst of all, they're blatantly violating the GPL (the firmware uses a modified Linux kernel, the main application embeds code from the GNU fileutils, and the firmware also uses dosfstools). I've requested the source from them, but I'm not too optimistic based on [my experience in the past](http://testing.lkml.org/slashdot.php?mid=331690) with these sorts of things (I'm the OP in the avsforum thread, and the Duke website which is no longer there was mine). Hilariously enough, the mPack apparently uses a Sigma Designs EM85XX.PVP chipset. Does Sigma distribute these things with a mandate that the manufacturers ignore and violate the GPL as much as possible?
