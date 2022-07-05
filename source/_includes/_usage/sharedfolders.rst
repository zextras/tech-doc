.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mobile_shared_folders_and_you_and_your_mobile:

Shared Folders and You (and Your Mobile)
----------------------------------------

With |product|, it’s possible to synchronize folders that are not
owned by the user itself to mobile devices. This applies to all item
types available through the Exchange ActiveSync protocol, so you’ll be
able to sync any shared email folder, address book, calendar or task
list to mobile devices.

Specific features available on mobile devices might differ, based on the
client in use.

.. warning:: Not all clients support the synchronization of multiple
   address books, calendars or task lists via Exchange ActiveSync.

..
   .. _how_to_sync_a_shared_folder_to_your_mobile_devices:

   How to Sync a Shared Folder to Your Mobile Devices
   --------------------------------------------------

   To allow a higher level of control over synchronization, users can
   choose the shared folders to synchronize with their mobile devices.

   .. _enable_mobile_synchronization_for_a_shared_folder:

   Enable Mobile Synchronization for a Shared Folder
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   To enable mobile synchronization for a shared folder:

   - Log in to |product|

   - Right-click the shared folder to sync

   - Select **Manage Shares** from the drop-down menu

   - Select the checkbox **Enable synchronization for this folder**
     checkbox

   - Press :bdg:`OK`

   The new folder will be synchronized to any mobile device connected to
   the account.

   .. _disable_mobile_synchronization_for_a_shared_folder:

   Disable Mobile Synchronization for a Shared Folder
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   To exclude a shared folder from syncing with a mobile device:

   - Log in to |product|

   - Right-click the shared folder to sync

   - Select **Manage Shares** from the drop-down menu

   - Clear the checkbox **Enable synchronization for this folder**
     checkbox

   - Press :bdg:`OK`

.. _mobile_restrictions:

Restrictions
------------

The following restrictions apply to shared folder synchronization:

- It is not possible to sync a mountpoint referring to a full account
  share

- It is not possible to sync a subfolder of a shared folder, as doing
  so would return an incomplete folder tree

- It is not possible to sync a read-only share, as the Exchange
  ActiveSync protocol does not envision the concept of a `read-only`
  resource. Synchronizing a read-only folder will cause severe
  inconsistencies between the client and the server, along with many
  errors
