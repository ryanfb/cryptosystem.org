--- 
permalink: archives/2005/04/xmlrpccs-with-mono-11x
wordpress_id: 9
layout: post
comments: []

title: XmlRpcCS with Mono >1.1.x
wordpress_url: http://www.cryptosystem.org/wordpress/?p=9
---
I was trying to work on some [XML-RPC](http://www.xmlrpc.com/) craziness under [Mono](http://www.mono-project.com/), and came across [XmlRpcCS](http://xmlrpccs.sourceforge.net/) and a nice [tutorial](http://www.linuxjournal.com/article/7430). Problem is, since I'm running Mono 1.1.4, I could reference the built XmlRpcCS.dll assembly at compile-time with no problems, but the resulting program would die with:

    WARNING **: Could not find assembly XmlRpcCS, references from
      ~/source/monoblog/monoblog.exe (assemblyref_index=3)

This is because with Mono 1.1.x, it seems you must register *signed* assemblies with gacutil. In order to do this with XmlRpcCS, you need to do the following:

1. Download the XmlRpcCS source file and unzip it.
2. `cd` to the `XmlRpcCS` directory and run "`sn -k XmlRpcCS.snk`" to generate your keyfile.
3. Edit the `makefile` and change the `CSFLAGS` line to "`CSFLAGS=-define:__MONO__ -delaysign-`"
4. Edit `src/nwc/xmlrpc/AssemblyInfo.cs` and add the following lines:

    `[assembly: AssemblyDelaySign(false)]`

    `[assembly: AssemblyKeyFile("XmlRpcCS.snk")]`

5. Run `make`
6. Run "`sudo gacutil -i XmlRpcCS.dll -package XmlRpcCS`"

Now when you need to compile against XmlRpcCS, just add "`-r /usr/lib/mono/XmlRpcCS/XmlRpcCS.dll`", and it should work fine.
