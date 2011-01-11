--- 
wordpress_id: 14
layout: post
title: Setting Up Jabberd2 for LDAP Authentication
wordpress_url: http://www.cryptosystem.org/archives/2005/05/setting-up-jabberd2-for-ldap-authentication/
---
At work, my main focus for the present time is getting our massive LTSP/LDAP/HTTP/DHCP/ACRONYM Linux server up and going in to production. I thought it would be a good idea to set up a message server for employees to use for quick office communication, and Jabber seemed the obvious choice. There were a few little hitches getting it integrated with LDAP, so in case anyone else comes across this problem, here's a small guide to the changes that need to be made to the jabberd2 conf files:

**c2s.xml**:

*   Disable user registration.
*   Change `<host>` in the LDAP section to the appropriate host.
*   Hopefully you have your server resolving to a domain name, even if it's an internal one such as "companyserver" (if you don't, you should set it up now. You wouldn't want to have your users showing up as `username@192.168.100.1` or something). In the `<local>` section, set up a new realm such as `<id realm='company'>companyserver</id>`.
*   Now that you've set up a new realm, you need to add an LDAP basedn for searching in that realm. In the LDAP section, add `<basedn realm='company'>ou=people,dc=company,dc=com</basedn>`, adjusting for your specific directory layout.
*   There seem to still be some issues with LDAPv3 in the version of jabberd2 (2.0s3) that's currently in my distro. Setting jabberd2 to use LDAPv3, slapd refuses the connection with "requested protocol version not allowed". I had to leave v3 commented out and alter my slapd.conf to allow v2 connections.
*   Change the backend module in the authreg section to "ldap".

**sm.xml**:

*   Turn on user auto-create by uncommenting it.
*   Change the sm id to the realm you set up earlier. In the example's case, this would be `<id>companyserver</id>`.

Now you should be able to restart jabberd2 and have users login as username@companyserver, authenticated against your LDAP directory.</local></host>

If only I'd had this book beforehand:

<p align="center"><a href="http://www.cryptosystem.org/images/tjabber3vq.jpg"><img src="http://www.cryptosystem.org/images/tjabber3vqt.jpg" alt="Mr. T Pities the Fool Who Doesn't Use Jabber" /></a></p>
