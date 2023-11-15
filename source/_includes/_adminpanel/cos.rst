.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

A |cos| determines which items can be accessed by a web client and
how, setting default for a number of options. A users that belongs to
that COS may later change some of these options from the
:ref:`settings-comp` page on the web client.

To create a COS, click the :bdg-primary-line:`CREATE NEW COS` button
and enter a name. You can then configure all the options from the
left-hand side menu.

.. _cos_info:

General Information
-------------------

This section present some (unchangeable) information about the chosen
COS: name, ID, and creation date together with some calculated value:
which accounts and domains use the COS. These values are expanded
below, with the complete list of handled accounts and domains.

.. _cos-features:

Features
--------

*Features* are settings that allow or forbid the user to access the
most used components of |product|, both via browser and :ref:`mobile
apps <mobile_apps>`. The Administrator can prevent users to even
access the `Settings` module, meaning that the user can not customise
anything in the web mail's :ref:`settings-comp`. This proves useful in
some scenarios: for example, an organisation wants that all the
communication of its employees has the same branding (including also Out Of
Office replies, the visible name of the sender, and other); another
needs that the e-mails be encrypted and does not want users to send
plain-text e-mails, and so on.

.. hint:: Some of them can be enabled or disabled via CLI: please
   refer to section :ref:`cli-features` for more information.


.. _cos-prefs:

Preferences
-----------

*Preferences* consist of generic options for the various components
(Mails, Calendar, Contacts).

The first is the default language to be used by the members of the
COS, which includes also the locale. The remaining options concern

* the default appearance of |product| in web clients: for example, if
  e-mails are displayed as conversations, or the calendar shows a
  month or a work week

* the default values or behaviour of the features: for example whether
  new e-mail contacts are added automatically to Contacts or how
  often to check for new e-mails

* which features are available to the user: for example, whether the
  user is allowed to forward e-mails or create a filter to forward
  specific e-mails

* The default behaviour for sending the read receipt to the e-mail
  sender: to always send it or not, or asking each time

.. _cos-pool:

Server Pools
------------

In this page it is possible to select on which servers new users can
be added to the COS.

.. note:: If only one server has been defined, no choice is possible.

.. _cos-adv:

Advanced
--------

The *Advanced* Option allow to configure the user quota, passwords,
policies, and more.

The **user quota**, is a set of options that limit how much space a
user can occupy on the server, or how many contacts he can have. It
also encompasses the option to send periodic notifications when the
user space raises over a given threshold.

The **Password** settings permit to tune the length, characters, and
duration of the user passwords. It is also possible to reject common
passwords.

The **Failed Login Policy** allows to define the behaviour of
|product| when a user fails a log in. A typical policy can lock out
the user for *one hour* when *three* consecutive login attempts fail
within *30 minutes*.

The **Timeout Policy** concern the duration of the token's validity.

The **Email Retention Policy** define how long e-mail will be stored
before being automatically deleted.

Finally, the **Free/Busy Interop** option allows to provide O and OU
records to display the free/busy user schedule when using an Exchange
server.
