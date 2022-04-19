.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mobile_apps:

APPs for Mobile Devices
=======================

Currently, a mobile application to access a |product| mailbox is
available.

As new components like Chats and Files will be available for |product|,
dedicated mobile app will be made available as well.

..
   Mail
      It is the client that allows the management of mail from Ios or
      Android mobile devices

   Team
      The Team app guarantees the creation and use of chats, instant
      meetings and spaces wherever the user is.

   Drive
      The Drive app allows the user to read, upload and possibly delete
      the files inside the Drive. Furthermore, you can upload images and
      documents from your mobile device.

.. _carb-mail-:

Mobile clients: Mail
--------------------

|carbonio| Mail is the official and free app for |carbonio| and |carbonio|-CE users.

|carbonio| Mail mobile app is available for both Android and iOS.
Allows you to access all your |carbonio| E-mails, calendars, and contacts from your mobile devices.

These are the main features of the |carbonio| Mail app:

.. hlist::
   :columns: 3

   * Complete e-mail management with default Inbox, Drafts, Junk, and Trash folders

   * Send later functionality

   * Customizable swipe actions from the preview of the email

   * Text formatting options

   * Set priorities to the outgoing emails

   * Attachment management

   * Create new folders

   * Manage your settings

   * Manage contacts

   * Full management of calendars and appointments

   * Search for emails or contacts in the unified Search tab

   * Dark theme

   * Tag e-mails

.. _carb-mail-download:

Download
~~~~~~~~

.. tab-set::

   .. tab-item:: Android :fa:`android`

      |carbonio| Mail is available for download on the Google Play Store:

      https://play.google.com/store/apps/details?id=com.zextras.iris

      It is required that the Android version be equal to or higher
      than **5.0**

   .. tab-item:: iOS :fa:`apple`

      iOS version is available for download on the Apple's App Store:

      https://apps.apple.com/app/carbonio-mail/id1490253524

      It is required that the iOS version be equal to or higher than
      **14**

.. _carb-mail-conf:

|carbonio| Mail configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The mobile application is enabled by default on all users.
These are the only server side requirements:

* Port 443/HTTPS must accessible from the Internet

* A valid SSL/TLS certificate must be available for the domain

  .. note:: Directions to install a valid certificate can be found in
     section :ref:`install-SSL-cert`.

* The user with whom you log in via the |product| Mail App must be
  existing and active

.. _carb-mail-login:

Login via |carbonio| Mail
~~~~~~~~~~~~~~~~~~~~~~~~~

In order to use |carbonio| Mail App, follow these steps:

#. Download the application (see the :ref:`carb-mail-download`
   section)

#. Activate  (see the :ref:`carb-mail-notifications`  section)

#. Login via app

.. grid::
   :gutter: 3

   .. grid-item::
      :columns: 3

   .. grid-item::
      :columns: 2

      .. _fig-carb-mail-login:

      .. figure:: /img/login.png
         :scale: 30%

         Login screen of |carbonio| Mail app.

   .. grid-item::
      :columns: 4

      In order to login, in :numref:`fig-carb-mail-login` provide  the
      following date:

      * E-mail account name

      * Password

      * Server name, which must match the FQDN. It's not necessary to
        enter the port number as 443 / HTTPS is set by default.

   .. grid-item::
      :columns: 3



.. _carb-mail-auth:

Authentication
~~~~~~~~~~~~~~

|carbonio| Mail mobile app connects to the server through an HTTPS
secure connection and |carbonio| responds with its certificate.  This
process (called SSL handshake) provides data integrity and data
privacy to the information transferred between the client and the
server, which is encrypted, provided that the SSL certificate is
**active and not expired**.

.. _carb-mail-notifications:

Notifications
~~~~~~~~~~~~~

Android devices manufacturers have strict default settings on which
apps can display notifications, sometimes causing the |carbonio| Mail
App not to be able to notify new messages.

To make sure that your device allows all required notifications, follow these steps:

#. Log out from the app

#. Access the device’s Settings, then enter the **Apps &
   Notifications** menu

#. Select the |carbonio| Mail app from the list of all installed apps

#. Enter the **Notifications** section

#. Enable the notifications (first option on the top)

#. Enable the banner notification on the **Appointment** and **E-mail**
   subsections

#. Log back in

Notifications should now work!

.. warning:: For push notifications to work on the device, the
   |product| server must be able to communicate with the
   notifications.zextras.com service on port 443 (The exact URL to
   which notifications are sent is:
   https://notifications.zextras.com/firebase/ )

