.. _ap-global:

========
 Global
========

.. _global-settings:

Settings
========

The settings in this page allow to configure both system
notifications and domain disclaimers.

.. card:: System Notifications

   To configure notifications, provide the e-mail address that appears
   as the sender of the system notifications, which must be unique,
   and the recipients that will receive them.

.. card:: Domain Disclaimer

   The first options is to activate the domain disclaimer as a
   mandatory option for all domains configured. By default, the
   disclaimer, whose text can be configured in Section
   :menuselection:`Domains --> Details --> Disclaimer` (see
   :ref:`ap-disclaimer`), is added at the end of each incoming and
   outgoing message (i.e., messages with a recipient external to the
   domain), unless the second option, *Only allow outbound
   disclaimers*, is enabled: in that case, the disclaimer is added
   only to outgoing messages

   .. seealso:: Domain disclaimer can be managed from the CLI as well,
      please refer to Section :ref:`disclaimer-cli`.

Once you change any of the options, restart amavis as the ``zextras``
user on every Node featuring the :ref:`MTA role <role-mta-install>`

.. code:: console

   zextras$ zmamavisdctl restart && zmconfigdctl restart

.. _global-delegate:

Global Delegates
================

This page is an excerpts of the :ref:`Accounts <ap-accounts>`
(:menuselection:`Admin Panel --> Domains --> Manage --> Accounts`)
table, showing all the Global Delegates.

.. _global-domains:

Domains
=======

This table lists all the domains configured on |product|. Check section
:ref:`ap-domain-new` to add a new domain.

.. index:: quarantine

.. _global-quarantine:

Quarantine
==========

In this page appears the configuration of the special *quarantine*
e-mail account, which holds all the messages either marked as Spam or
containing viruses. The available setting is the duration of the
retention time, i.e., how long these messages are kept before being
deleted forever. The account, including all the e-mail messages it
contains, can be deleted and recreated by clicking the
:bdg-danger-line:`DELETE AND RE-CREATE` button. At the bottom of the
page the list of quarantined messages is shown. Being a system
account, to view the messages you can go to :menuselection:`Admin
Panel --> Domains --> Manage --> Accounts`, click the quarantine
account, then the :bdg-primary-line:`VIEW MAIL` button to see the
quarantined e-mails.
