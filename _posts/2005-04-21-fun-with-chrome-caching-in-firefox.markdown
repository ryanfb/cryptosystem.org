--- 
permalink: archives/2005/04/fun-with-chrome-caching-in-firefox
wordpress_id: 11
layout: default
comments: []

title: Fun with chrome caching in Firefox
wordpress_url: http://www.cryptosystem.org/wordpress/?p=11
---
After struggling with [this lovely error](http://cryptosystem.org/projects/wereboy/xulerror.png) ("XML Parsing Error: not well-formed" while pointing to a nonexistant location in my code) for a while hacking around on [Wereboy](http://cryptosystem.org/projects/wereboy/), I became a little frustrated. So I created a clean profile and added the extension, where it worked fine. Turns out that profiledir/XUL.mfasl will apparently keep around uninstalled plugin chrome then later confuse itself, resulting in this sort of breakage. You have to delete/move it then relaunch Firefox to force a rebuild.
