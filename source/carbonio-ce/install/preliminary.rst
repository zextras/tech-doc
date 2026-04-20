
.. _preliminary:

===============
 Preliminaries
===============

In this section, we present some tasks you need to carry out before
starting with the actual installation.

.. hint:: We invite you to subscribe to our newsletter to gain early
   access to dedicated content for Carbonio CE admins, including:

   - Release notes and upcoming updates

   - The latest news and announcements

   - Expert technical guides for |product|

   Please fill in the form at
   https://zextras.com/carbonio-community-edition#discoverproduct


.. _repo-conf:

Configure repositories
======================

.. include:: /_includes/_installation/step-repo-conf.rst
.. include:: /_includes/_installation/repo-info.rst

.. _set-hostname:

Setting Hostname
================

.. include:: /_includes/_installation/steps-hostname.rst

DNS Settings
============

.. include:: /_includes/_installation/dns.rst

.. _dns-dkim:

DKIM
====

The **D**\omain **K**\eys **I**\dentified **M**\ail (**DKIM**)
is a method to verify that an e-mail was sent from a legitimate mail
server. Each e-mail is marked with a digital signature that can be
verified by the receiver.

Technically, a **TXT record** that identifies the SMTP server must
be added to the domain's DNS configuration.

.. seealso:: DKIM is an Internet Standard first defined in
   :rfc:`6376`, later updated in :rfc:`8301` and :rfc:`8463`.

.. _dkim-record:

Create a DKIM Record
--------------------

The utility ``/opt/zextras/libexec/zmdkimkeyutil`` is used to generate a **DKIM key pair** for a domain.
The private key is stored in **LDAP**, while the public key must be published in public **DNS** as a ``TXT`` record.

Once a **DKIM** key is generated, the **MTA** starts using it immediately.
If the corresponding DNS record is not yet available (or not fully propagated), outgoing emails may receive a poor **DKIM score**.
To avoid this, you can temporarily disable **DKIM** signing by clearing the relevant **LDAP** attribute until **DNS** configuration is complete.

This document explains how to generate a **DKIM key**, verify **LDAP attributes**, temporarily disable **DKIM signing**, and finally activate it once **DNS** is ready.

.. include:: /_includes/_installation/dkim.rst
