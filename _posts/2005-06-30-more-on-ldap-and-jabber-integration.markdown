--- 
wordpress_id: 17
layout: post
title: More on LDAP and Jabber Integration
wordpress_url: http://www.cryptosystem.org/archives/2005/06/more-on-ldap-and-jabber-integration/
---
I have updated and modified [Nikita Smirnov's jabberd2 LDAP rosters/vCards patch](http://mail.jabber.org/pipermail/jabberd/2004-March/001389.html) for my own use, and thought some other people might be interested in it as well. This patch only includes the sm rosters and vCards modifications, and not the c2s ldapfull authentication method. It has been updated to patch cleanly with jabberd2-2.0s3. I have modified the roster publication for people using normal LDAP authentication, so the "@servername" text is appended automatically to the supplied LDAP uid before storing it in the roster (so you don't have to maintain seperate uid's and jid's). I have also modified the sm.xml.dist.in example to be a little more clear. If you use a Debian-style distribution, you should be able to "apt-get source jabberd2", put this in debian/patches, and run "debian/rules binary" to get a modified package.

![Screenshot of Gossip on a server with LDAP rosters and vCards](/images/jabber-ldapScreenshot.png)

All of this information is now being pulled from our LDAP server, which is pretty snazzy. You can get the patch [here](/projects/jabber-ldap/02_ldaproster.diff). So now, I have LDAP working for:

*  user logins to Linux
* Samba PDC functionality (shares the same home directory etc. as their Linux account)
* company-wide addressbook (works in mail clients, as well as the copier/scanner machines)
*  logins to intranet web apps (including the very cool [Trac](http://www.edgewall.com/trac/))
*  Jabber authentication, rosters, and vCards
*  postfix and Courier IMAP for mail handling
*  pureftpd authentication

All in all, kind of a hassle to get going, but definitely worth it. There should be a free Linux distro that assumes you want to do this kind of stuff by default. Novell OES may come close, but it's non-free in both the monetary sense and in that it relies on the closed-source eDirectory.
