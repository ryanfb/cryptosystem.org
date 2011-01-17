--- 
permalink: archives/2006/04/converting-netscape-cookies-files
wordpress_id: 21
layout: post
title: Converting Netscape Cookies Files
wordpress_url: http://www.cryptosystem.org/archives/2006/04/converting-netscape-cookies-files/
---
I've whipped up a short Perl script, available [here](http://cryptosystem.org/projects/ns2elcookies/ns2elcookies.pl), that converts a Netscape-style cookies file into the ELinks cookies format. This is useful for sites which have an image-based login captcha, so you can use Firefox to log in and then copy your cookies and have them in ELinks. Example usage:

    ./ns2elcookies.pl > ~/.elinks/cookies

By default, it does a find on ~/.mozilla/ for the first cookies.txt file it sees. You can also specify a cookies file as the first argument if that isn't what you want. It should be fairly easy to modify the script so that it instead outputs in another browser's cookie format, w3m for example.
