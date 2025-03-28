.. _ap-global:

========
 Global
========

.. _global-settings:

Settings
========

.. include:: /_includes/_adminpanel/_domains/globalsettings.rst

.. _global-admins:

Administrators
==============

This page is an excerpts of the :ref:`Accounts <ap-accounts>`
(:menuselection:`Admin Panel --> Domains --> Manage --> Accounts`)
table, showing all the Global Delegates.

.. _global-wl:

|wl| Settings
===================

Global settings concern the appearance of |product| and allow to
customise various option that will influence how the |product| web
interface appears to the web clients.

.. note:: These setting are applied to all the domains configured; if
   you want to customise the appearance of a single domain, please
   change the settings under :menuselection:`Domains --> Details -->
   White-label Settings`.

The description of the available options can be found in the
:ref:`dedicated section <wl>`.

.. _global-domains:

Domains
=======

This table lists all the domains configured on |product|. A click on
any domain opens the *General settings* (:menuselection:`Domains -->
Details --> General Settings`) of that domain. Check section
:ref:`ap-domain-new` to add a new domain.

.. index:: Authentication by GUI; 2FA (global)

.. index:: 2FA Authentication; by GUI (global)

.. _global-2fa:

2-Factor-Autenthication
=======================

In this page it is possible to configure 2FA globally (i.e., for all
domains configured) for the various services offered by |product|. To
modify settings for a single domain, refer to :ref:`domain-2fa`.

.. note:: The global values configured are inherited by all domains,
   but they can be overridden by domain-specific settings.

.. include:: /_includes/_adminpanel/2fa.rst

.. index:: quarantine

.. _global-quarantine:

Quarantine
==========

.. include:: /_includes/_adminpanel/_domains/quarantine.rst

.. _global-as:

ActiveSync
==========

.. include:: /_includes/_adminpanel/_domains/activesync.rst
