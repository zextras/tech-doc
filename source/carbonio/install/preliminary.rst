.. _preliminary:

===============
 Preliminaries
===============

.. contents::
   :local:
   :depth: 2

In this section, we list some naming conventions we use in the
documentation and present some tasks you need to carry out on **each
of the Nodes** before starting with the actual installation.


.. _naming-conv:

Naming conventions
==================

.. include:: /_includes/_installation/naming.rst

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


.. include:: /_includes/_installation/dkim.rst
