--- 
permalink: archives/2005/04/xml-rpc-blogging-plugin-for-tomboy
wordpress_id: 10
layout: post
title: XML-RPC Blogging Plugin for Tomboy
wordpress_url: http://www.cryptosystem.org/wordpress/?p=10
---
This plugin lets you post Tomboy notes to a weblog through the magic of XML-RPC. Attached is the [source](http://www.cryptosystem.org/projects/xmlrpc/Blog.cs) (goes in `tomboy-[ver]/Tomboy/Plugins/`) and a [diff/patch](http://www.cryptosystem.org/projects/xmlrpc/blog.diff) against the cvs `tomboy-[ver]/Tomboy/Plugins/Makefile.am`.

Notes:

-    needs [XmlRpcCS](http://xmlrpccs.sourceforge.net/). Mono 1.1.x users, check my [guide](http://www.cryptosystem.org/archives/2005/04/xmlrpccs_with_m.html) for installing it.
-    there's no pref's dialog, you need gnome-blog, it currently reads your gnome-blog settings from GConf
-    currently only supports the MetaWeblog API (MovableType, etc.)
-    does not support post editing
-    currently just uploads whatever the text value of the note is. If your blog supports setting a default formatting style (like Markdown), just use that in your note and it should show up properly.

Some ideas for enhancement:

-    keep track of postID's in an extra XML field (like width and height are now). This would allow you to upload a post, then edit/update it within Tomboy.
-    move pref's to Tomboy's preferences dialog and GConf settings?
-    let you sync your notes with your weblog. This would update your blog with local Tomboy changes, as well as pull down other posts not made from Tomboy into Tomboy.
-    maybe a different icon?

Enjoy, feel free to enhance/update/improve/etc.

And yes, this post was made with it. ;)
