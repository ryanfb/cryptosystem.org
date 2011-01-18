--- 
permalink: archives/2005/03/colorization-using-optimization
wordpress_id: 6
layout: post
comments: 
- :comment_content: |-
    Now that I have some more bandwidth/storage and the torrent is long dead, here's a link to the R7SP1 Windows MCR: http://cryptosystem.org/projects/colorize/MCRInstaller.exe
    
    As for animated GIF's, I'm not sure. I haven't looked at the code in almost a year, but it's quite possible that despite the paper talking about tracking regions across image sequences, that the Matlab code only handles bitmaps. You could try breaking up the GIF's into bitmaps with something like ImageMagick and seeing how that goes.
  :comment_date: 2006-03-16 21:52:24 -05:00
  :comment_author: ryanfb
- :comment_content: The torrent is down at the moment, I found another MCR but it was for 7.2, returns an error. Looks like I need 7.1, can you reseed the torrent. Or give a link to the file?
  :comment_date: 2006-01-17 08:38:45 -05:00
  :comment_author: Michael
- :comment_content: |
    Hi! I've managed to make the method work for bmp files. When I tried with gif (animated) files I've got an error response
    
    Error in ==&gt; C:\matlabR12\work\getColorExact.m
    On line 3  ==&gt; n=size(ntscIm,1); m=size(ntscIm,2);
    
    ??? Error using ==&gt; rgb2ntsc
    RGBMAP must have 3 columns.
    
    Error in ==&gt; C:\matlabR12\work\colorize.m
    On line 16  ==&gt; sgI=rgb2ntsc(gI);
    
    
    I don't know what I'm doing wrong.
    
    

  :comment_date: 2006-03-04 07:48:04 -05:00
  :comment_author: Alex
- :comment_content: |
    <p>Hi -</p>
    
    <p>I've been trying unsuccessfully for years to run this thing in MATLAB, and using your downloads, I've finally gotten it to work.  Thank you!</p>
    
    <p>Now... how do I process a folder full of sequential images?  I can get it to process one set at a time (A.bmp, Bmarked.bmp Zoutput.bmp) but I have no idea how to make it work on a few hundred sequential images.</p>

  :comment_date: 2009-06-28 16:11:21 -04:00
  :comment_author: Robot C
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
