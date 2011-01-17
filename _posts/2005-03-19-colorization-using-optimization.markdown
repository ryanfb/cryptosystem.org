--- 
permalink: archives/2005/03/colorization-using-optimization
wordpress_id: 6
layout: post
title: Colorization Using Optimization
wordpress_url: http://www.cryptosystem.org/wordpress/?p=6
---
With [everyone](http://primates.ximian.com/~miguel/archive/2005/Mar-10.html) [talking](http://linuxart.com/log/archives/2005/03/09/scribbling-to-color/) about the [Colorization Using Optimization](http://www.cs.huji.ac.il/~yweiss/Colorization/) technology, I thought people without access to MATLAB might enjoy a usable program that employs it.

The MATLAB MCR (installs the shared libraries you need to run compiled MATLAB programs) for Windows is huge, so I made it into a torrent:

[Download torrent](http://cryptosystem.org/projects/colorize/MCRInstall.torrent) [83.26MB]<br />
[View torrent stats](href="http://alluvion.org/stats.php?info_hash=23379ea30b490f80904a0dfbadf7eba71108f4ae)<br />
![Torrent Statistics](http://alluvion.org/qstats.php/23379ea30b490f80904a0dfbadf7eba71108f4ae "Torrent Statistics")

Windows build:

Download the compiled build here: 
[colorize-win32.zip](http://cryptosystem.org/projects/colorize/colorize-win32.zip) [1.55MB]

Then:

1.  Download and run the MATLAB R7SP1 MCR Installer from the torrent.
2.  Open up a command window, navigate to where you've extracted the executable and
CTF file, and run "colorize.exe infile.bmp infile_marked.bmp outfile.bmp"
3.  Wait a while, because this build uses the "exact" solver, it's rather slow.

If Windows complains that CTF is not a registered file type and it can't find the proper program, you may need to reboot. You can use the example bitmaps from the source zip linked on the original website if you want to see what input should look like.

Linux build:

Download the compiled build here: [colorize-linux.tar.bz2](http://cryptosystem.org/projects/colorize/colorize-linux.tar.bz2) [3.6MB]

You don't need the MCR for this build, all the required libraries should be included.

1.  Put /path/to/colorize-linux/sharedobj on your LD\_LIBRARY\_PATH with export or setenv. (example:
`export LD_LIBRARY_PATH=
/home/blah/colorize-linux/sharedobj:$LD_LIBRARY_PATH)`
2.  Run "./colorize infile.bmp infile_marked.bmp outfile.bmp"
