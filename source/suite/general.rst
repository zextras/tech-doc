.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

=============
 Introduction
=============

Zextras Suite is an all-in-one solution that seamlessly integrate with
Zimbra Open Source Edition, avoiding issues like conflicts with
Zimbra.

Some strong points of Zextras Suite are: security (including encrypted
communication channels, 2FA and SAML authentication), data protection
and data ownership (you control your data: choose where to store data
and backups, what to delete, and so on), full GDPR compliance.

Zextras Suite is organised in modules, that can be purchased in
different bundles, according to the available licenses. information on
`Zextras Store <https://store.zextras.com>`_.

- :doc:`auth` is the authentication layer that takes care of the login
  modalities and access to mailbox and other modules

- :doc:`backup` concerns primarily methods to save your mail,
  documents, and data. The module also encompasses Restore Strategies
  to recover deleted items or accounts, and Advanced Backup
  Techniques, which include Disaster Recovery.

- :doc:`mobile` allows to manage mobile devices and their access to
  address book, shared resources, and to the Zextras modules

- :doc:`powerstore` contains advanced concepts and techniques for
  storage management on Zextras

- :doc:`admin` describes advanced management task for administrators

- :doc:`drive` is used to share drafts, full documents, videos, and
  every kind of files, with all your colleagues

- :doc:`docs` provides a collaborative editing environment for
  documents, spreadsheets, presentations, and more

- :doc:`team` a fully-fledged communication system for chat,
  videoconferencing and remote presentations

Modules can be individually enabled or disabled by an
administrator. Instructions for this are provided within each module’s
documentation.

.. _additional-resources:

Additional resources
====================

Besides the individual modules, the Zextras ecosystem encompasses a
`customer support portal <https://support.zextras.com/hc/en-us>`_, and
two additional portals: *this technical documentation*, and the
`Community <https://community.zextras.com/>`_.

On the customer support portal, dedicated to *licenced users*--i.e.,
existing customers and people who have started a trial--one can open a
ticket in case of problems with Zextras Suite or to report a
bug. Non-licenced users can find help in the official forum (see the
section :ref:`zextras-community` below for more information).

The two *technical* and *community* documentation are more broadly
described in the upcoming section.


Documentation Types and Users
-----------------------------

This documentation (*docs* for short), hosted on docs.zextras.com, is
composed by several parts and is complemented by the online `Community
<https://community.zextras.com/>`_ Documentation for Zextras
Suite. While they are accessible by everyone, they have different
intended audiences. The typical users of Zextras Suite belongs to
either of these categories: *Regular Users* or *Administrators*.

Docs.zextras.com
----------------

This documentation describes the Web GUI and the functionalities
provided by Zextras Suite in a concise way; it shows how to enable and
configure the modules, and how to carry out common administrative
tasks.

Docs is suited mostly for administrators, and contains the following
parts:

* :ref:`compatibility-list` of Zextras Suite with Zimbra versions
* :ref:`install-guide`, including requirements and configuration tips
* A dedicated guide for every module
* Quick and Full command reference. At the end of each module, a list
  of all CLI commands that can be used to manage the module is
  provided. Each command is linked to its full reference, which
  includes all the available options and command examples. The quick
  and full CLI references are also provided in a dedicated
  :doc:`CLI section <cli>`
* :ref:`Changelogs <changelogs>` are available for all versions since
  **3.0.0**


.. _zextras-community:

Community
---------

The community consists of several parts; its strong point is a large
collection of articles, complemented by the `official discussion forum
<https://community.zextras.com/forum/>`_, the place where the
community members interact, search for useful resources, provide own
feedback, share their experiences, or comment articles. Moreover, the
forum can be used by non-licensed users to ask for help and support.

The content of this site is tailored for Regular Users, who can find
guidelines, howtos, and more generic articles about the
functionalities. Moreover, also Administrators can find useful
resources about Zextras and its ecosystem.

More in detail, the article are divided into two main categories:

* The `blog <https://community.zextras.com/blog/>`_, which consists of
  release notes, news, and more
* The `Tech area <https://community.zextras.com/tech-area/>`_,
  containing articles focusing on the Zextras Suite and Linux. This
  section is further divided into three parts:

  * `Zimbra OSE
    <https://community.zextras.com/tech-area/zimbra-open-source/>`_,
    whose articles help in installing, configuring, and managing
    Zimbra OSE 

  * `Zextras Suite
    <https://community.zextras.com/tech-area/zextras-suite/>`_
    containing guides to configure and use the modules of Zextras
    Suite and deepen the knowledge of its components. this part is the
    reference for Regular Users.

  * `Linux World
    <https://community.zextras.com/tech-area/linux-world/>`_ presents
    articles about services configuration and virtualisation systems
    under Linux systems; it is dedicated to all readers who also act
    as DevOps or Sysadmins

Regular User
------------

.. figure:: /img/zxmail.png
   :scale: 50%

   A sample Zextras Suite GUI

We define a *Regular User* as everyone who uses Zextras Suite and its
functionalities. A Regular User will find a lot of configuration
guidelines and articles about and around Zextras on the Community
Documentation

More in details, a Regular user will find useful articles in either
the `Tech area <https://community.zextras.com/tech-area/>`_, the `blog
<https://community.zextras.com/blog/>`_, and the forum.

Administrator
-------------

Besides using Zextras Suite, an *Administrator* also manages its
installation, access policies, configuration and so on. Administrators
can find resources on both this documentation and Community. In
particular, the following is a list of some of relevant resources:

On Docs:

* Zextras Suite :ref:`install-guide`
* Architecture of :doc:`backup` including the supported backup
  alternatives, :doc:`restorestrategies`, and :doc:`advancedbackup`
* Corporate chat and video calls using :doc:`team`
* Authentication and login with :doc:`auth`
* :doc:`CLI Command reference <cli>`

On Community:

* installation and management of
  `Zimbra
  OSE <https://community.zextras.com/tech-area/zimbra-open-source/>`_
* Additional `Linux resources
  <https://community.zextras.com/tech-area/linux-world/>`_

Try and Install Zextras
=======================


In order to try out Zextras, you can `download a free trial
<https://www.zextras.com/download/>`_ of the latest available version
of Zextras suite. After filling in a form, you will be sent a link to
download an image, that you can install as a virtual machine or on a
physical server by following the :ref:`install-guide`, which provides
requirements, important information, and the actual installation
guide.


.. _compatibility-list:

Compatibility list
==================

.. include:: /00-includes/compatibility.rst

.. _zextras-internationalization:

Internationalization
====================

.. include:: /00-includes/i18n.rst

.. _zextras-theme:

Zextras Theme for the Zimbra Webclient
======================================

.. include:: /00-includes/theme.rst

.. _zextras-services:

Services and Service management
===============================

.. include:: /00-includes/services.rst

.. _zextras-report-issue:

How to report an issue
======================

.. include:: /00-includes/report-issue.rst
