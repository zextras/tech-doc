.. _ap-global:

========
 Global
========

.. _global-settings:

Settings
========

.. include:: /_includes/_adminpanel/_domains/globalsettings-ce.rst

.. index:: Chats; user search by GUI

.. _wsc-user-search:

.. card:: User search

   The switch labelled **Allow searching users' information in all
   domains**, when active, allows any user to search for other users
   in all other domains configured on the |product| infrastructure.

   For example: user John with e-mail address *john@example.com* will
   be able to find user Jane *jane@acme.example* (which is on a
   different domain) only if this switch is *active*, otherwise Jane
   will not show up in the results.

   .. rubric:: Limitations

   This option is available to **Global Administrators** only and
   currently for searches within the |wsc| module.

.. _admins:

Administrators
==============

This page is an excerpts of the :ref:`Accounts <ap-accounts>`
(:menuselection:`Admin Panel --> Domains --> Manage --> Accounts`)
table, showing all the Administrators.

.. _global-domains:

Domains
=======

This table lists all the domains configured on |product|. A click on
any domain opens the *General settings* (:menuselection:`Domains -->
Details --> General Settings`) of that domain. Check section
:ref:`ap-domain-new` to add a new domain.

.. index:: quarantine

.. _global-quarantine:

Quarantine
==========

.. include:: /_includes/_adminpanel/_domains/quarantine.rst
