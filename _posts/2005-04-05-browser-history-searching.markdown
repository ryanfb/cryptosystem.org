--- 
wordpress_id: 7
layout: post
title: Browser History Searching
wordpress_url: http://www.cryptosystem.org/wordpress/?p=7
---
[Britt](http://life.lukewarmtapioca.com/) ran into me today while I was hacking around on a toy program of mine. Basically, I'd gotten fed up with having 5000 Firefox tabs open at once, with no proper way to search through my history or bookmarks, so I decided there needed to be a better way. I started playing with Gecko# and got a bit caught up in getting something half-usable out. Since the last thing the world needs is *another* web browser, I'll probably just polish it off some more and put up the source to help out (or possibly confuse!) anyone else who wants to do some Gecko# hacking beyond [a 5 minute browser](http://mysterion.org/~danw/blog/2005/03/stetic). I did finally discover the old Mac app I was doubtlessly inspired by, [TrailBlazer](http://www.acm.uiuc.edu/macwarriors/projects/trailblazer/).

Anyway, onto the main reason for abandoning it, my conversation with Britt made me realize that even beyond the silliness of trying to create another browser, I was also reinventing the wheel in numerous other ways. It would probably be much easier to hack the functionality I'm looking for onto [Beagle](http://www.gnome.org/projects/beagle/). Guess I'll need to set up an inotify-enabled kernel. 

Speaking of which, I need to do quite a bit of kernel hacking in less than a month anyway, with 3-4 large kernel modification projects ahead of me. Thankfully, due to my inability to read a syllabus, I finished all my projects for another course two weeks ahead of time, so I won't have that looming over my head.
