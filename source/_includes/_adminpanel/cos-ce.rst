A |cos| determines which features and options can be accessed by a
user, how to access them, and sets the default values for a number of
them.

To create a COS, click the :bdg-primary:`CREATE` button, on the top
left corner, then enter a name and optionally a description and some
notes. You can then configure all the options for the COS by entering
the left-hand side *Details* menu.

General
-------

COS List
~~~~~~~~

Initially the page presents the list of the COSes defined on |product|
and their status. Click any of them to see its options and configure them.

Details
-------

.. _cos_info:

General Information
~~~~~~~~~~~~~~~~~~~

This section shows information about the chosen COS: name (which can
be changed), ID, and creation date together with some calculated
value: which accounts and domains use the COS. These values are
expanded below, with the complete list of handled accounts and
domains.

.. _cos-features:

Features
~~~~~~~~

*Features* are settings that allow or forbid the user to access the
most used Modules of |product|, both via browser and mobile apps. The
Administrator can prevent users to even access the `Settings` Module,
meaning that the user can not customise anything in the web mail's
Settings Module. This proves useful in some scenarios, like for
example:

* an organisation wants that all the communication of its employees
  has the same branding (including also Out Of Office replies, the
  visible name of the sender, and other)
* another organisation needs that the e-mails be encrypted and does
  not want users to send plain-text e-mails

.. hint:: Some of these options can be enabled or disabled via CLI:
   please refer to section :ref:`cli-features` for more information.

.. index:: Chat preferences; by COS

.. _cos-chat:

Chat
~~~~

Options in this section allow to customise some of the |wsc| features.

.. include:: /_includes/_adminpanel/chats.rst

.. _cos-prefs:

Preferences
~~~~~~~~~~~

*Preferences* consist of generic options for the various components
(Mails, Calendar, Contacts). Most of these options can be overridden
by users in their Settings Module.

The first is the default language to be used by the members of the
COS, which includes also the locale The list of supported languages
can be found in section :ref:`supported-languages`. The remaining
options concern:

* the default appearance of |product| in web clients: for example, if
  e-mails are displayed as conversations, or the calendar shows a
  month or a work week. The maximum size for attachments sent by
  e-mail is also configurable here.

* the default values or behaviour of the features: for example whether
  new e-mail contacts are added automatically to Contacts or how
  often to check for new e-mails

* which options are available to the user: for example, whether the
  user is allowed to forward e-mails or create a filter to forward
  specific e-mails

* The default behaviour for sending the read receipt to the e-mail
  sender: to always send it or not, or asking each time

* Whether new contacts from which we receive an e-mail are
  automatically added to the user's Contacts and if GAL should be used
  to auto-fill addresses of outgoing e-mails

* A number of default options for the Calendar: time zone, how the
  calendar is displayed, and additional option for appointments and
  events.

.. _cos-pool:

Server Pools
~~~~~~~~~~~~

In this page it is possible to select on which servers new users can
be added to the COS.

.. note:: If only one server has been defined, no choice is possible.

.. _cos-adv:

Advanced
--------

Multiple *Advanced* options can be configured here, divided into
multiple groups

Forwarding
  Two options govern how to forward messages: how long an e-mail
  address can be and the maximum number of recipients allowed.

.. index:: Quota; by COS

Quotas
  A set of options that limit how much space a user can occupy on the
  server, or how many contacts he can have. It also encompasses the
  options to send periodic notifications when the user space raises
  over a given threshold and a template for the notifications.

.. index:: Password policies; by COS

Password
  Settings for password policies: length, characters, and duration of
  the user passwords. It is also possible to reject common passwords.

  .. hint:: These settings are disregarded if authentication relies on
     an external server.

Failed Login Policy
  Define the behaviour of |product| when a user fails a log in.

  .. hint:: A typical policy can lock out the user for *one hour* when
     *three* consecutive login attempts fail within *30 minutes*.

Timeout Policy
  Configure the duration of the token's validity, i.e., how long a
  user or Administrator will be able to keep the Web-mail open without
  interaction.

Email Retention Policy
  Define how long e-mail will be stored before being automatically
  deleted from the Inbox (including its sub-folders), Trash, and Spam
  folders.

  .. note:: Even if you configure E-mail message lifetime with a value
     below 31 days, the system will automatically enforce a minimum
     retention of 31 days.

Enable mailbox import and export
================================


To enable Import or Export option:


1. In the **Carbonio Admin Panel**, go to **COS**.
2. Select the required **Class of Service (COS)**.
3. In the left pane, select **Features**.
4. In the **Mail** section, enable the following options:


  * **Allow user to import external mailbox**
  * **Allow user to export their mailbox**


     .. image:: /img/adminpanel/enable-import-cos.png
         :class: bordered-image
         :align: center
         :width: 80%


5. Save the changes.


These options allow users assigned to the selected COS to **import an external mailbox** and **export their mailbox**.




Enable mailbox import and export for an account
================================================


One more way is from directly enabling it from the Account configuration:


1. In the **Carbonio Admin Panel**, go to **Domains**.
2. Select the required domain.
3. Select **Accounts** and click the account for which you want to enable mailbox import and export.
4. In the account details pane, select the **Configuration** tab.
5. Scroll down to the **Features** section.
6. Under **Mail**, enable the following options:


  * **Allow user to import external mailbox**
  * **Allow user to export their mailbox**


  .. image:: /img/adminpanel/enable-import-config.png
         :class: bordered-image
         :align: center
         :width: 80%


7. Save the changes.


The selected user can now **import an external mailbox** and **export their mailbox**.

