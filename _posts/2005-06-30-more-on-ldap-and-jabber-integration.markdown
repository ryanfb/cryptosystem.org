--- 
permalink: archives/2005/06/more-on-ldap-and-jabber-integration
wordpress_id: 17
layout: default
comments: 
- :comment_content: |
    Hello,
    
    On searching a lot I came across your patch and it is exactly what the company I work for as a syadmin needs. I have managed to apply your patch and get the authentication working with active directory. But inspite of trying several configs I couldnt get the vcard and roster to work through  AD.
    
    Could you please give me some directions on how to configure so that it retrives vcard information and roster from active directory.
    
    Any help would be appreciated. Otherwise even if you could point me to the person whom I should be asking this would be good enough.
    
    Let me know and I shall furnish you whatever information required.
    
    And thanks for sharing this excellent piece of work!!
    
    -Deepak
    

  :comment_date: 2006-04-08 07:37:03 -04:00
  :comment_author: Deepak Bhat
- :comment_content: |-
    For vcard support, in your sm.xml make sure <code>&lt;driver type='vcard'&gt;ldapvcard&lt;/driver&gt;</code> is uncommented and the only driver for the vcard type. For roster support, make sure <code>&lt;driver type='published-roster'&gt;ldapvcard&lt;/driver&gt;</code> is the same way. You will then need to setup the ldapvcard driver section with the settings for your specific LDAP configuration - see the comments in the patched sm.xml.dist.in file. If you have not extended your directory schema and just want all users of of a specific basedn to show up, you should remove the publishedattr element. Make sure the roster-publish module is in your user-load chain. Make sure you have an uncommented publish element (and probably an empty fix-subscriptions element under it) in your user template element.
    
    For debugging, enable verbose logging on your LDAP server and watch the logs as you perform the actions you're inspecting on the Jabber server. Often seeing what the actual queries against the directory are will give you a much better idea of what's going on or why something is not working as expected.
  :comment_date: 2006-04-11 22:54:34 -04:00
  :comment_author: ryanfb
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
