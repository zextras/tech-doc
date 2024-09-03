.. _mig-zx-ldap:

================================================================
 From Generic E-mail Systems Based on Compatible AD or OpenLDAP
================================================================

This procedure is quite similar to :ref:`migration-other`. The only
difference is that Step 1 in Phase 1 is carried out with the help of
**Accounts Auto provisioning**. All the other phases and steps are
carried out manually.

Since this is quite a long procedure, please read carefully the
reminder of this section before attempting the migration, to
understand which data, files and their format are needed.

Requirements and Limitations
============================

On the **Destination**, before starting the migration, the following
conditions must be satisfied:

* The domains that must be migrated must already exist and configured
  with Auto provisioning (see Phase 1 below for details)
* The **Default CoS** must be configured with suitable values, as all
  imported users will inherit it

Additionally, the CSV and ICS files needed for the manual import must
have a precise format: they will be then processed using the scripts
that we provide to import Calendars and Contacts in the
**Destination**. Make sure that the format of the files reflect the
examples, to prevent any possible error while processing the files.

Phase 1, Provisioning
=====================

Step 1-1, Domains and Accounts
------------------------------

This step is automatically carried out by means of :ref:`Auto
provisioning <ad-auto>`: please refer to that section to set it up,
then skip to :ref:`Phase 2 <mig-other-2>`.

.. note:: The linked Auto provisioning article describes the use of AD
   for provisioning, but also any generic LDAP is supported: The procedure is
   analogous to the AD, with appropriate changes to the search
   filters, bind domains, and the port.

Step 1-2, Distribution Lists
----------------------------

.. include:: /_includes/_migration/dl.rst

Phase 2, Data
=============

This Phase is divided into three steps, which require an external tool
to migrate all e-mails and exported files for Calendars and Contacts.

Step 2-1, Emails
----------------

.. include:: /_includes/_migration/imapsync.rst

Step 2-2, Calendars
-------------------

.. include:: /_includes/_migration/calendars.rst

Step 2-3, Contacts
------------------

.. include:: /_includes/_migration/contacts.rst

Phase 3, Shares
===============

Shares migration is not supported when the **Source** is no
Zextras-compatible platform.

Phase 4, Files
==============

Migration of |file| items is not supported when the **Source** is no
Zextras-compatible platform.
