.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mobile_apps:

APPs for Mobile Devices
=======================

The following APPs can be downloaded and installed on mobile devices
equipped with Android or iOS. They can be used to interact with either
|ce| or |carbonio| servers.

Mail
   It is the client that allows the management of mail from Ios or
   Android mobile devices

Chats
   The Chats app guarantees the creation and use of chats, virtual
   meetings and spaces wherever the user is.

Files
   The Files app allows the user to read, upload and possibly delete
   the files inside |file|. Furthermore, upload of images and
   documents from mobile devices is available.

.. _app-download:

Mobile APPs Download
--------------------

.. tab-set::

   .. tab-item:: Android :fa:`android`

      Click on the links to access the App page on Google Play Store:

      * Mail https://play.google.com/store/apps/details?id=com.zextras.iris
      * Chats https://play.google.com/store/apps/details?id=com.zextras.team
      * Files https://play.google.com/store/apps/details?id=com.zextras.files

      It is required that the Android version be equal to or higher
      than **5.0**

   .. tab-item:: iOS :fa:`apple`

      Click on the links to access the App page on Apple App Store:

      * Mail https://apps.apple.com/app/carbonio-mail/id1490253524
      * Chats https://apps.apple.com/app/zextras-chats/id1459844854
      * Files https://apps.apple.com/app/carbonio-files/id1606750406

      It is required that the iOS version be equal to or higher than
      **14**

.. _mobile-apps-features:

Mobile Clients Features
-----------------------

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Mail App
      :columns: 4

      |carbonio| Mail is |zx| official and free app for |carbonio| and |ce|
      users and allows you to access all your |carbonio| E-mails, calendars,
      and contacts from your mobile devices.

      These are the main features of the |carbonio| Mail app:

      * Complete e-mail management with default Inbox, Drafts, Junk, and
        Trash folders
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

   .. grid-item-card:: Chats App
      :columns: 4

      The |team| App is |zx| official and free app for |product| users and
      allows you to chat with colleagues and access shared spaces from your
      mobile devices.

      The main features of the |carbonio| Chats app are:

      * Send and receive text messages and emoticons
      * Manage, modify, and moderate 1-to-1 Chats and Group Chats,
        including the possibility to invite or remove attendees
      * Create or participate in virtual meetings
      * Share files in the chats
      * Enable or Disable Push Notifications
      * Dark mode supported

   .. grid-item-card:: Files App
      :columns: 4

      The |file| App is |zx| official and free app for |product| users,
      which allows to manage files and documents on |file| and share them
      with colleagues.

      The main features of the |carbonio| Files App are:

      * Securely access any file or folder in |file| from your smartphone
      * Move, copy, and delete files or folders
      * Upload new files
      * Edit file’s metadata (name, description)
      * Access shared files and folder
      * Manage trash folder
      * Manage links for sharing files and folders
      * UI support for tablets
      * Preview of multimedia files directly into the app

.. _mobile-files-preview:

Preview in Files App
--------------------

The following file types can be previewed on the Files
App. Unsupported file types can be opened with an external
application.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: iOS
      :columns: 6

      * iWork
      * Microsoft Office Documents
      * RTF documents
      * PDF
      * Images / Video / Audio files
      * TXT 
      * OpenDocument (odt, ods, odp)
      
   .. grid-item-card:: Android
      :columns: 6

      * PDF
      * Images / Video / Audio files
      * TXT (coming soon)
      * OpenDocument (coming soon)
      
.. _mobile-apps-conf:

Mobile APPs Configuration
-------------------------

In order to access from a |zx| mobile app to your account, please
follow the directions in this section. The procedure is required only
when you configure the first APP, all the other will be able to reuse
the credentials configured for the first App: in other words, the
access credentials are shared among |zx| Apps.

For example, if you install the |carbonio| Mail App and configure to
access the account ``john@example.com``, as soon as you install the
|file| App, you will be able to automatically access the files stored
in |file| for the same account.

In the remainder, we configure the |carbonio| Mail App, but the
directions are the same for other Apps.

Server Side Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~

The mobile application is enabled by default on all users.
These are the only server-side requirements:

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

#. Download the application (see the :ref:`app-download`
   section)

#. Activate  (see the :ref:`carb-mail-notifications`  section)

#. Login via app

.. grid::
   :gutter: 3

   .. grid-item::
      :columns: 2

   .. grid-item::
      :columns: 3

      .. _fig-carb-mail-login:

      .. figure:: /img/login.png
         :width: 90%

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
