--- 
permalink: archives/2005/02/monodevelop-on-debian
wordpress_id: 4
layout: default
comments: []

title: MonoDevelop on Debian
wordpress_url: http://www.cryptosystem.org/wordpress/?p=4
---
I upgraded mono to the latest Debian package (1.0.5-2), and it went and broke MonoDevelop.

    $ /usr/bin/cli --debug /usr/share/dotnet/monodevelop/bin/MonoDevelop.exe
    Creating DefaultWorkbench
    
    (MonoDevelop:9543): Gtk-WARNING **: Error loading icon: Failed to open file 
    '/home/data/resources/icons/Icons.SharpDevelopIcon': No such file or 
    directory

I tried using the Ubuntu package (monodevelop\_0.5.1-3\_i386, one revision higher than the monodevelop\_0.5.1-2\_i386 provided by Debian), but it does the exact same thing (except the executable is placed in a different structure under `/usr/lib/monodevelop`, and the `/usr/bin/monodevelop` script uses `mono` instead of `cli`). Doing something silly like copying the `/usr/share/dotnet/monodevelop/data` directory to `/home` makes the icon error go away, but MonoDevelop still does not start. I even tried rebuilding the monodevelop package with the new mono install, but it does the same thing. I suspect it's related to [this bug](http://bugzilla.ximian.com/show_bug.cgi?id=67910).

*Update*: It has randomly decided to start working again.
