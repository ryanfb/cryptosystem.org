--- 
permalink: archives/2005/04/ubuntu-tastic
wordpress_id: 8
layout: post
comments: []

title: Ubuntu-tastic
wordpress_url: http://www.cryptosystem.org/wordpress/?p=8
---
After having read somewhere that installing gnome-volume-manager on Debian was all kinds of cool, I gave it a shot. Somehow, it wound up breaking udev so it no longer saw my DVD/CD-RW drive, which is pretty much the opposite of the intended effect. This probably has something to do with the fact that I'd been kludging this Debian install along for quite a while, from all sorts of fun migrating between 2.4.x and 2.6.x, to random USB hackery, to writing my own scripts to start up wireless properly, and so on. Deciding I'd hit the breaking point, I went ahead and installed Ubuntu Hoary. So far, it's very nice. I had the foresight to put /home on a seperate partition back when I installed Debian, so everything I'd personalized for my login pretty much still works properly. I've already got [Beagle](http://beaglewiki.org/index.php/UbuntuInstall) and [Tomboy](http://www.beatniksoftware.com/tomboy/) (complete with C# DBus bindings out of the box) working, with no real hassle at all.

Update: Switched back to Beagle 0.0.8 so it would work with inotify, and it's working much better now. And with the Firefox plugin provided by the Beagle project, it looks like it pretty much already does what I was looking for. Also got other things like mplayer, acroread 7, etc. up and running. Also got suspend/resume working again, however, my consoles are still messed up after running video-post. Suspend-to-disk appears to lock up completely as well.
