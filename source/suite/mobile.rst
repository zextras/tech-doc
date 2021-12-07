================
 Zextras Mobile
================

.. _enable_zextras_mobile_synchronization_for_a_cos:

Enable Zextras Mobile Synchronization for a COS
===============================================

.. _how_to_enable_zextras_mobile_for_all_users_in_a_class_of_service:

How to Enable Zextras Mobile for all Users in a Class Of Service
----------------------------------------------------------------

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet

      To enable Zextras Mobile for all users in a COS from the Administration
      Console:

      - Open the Zimbra Administration Console

      - Double-click the Class Of Service you want to edit (on the left,
        under :menuselection:`Configuration --> Class of Service`)

      - Click the Mobile tab

      - Check the ``Enable mobile synchronization`` button

   .. grid-item-card:: Via the CLI

      To enable Zextras Mobile for all users in a COS from the CLI:

      - As the 'zimbra' user run :command:`zmprov mc COSName
        zimbraFeatureMobileSyncEnabled TRUE`

.. _how_to_disable_zextras_mobile_for_all_users_in_a_class_of_service:

How to Disable Zextras Mobile for all Users in a Class Of Service
-----------------------------------------------------------------

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet

      To disable Zextras Mobile for all users in a COS from the Administration
      Console:

      - Open the Zimbra Administration Console

      - Double-click the Class Of Service you want to edit (on the left,
        under :menuselection:`Configuration --> Class of Service`).

      - Click the Mobile tab and uncheck the ``Enable mobile
        synchronization`` button.

   .. grid-item-card:: Via the CLI

      To disable Zextras Mobile for all users in a COS from the CLI:

      - As the 'zimbra' user run :command:`zmprov mc COSName
        zimbraFeatureMobileSyncEnabled FALSE`

.. _mobile_note_about_settings_hierarchy:

Note about Settings Hierarchy
-----------------------------

COS-level settings are overridden by user-level settings.

.. _enable_zextras_mobile_for_a_single_user:

Enable Zextras Mobile for a Single User
=======================================

By enabling the Zextras Mobile Module for a single user you authorize a
single user to use all the mobile functions of the Zextras Mobile
Module.

.. _how_to_enable_zextras_mobile_for_a_single_user:

How to Enable Zextras Mobile for a Single User
----------------------------------------------

.. grid::
   :gutter: 3

   .. grid-item-card::   From the Zimbra Administration Console

      To enable Zextras Mobile for a single user from the Administration
      Console:

      - Open the Zimbra Administration Console

      - Double-click the user you want to edit (on the left, under
        :menuselection:`Manage --> Accounts`)

      - Click the Mobile tab

      - Check ``Enable mobile synchronization``

      .. _mobile_from_the_zimbra_cli_3:

   .. grid-item-card:: Via the CLI

      To enable Zextras Mobile for a single user from the CLI:

      - As the 'zimbra' user run: :command:`zmprov ma user@example.com
        zimbraFeatureMobileSyncEnabled TRUE`

.. _mobile_how_to_disable_zextras_mobile_for_a_single_user:

How to Disable Zextras Mobile for a Single User
-----------------------------------------------

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet

      To disable Zextras Mobile for a single user from the CLI:

      - Open the Zimbra Administration Console

      - Double-click the user you want to edit (on the left, under
        :menuselection:`Manage --> Accounts`)

      - Click the Zextras Mobile tab and uncheck ``Enable mobile
        synchronization``

   .. grid-item-card:: Via the CLI

      To disable Zextras Mobile for a single user from the CLI:

      - As the 'zimbra' user run :command:`zmprov ma user@example.com
        zimbraFeatureMobileSyncEnabled FALSE`


.. note:: User-level settings override COS-level settings.

.. _mobile-password:

The Mobile Password Feature
===========================

.. _mobile_passwords_and_you:

Mobile Passwords and You
------------------------

The ``Mobile Password`` feature allows Global and Delegated Admins to
set an additional password for an account to be used for Exchange
ActiveSync authentications only.

The main benefits of using this feature are:

- Enforce ``set-and-forget`` safe passwords, regardless of any other
  password policy, so that you won't need to change the password saved
  on all mobile devices synchronized with an account should this
  account’s Zimbra password change

- Avoid the ``real`` password to be disclosed in case of unauthorised
  access to the device/client

A ``Mobile Password`` will not be valid for Webmail/POP3/IMAP/SMTP
logins, and the account password will not be valid for mobile logins.

.. _how_to_set_a_mobile_password_for_a_mailbox:

How to Set a Mobile Password for a Mailbox
------------------------------------------

Mobile Passwords are handled by the Zextras Auth module, more
information can be found in section :ref:`auth_zimlet-create-mobile`.

.. _mobile_device_management_a_k_a_mobile_provisioning:

Mobile Device Management a.k.a. Mobile Provisioning
===================================================

.. _what_is_mobile_device_management:

What is Mobile Device Management?
---------------------------------

Mobile Device Management (MDM - also known as provisioning) allows an
administrator to define a set of rules and security settings that are
applied Over The Air to one or more mobile devices, ranging from PIN
policies to Allowed/Blocked app lists and including ``one time``
commands, such as the remote wipe of the entire device.

MDM effectively allows administrators to limit and restrict the use of
corporate mobile devices to avoid risky or improper behaviors.

MDM is also a priceless aid for ``Bring Your
Own Device`` corporate policies, allowing users to connect their
personal mobile devices to the corporate servers, while reducing the
risk of security breaches to a minimum.

.. _mobile_provisioning_features_available_on_your_client:

Provisioning Features Available on Your Client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Not all provisioning features are available on all clients. Please refer
to your device’s manufacturer and online resources for specific
information about the MDM features supported by the device itself.

.. _zextras_suite_and_mdm:

Zextras Suite and MDM
---------------------

Zextras Suite features advanced MDM features through the Exchange
ActiveSync protocol version 14+.

Mobile policies can be enabled at COS and mailbox levels, allowing both
a quick ``one for many`` setup and user-based customized management. In
both cases, Mobile Management Options are available in the ``Mobile``
tab.

.. _mobile_provisioning_options:

Provisioning Options
~~~~~~~~~~~~~~~~~~~~

The following provisioning options are available:

- Enable Mobile Device Management: Enable or disable the use of mobile
  policies for the current user/COS

- Allow non-provisionable devices: Allow the user to synchronize any
  device that does not support provisioning

- Allow partial policy enforcement on device: Allow the user to
  synchronize any device that does not support one or more applicable
  policies

.. hint:: By default, MDM is disabled in Zextras Mobile. To enable
   navigate to :menuselection:`Zextras Suite --> Mobile --> Advanced
   Settings` and check the ``Enable Mobile Device Management`` option

.. _mobile_enforceable_policies:

Enforceable Policies
~~~~~~~~~~~~~~~~~~~~

Enforceable Policies are available right below the ``Mobile Devices``
list, grouped in the following categories:

- Sync Settings: Set synchronization spans and limits

- Device Settings: Enable or disable device features such as camera,
  WiFi, removable storage or Bluetooth

- Device Security Settings: Force an unlock code and define the
  minimum requirements for the code itself

- Device Applications: Enable or disable ``standard`` device
  applications such as the Browser and POP/IMAP client or unsigned
  apps

Two lists are also available for application whitelist/blacklist
management:

Approved Applications
   A customizable list of approved applications.

Blocked Applications
   A customizable list of blocked applications that won’t be usable on
   the device.

.. _mobile_password:

Mobile Password
~~~~~~~~~~~~~~~

While conceptually similar, the mobile password feature is not part of
Mobile Device Management and can be used with any version of the EAS
protocol.

.. _mobile_syncstates:

SyncStates
==========

.. _zextras_mobile_and_the_syncstate:

Zextras Mobile and the SyncState
--------------------------------

The SyncState (short for Synchronization Status) is a set of information
kept on the server about the synchronization with a mobile device. Each
time a device establishes a connection with Zextras Mobile, the
following steps take place:

1. The device requests a folderSync operation to synchronize the local
   Folders with the ones on the server.

   :octicon:`arrow-right` One SyncKey per local folder is sent (or a single
   SyncKey set to '0' if this is the first connection between the
   device and the server)

2. The server replies with a list of available folders.

   :octicon:`arrow-right` One SyncKey per folder is sent by the server.

3. The device requests an itemSync operation to synchronize all due
   items.

   :octicon:`arrow-right` The server stores the items synchronized in the
   SyncState.

4. After completing the itemSync operation, the device sends a 'ping'
   command to keep the connection alive.

   :octicon:`arrow-right` Step 4 is repeated as long as no changes happen
   to the synchronised account.

Every time a new item is stored on the mailbox or an old item is
modified, the server notifies the availability to the device, which
closes the active connection (the one kept alive by the ping command)
and repeats steps 3 and 4.

The SyncState is the combination of the SyncKeys saved on step 2 and the
`itemID`\s saved on step 3. It is saved by the server per the
userID/deviceID unique pair.

.. _mobile_sync_request:

Sync Request
~~~~~~~~~~~~

The Sync Request is the actual synchronization process, started by
either Zextras Mobile or by the client. During a sync request, any
change in the mailbox that happened since the last request is
synchronized to the device and vice versa.

A sync request is issued when:

- The SyncState changes.

- A sync is forced client-side.

- The current :command:`ping` expires and a new one is sent by the
  device (the keepalive duration is defined by the client).

.. _mobile_managing_the_syncstates:

Managing the SyncStates
-----------------------

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet
      :columns: 12
                
      Zextras Mobile provides two options in the Administration Zimlet to
      manage the SyncStates of synchronized mobile devices:

      - Reset Device: Resets the device’s SyncState for a single account,
        forcing a full re-synchronization the next time the device connects
        to the server.

      - Wipe Device: Removes all the device’s SyncState and history from the
        server. Useful when a mobile device is not used anymore or is
        assigned to a different employee in the same company.

   .. grid-item-card:: Via the CLI
      :columns: 12

      To manage the SyncStates of synchronized mobile devices via the
      CLI, use one of the following commands:

      .. grid::
         :gutter: 1

         .. grid-item-card::
            :columns: 4

            The doRemoveDevice command
            ^^^^^

            Syntax::

              zxsuite mobile doRemoveDevice {account} {device_id}

            Usage example:

            ``zxsuite mobile doRemoveDevice john@example.com Appl79032X2WA4S``

            Removes John's Appl79032X2WA4S device SyncState

         .. grid-item-card::
            :columns: 4

            The doResetAccount command
            ^^^^^^

            Syntax::
              
              zxsuite mobile doResetAccount {account}

            Usage example:

            ``zxsuite mobile doResetAccount john@example.com``
               
            Resets all the device states for John's account


         .. grid-item-card::
            :columns: 4

            The doResetDevice command
            ^^^^^

            Syntax::

              zxsuite mobile doResetDevice {account} [attr1 value1 [attr2 value2...

            Usage example:

            ``zxsuite mobile doResetDevice john@example.com Appl79032X2WA4S``

            Resets John's Appl79032X2WA4S device SyncState

.. _mobile_advanced_settings:

Advanced Settings
=================

.. _zextras_mobile_dos_filter:

Zextras Mobile DoS Filter
-------------------------

Zextras Mobile includes a dedicated DoS Filter component to improve both
security and stability. The filter will kick in whenever a device
exceeds the chosen connection rate over time and will "jail" the device
for a set period of time, refusing any connections from it.

This improves both security, helping to prevent Denial of Service
attacks, and stability by blocking clients that are performing too many
requests due to bugs or malfunctioning saving resources for all other
clients.

.. warning:: The Mobile DoS filter is disabled by default, and can be
   enabled as needed via CLI.

.. _mobile_configuration:

Configuration
~~~~~~~~~~~~~

The Mobile DoS Filter is entirely configured via CLI, using the
following attributes:

-  ``mobileAntiDosServiceEnabled``: enable the Mobile DoS Filter
   service. Default ``false``;

-  ``mobileAntiDosServiceJailDuration``: duration (in milliseconds) of
   synchronization "jail". Default 600000;

-  ``mobileAntiDosServiceTimeWindow`` interval of time to calculate the
   connection ratio. The jail is triggered if a device sends more than
   ``mobileAntiDosServiceMaxRequests`` requests in this time window.
   Default 30000ms;

-  ``mobileAntiDosServiceMaxRequests`` maximum number of requests
   received within ``mobileAntiDosServiceTimeWindow`` milliseconds).
   Default 150;

All attributes are set at global level with
``zxsuite config global set|get|clear``. Specific info for each property
can be obtained via ``zxsuite config info attribute [propertyname]``.

.. _how_mobile_dos_filter_works:

How Mobile DoS Filter works
~~~~~~~~~~~~~~~~~~~~~~~~~~~

When the anti-dos service is running and ``mobileAntiDosMaxRequests`` is
greater than 0, the system stores in memory the timestamp of the last
``mobileAntiDosMaxRequests`` requests. If the maximum number of request
timestamps has been stored and all stored requests are within the time
window, all new requests from this device/account are dropped for
``mobileAntiDosJailDuration`` milliseconds.

When the rate has been exceeded, a warning is sent via email to admin
and added to server notifications.

.. note:: Issuing the command :command:`zxsuite mobile
   doRestartService anti-dos` will reset all jails and counters.

.. _zextras_autodiscover:

Zextras Autodiscover
--------------------

Zextras Autodiscover is Zextras implementation of the Autodiscover
protocol, which allows mail clients to automatically configure the
appropriate server settings, avoiding the necessity of a manual
configuration. This is a very useful functionality and it is also
secure, since it also needs an **SSL trusted certificate** to work.

.. _how_to_enable_zextras_autodiscover:

How to enable Zextras Autodiscover
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To use Zextras Autodiscover you have to edit the **jetty template
configuration file** :file:`/opt/zimbra/jetty/etc/jetty.xml.in` on
**all** the mailstore servers as follows.

.. grid::
   :gutter: 2

   .. grid-item-card::

      Default jetty template
      ^^^^
      .. code:: xml

         <Call name="addRule">
           <Arg>
             <New class="org.eclipse.jetty.rewrite.handler.RewritePatternRule">
                     <Set name="pattern">/autodiscover/*</Set>
                     <Set name="replacement">/service/autodiscover</Set>
             </New>
           </Arg>
         </Call>

         <Call name="addRule">
           <Arg>
             <New class="org.eclipse.jetty.rewrite.handler.RewritePatternRule">
                     <Set name="pattern">/Autodiscover/*</Set>
                     <Set name="replacement">/service/autodiscover</Set>
             </New>
           </Arg>
         </Call>

         <Call name="addRule">
           <Arg>
             <New class="org.eclipse.jetty.rewrite.handler.RewritePatternRule">
                     <Set name="pattern">/AutoDiscover/*</Set>
                     <Set name="replacement">/service/autodiscover</Set>
             </New>
           </Arg>
         </Call>

   .. grid-item-card::

      Jetty template for Autodiscover
      ^^^^

      .. parsed-literal::

         <Call name="addRule">
           <Arg>
             <New class="org.eclipse.jetty.rewrite.handler.RewritePatternRule">
                     <Set name="pattern">/autodiscover/\*</Set>
                     **<Set name="replacement">/service/extension/autodiscover</Set>**
             </New>
           </Arg>
         </Call>

         <Call name="addRule">
           <Arg>
             <New class="org.eclipse.jetty.rewrite.handler.RewritePatternRule">
                     <Set name="pattern">/Autodiscover/\*</Set>
                     **<Set name="replacement">/service/extension/autodiscover</Set>**
             </New>
           </Arg>
         </Call>

         <Call name="addRule">
           <Arg>
             <New class="org.eclipse.jetty.rewrite.handler.RewritePatternRule">
                     <Set name="pattern">/AutoDiscover/\*</Set>
                     **<Set name="replacement">/service/extension/autodiscover</Set>**
             </New>
           </Arg>
         </Call>

This change is **mandatory** if you use :ref:`mobile password
<auth_zimlet-create-mobile>`.

You can easily change this settings with this command:

.. code:: bash

   sed -i 's|/service/autodiscover|/service/extension/autodiscover|g' /opt/zimbra/jetty/etc/jetty.xml.in

.. _zextras_mobile_performance_tuning:

Zextras Mobile Performance Tuning
---------------------------------

Zextras Mobile provides three useful options to fine-tune Zextras Mobile
according to system performance.


.. grid::
   :gutter: 3

   .. grid-item:: **Notifications Latency**
      :columns: 4
                
      ``ZxMobile_NotificationsLatency`` represents The seconds of
      delay between an event on the server and its notification to the
      mobile device.

   .. grid-item:: **Use Instant Notifications**
      :columns: 4

      ``ZxMobile_UseInstantNotficiations`` enables or disables instant
      notifications. If **true**, it also overrides ``Notifications
      Latency``.

   .. grid-item:: **Max Ping Heartbeat**
      :columns: 4
                
      ``ZxMobile_MaxPingHeartbeat`` defines the maximum interval
      between :command:`ping` commands.

All settings can be edited in the Administration Zimlet or via CLI using
the ``zxsuite config`` command.

.. _mobile_when_to_edit_the_performance_tuning_settings:

When to Edit the Performance Tuning Settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Default settings should be optimal for most situations. If you
experience one or more of the problems below, please apply the proper
solution.

+-----------------------------------+-----------------------------------+
| Problem                           | Solution                          |
+===================================+===================================+
| High system load                  | Disable instant notifications     |
+-----------------------------------+-----------------------------------+
| High system load after disabling  | Raise notification latency        |
| instant notifications             |                                   |
+-----------------------------------+-----------------------------------+
| Mobile users experience high      | Disable instant notifications and |
| network usage                     | tweak notifications latency       |
+-----------------------------------+-----------------------------------+
| Devices can connect but sessions  | Adjust Max Ping Heartbeat         |
| are interrupted frequently        | according to your network         |
|                                   | configuration                     |
+-----------------------------------+-----------------------------------+
| Items are synchronized from       | Lower notification latency or     |
| server-to-device with an          | enable instant notifications      |
| excessive delay                   |                                   |
+-----------------------------------+-----------------------------------+

.. _mobile_shared_folders:

Shared Folders
==============

.. _mobile_shared_folders_and_you_and_your_mobile:

Shared Folders and You (and Your Mobile)
----------------------------------------

With Zextras Suite, it’s possible to synchronize folders that are not
owned by the user itself to mobile devices. This applies to all item
types available through the Exchange ActiveSync protocol, so you’ll be
able to sync any shared email folder, address book, calendar or task
list to mobile devices.

Specific features available on mobile devices might differ, based on the
client in use.

.. warning:: Not all clients support the synchronization of multiple
   address books, calendars or task lists via Exchange ActiveSync.

.. _how_to_sync_a_shared_folder_to_your_mobile_devices:

How to Sync a Shared Folder to Your Mobile Devices
--------------------------------------------------

To allow a higher level of control over synchronization, users can
choose the shared folders to synchronize with their mobile devices.

.. _enable_mobile_synchronization_for_a_shared_folder:

Enable Mobile Synchronization for a Shared Folder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To enable mobile synchronization for a shared folder:

- Log in to the Zimbra Web Client

- Right-click the shared folder to sync

- Select **Folder Sync Settings** in the drop-down menu

- Select the checkbox **Enable synchronization for this folder**
  checkbox

- Press :bdg:`OK`

The new folder will be synchronized to any mobile device connected to
the account.

.. _disable_mobile_synchronization_for_a_shared_folder:

Disable Mobile Synchronization for a Shared Folder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To exclude a shared folder from syncing with a mobile device:

- Log in to the Zimbra Web Client

- Right-click the shared folder to sync

- Select **Folder Sync Settings** in the drop-down menu

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

.. _mobile_eas_filters:

EAS Filters
===========

In the EAS protocol, the protocol version used for the synchronization
is defined during the initial handshake and never changed. The server
presents a list of all available protocol versions and the client
chooses one among that list.

EAS filters are a way to limit the EAS version available to a subset of
users or clients to ensure that the proper version is used.

Multiple EAS filters can be set up and will be evaluated in sequential
order (see the ``getAllEASFilters`` and ``doMoveEASFilter`` commands
in section :ref:`mobile_managing_eas_filters` below).

.. _mobile_anatomy_of_an_eas_filter:

Anatomy of an EAS Filter
------------------------

An EAS filter is composed of 5 parts:

Type
   Defines the type of filter rule.

Parameter
   The filtering identifier (e.g. device brand or email address).

Mode
   Defines whether the software will limit the available versions or
   provide a fixed list.

``easversions`` field
   Contains the protocol versions enforced by the filter.

``Blocking`` Boolean value
   Defines whether other filters are executed once the current one is
   successfully matched.

.. _mobile_managing_eas_filters:

Managing EAS Filters
--------------------

EAS filters are managed through the CLI using the following four
dedicated commands.

.. grid::
   :gutter: 2

   .. grid-item-card::
      :columns: 6

      getAllEASFilters
      ^^^^

      This command lists all existing filters.

      Sample Output::

        filters

                 ID                                                          0
                 mode                                                        fixed
                 rule                                                        [type = or; rules = [[type = contains; rule = outlook/] OR [type = contains; rule = microsoft.outlook]]
                 easversions                                                 14.0
                 blocking                                                    true

                 ID                                                          1
                 mode                                                        limit
                 rule                                                        [type = contains; rule = samsung]
                 easversions                                                 2.5
                 blocking                                                    false

                 ID                                                          2
                 mode                                                        limit
                 rule                                                        [type = always]
                 easversions                                                 14.1
                 blocking                                                    false

   .. grid-item-card::
      :columns: 6

      doAddEASFilter
      ^^^^

      This command adds a new EAS filter::

        Syntax:

        zxsuite mobile doAddEASFilter {and|or|regex|contains|account} {text|user@example.com|account=otheruser@example.com,contains=android} {add|subtract|fixed|limit} {easversions} [attr1 value1 [attr2 value2...]]

      Usage example::

          zxsuite mobile doAddEASFilter contains android fixed 2.5,12.0,14.1

      Adds a protocol filter that will restrict the pool of available
      EAS versions to 2.5, 12.0 and 14.1 if the user agent name
      contains the string 'android'.

      ::

           zxsuite mobile doAddEASFilter and account=user@example.com,contains=android fixed 14.1 blocking true

      Adds a protocol filter that will restrict the pool of available
      EAS versions to 14.1 if the user agent name contains the string
      'android' only for user@example.com. No more EAS filters will be
      evaluated after this one due to the 'blocking' directive.

   .. grid-item-card::
      :columns: 6

      doDeleteEASFilter
      ^^^^

      This command deletes an existing EAS Filter.

      Syntax::

        zxsuite mobile doDeleteEASFilter _id_

      Usage example::

        zxsuite mobile doDeleteEASFilter 2

      Removes the filter with id = 2.

   .. grid-item-card::
      :columns: 6

      doMoveEASFilter
      ^^^^

      This command is used to move EAS filters to a different position in the
      filter queue.

      Syntax::

        zxsuite mobile doMoveEASFilter {from} {to}

      Usage example::

        zxsuite mobile doMoveEASFilter 0 5

      Moves the filter with id = 0 to the position 5.

.. _mobile_account_loggers:

Mobile Account Loggers
======================

Mobile account loggers are dedicated loggers that can output the
entirety of a user’s EAS logs into a dedicated logfile, with a different
verbosity than the one of the ``sync.log``. This allows for quicker
troubleshooting.

When creating an account logger, the following parameters must be
specified:

-  The target ``account``.

-  The ``log_level`` (verbosity) of the log.

-  The dedicated ``log_file``.

-  The ``window_size`` to enforce on all devices synchronizing with the
   account while the logger is running.

.. warning:: Account loggers are removed automatically when the
   mailboxd is stopped or restarted and do not usually survive a
   mailboxd crash. Log files won’t be affected.

.. _mobile_account_logger_management:

Account Logger Management
-------------------------

Account loggers can only be managed via the CLI through the following
commands:

.. grid::
   :gutter: 3

   .. grid-item-card::
      :columns: 4

      doAddAccountLogger
      ^^^^

      Syntax::

        zxsuite mobile doAddAccountLogger {account} {debug|info|warn|err|crit} {log_file} [attr1 value1 [attr2 value2...]]

      Usage example::

        zxsuite mobile doaddaccountlogger john@example.com info /tmp/john_logger

      Creates an info account logger for john's account to file /tmp/john_logger

      ::

         zxsuite mobile doaddaccountlogger john@example.com info /tmp/john_logger window_size 1

      Creates an info account logger for john's account to file /tmp/john_logger with window size set to 1.

   .. grid-item-card::
      :columns: 4

      doRemoveLogger
      ^^^^


      Syntax::

        zxsuite mobile doRemoveLogger {logger_id|"all_loggers"}

      Usage example::

        zxsuite mobile doremovelogger 5

      Removes the account logger with ID = 5

   .. grid-item-card::
      :columns: 4

      getAccountLoggers
      ^^^^

      Sample output::

        zxsuite mobile getAccountLoggers

              loggers

                      id                                                          7
                      level                                                       DEBUG
                      name                                                        AccountLogger
                      description                                                 Logging account user@example.com using level debug, log file /tmp/user.log
                      remove command                                              zxsuite mobile doRemoveLogger 7

.. _mobile_abq_allowblockquarantine_device_control:

ABQ - Allow/Block/Quarantine device control
===========================================

.. _mobile_abq_service:

ABQ Service
-----------

The "Allow/Block/Quarantine" feature allows for granular access control
of mobile devices connecting to the server. It’s a "pre-emptive" type of
security feature, meaning that it acts upon the first connection to the
server and it’s made to ensure that only authorized devices can finalize
synchronization with server. This allows a full administrator to keep
track of all mobile device used in their network. Presently only CLI
tools are provided; a web GUI will be released in the future.

.. _mobile_components:

Components
~~~~~~~~~~

The ABQ feature is composed of three main logical components:

- a Device Control List

- an Authorization Engine

- a set of CLI tools

.. grid::
   :gutter: 2

   .. grid-item-card::
      :columns: 4

      Device Control List
      ^^^^

      The Device Control List, also known as the "ABQ List", holds the
      information about allowed devices within the config engine. Devices can
      be added to the Device Control List via CLI based on their “Device ID”
      which can be obtained via CLI.

      It is also possible to further limit access by limiting the accounts
      that can synchronise with the server on a specific device.

      .. note:: On module startup, if the Device Control List is empty all
         mobile devices previously recognized by the Zimbra server will be
         imported as **Allowed**.

   .. grid-item-card::
      :columns: 4

      Authorization Engine
      ^^^^^

      The Authorization Engine takes care of checking devices against the
      Device Control List and setting their ABQ status to the appropriate
      value.

      Each rule is applied to all accounts connecting using a device it is a
      device id. It applies to a specific account connecting using that device
      if it has the format device_id/account_id or device_id/accountName

   .. grid-item-card::
      :columns: 4

      CLI Toolset.
      ^^^^^

      The CLI Toolset allows administrators to interact with the device
      control list and with the synchronization status of a device,
      specifically to:

      - Display the Device Control List

      - Display all Quarantined and Blocked Devices

      - Add one or more devices to the Device Control List

      - Move a device from “Quarantine” to “Allowed” or “Blocked”

      - Change the synchronization status of a device

Every time the administrator changes a device's status in an
ABQ-enabled environment, depending on the issued state the device will
be forced to re-sync folders with the server resulting in an immediate
re-route to either a :ref:`mobile_dummy_data` that will explain to
the user what’s happened, or to the real mailbox to perform the
re-sync.

.. _mobile_abq_modes:

ABQ Modes
~~~~~~~~~

The ABQ feature is triggered for every mobile device that tries to
synchronize with server, and can be set to one of four possible modes:
"Permissive", "Interactive", "Strict” and "Disabled". This attribute is
Global for all the cluster.

Permissive
   The Authorization Engine is not active, so after authenticating the
   user and checking their account status for safety reasons, the
   synchronization will continue. It is still possible to block
   specific devices but non-blocked devices will always be allowed to
   sync.

Interactive
   After authenticating the user and checking their account status for
   safety reasons, the Device Control system will check the "Device ID"
   sent by the device against the list of allowed devices:

   -  if the device/user couple is in the "allowed" list the
      synchronization will continue.

   -  if the device/user couple is not in the device list but device is in
      the "allowed" list the synchronization will continue.

   -  if the device is not in the “allowed” list the synchronization will
      be paused, a dummy email notifying the user of its "Quarantine"
      status will be sent and the connection will be set to "Quarantine"
      status.

   Administrators can be notified at regular intervals, and every
   notification email will only include new Quarantined devices. They will
   then be able to allow or deny the synchronization for each device using
   the appropriate CLI tools.


Strict
   After authenticating the user and checking their account status for
   safety reasons, the Device Control system will check the "Device ID"
   sent by the device against the list of allowed devices:

   - if the device/user couple or the device by itself is in the
     "allowed" list the synchronization will continue.

   - if the device is not in the “allowed” list the synchronization
     will be put in "Blocked" state, no data will be synchronized and
     a dummy email notifying the user of the device’s "Blocked" status
     will be sent.

Disabled
   ABQ is disabled, no checks are triggered and no policies are enforced.

.. _mobile_abq_mode_control:

ABQ Mode Control
~~~~~~~~~~~~~~~~

The current mode can be checked by running the following command::

   zxsuite config global get attribute abqMode

The ABQ mode can be changed running the following command::

   zxsuite config global set attribute abqMode value [Permissive|Interactive|Strict|Disabled]

.. _mobile_dummy_data:

Dummy data
~~~~~~~~~~

The feature makes use of “Dummy emails” and a “Dummy mailbox” to put
devices on hold while waiting for authorization (Interactive Mode) or to
notify their “Blocked” status (Permissive Mode, Interactive Mode and
Strict Mode).

The Dummy Mailbox is a virtual mailbox consisting of only an “Inbox”
folder that will be synchronized to the device while this is in either
Quarantine or Block status. Dummy Emails are predefined email messages
that are synchronized to a device in Quarantine or Block status to alert
the user. For now these messages aren’t customizable, and will be
localized in the future. Whenever the ABQ status of a device is changed,
the device’s sync state will be reset.

This was designed to make sure the user knows what’s happening, the
alternative being forcing the synchronization to fail with no
descriptive response for the user itself – which would likely cause a
significant overhead on support calls.

.. _mobile_custom_abq_emails:

Custom ABQ emails
~~~~~~~~~~~~~~~~~

Quarantine and block dummy emails can be customized by using the
:command:`zxsuite mobile setABQMessage` message command; messages can
be customised at global or domain level, and multiple languages can be
set.

.. card:: Setup Example

   Given two files, :file:`/tmp/quarantine_body.txt` and
   :file:`/tmp/quarantine_body.html` containing the French language
   plaintext and html message bodies and the support@example.com
   support email address, the following command will set the
   quarantine message for the `example.com` domain without affecting
   other domains or users::

     zxsuite mobile setABQMessage domain example.com quarantined fr from support@example.com body_plain_file /tmp/quarantine_body.txt body_html_file /tmp/quarantine_body.html``

   .. warning:: Before being able to customize the ABQ messages, a
      default must be set using **default** as the language in the
      command, e.g., :command:`zxsuite mobile setABQMessage global
      quarantined default`

.. _mobile_notifications:

Notifications
~~~~~~~~~~~~~

Administrators can be notified via email of quarantined devices at a
specific interval defined by the ``abqNotificationsInterval``
configuration attribute, expressed in milliseconds:

The interval can be checked by running the following command::

   zxsuite config global get attribute abqNotificationsInterval

The interval can be changed running the following command::

   zxsuite config global set attribute abqNotificationsInterval value [delay in milliseconds]

By default, the ``abqNotificationsInterval`` is set to 0 - meaning that
no notifications will be delivered.

.. _mobile_abq_service_status:

ABQ Service Status
++++++++++++++++++

The ABQ service status can be checked running the following command:

::

   zxsuite mobile getServices

The service can be stopped or started using the default service control
of the Mobile module:

::

   zxsuite mobile doStartService abq
   zxsuite mobile doStopService abq

When mode is Disabled ABQ service won’t automatically start and devices
are always allowed to sync.

.. _mobile_abq_cli:

ABQ CLI
~~~~~~~

The ABQ has its own set of CLI commands, including three `Rule
commands` (namely ``deleteRule``, ``listRules``, and
``setRule``). They share the same syntax of their ``delete``,
``list``, and ``set`` counterparts, with the difference that the `Rule
commands` accept regular expressions, which must comply with the `Java
regex patterns
<https://www.oracle.com/technical-resources/articles/java/regex.html>`_
standard (ERE with doubled backslashes).

``allow`` A specific command for quarantined device, and sets device
   status to Allowed.

``block``
   A specific command for quarantined device, and sets device status
   to Blocked.

``delete`` and ``deleteRule``
   Delete a device from all lists.

``import``
   This command imports a list of device ids from a file, and always
   requires two parameters: an Input File with a list of Device IDs
   separated by a newline and the "status" the imported device(s) will
   be set to.

   Given file :file:`/tmp/list` with content::

     androidc133785981
     androidc1024711770
     SAMSUNG1239862958/user@example.com,

   the command::

      zxsuite mobile abq import /tmp/list Allowed

   allows devices **androidc133785981** and **androidc1024711770** to
   sync entirely regardless of the account, while device
   **SAMSUNG1239862958** can only synchronise the `user@example.com`
   account

``list`` and ``listRules``
   List all devices ABQ status. The "status" argument will filter the
   list in order to only show devices in that specific status.

   Sample output::

     devices
            device_id   androidc133785981
            status      Quarantined

            device_id   androidc1024711770
            status      Blocked

            device_id   SAMSUNG1239862958
            status      Allowed

``set`` and ``setRule``
   Set any status for any single device (either known or unknown).

``setNotificationInterval``
   Set the notification interval for new quarantined devices.


.. seealso:: Community Article

   https://community.zextras.com/zextras-suite-3-1-8-added-features-to-abq/

   An in-depth article about the ``setRule``, ``deleteRule``,
   ``listRules`` commands, including an important section about the
   order of evaluation or Regular Expressions.

.. _zextras_mobile_cli:

Zextras Mobile CLI
==================


This section contains the index of all ``zxsuite mobile``
commands. Full reference can be found in the dedicated section
:ref:`zextras_mobile_full_cli`.

:ref:`ABQ allow <zxsuite_mobile_ABQ_allow>`
:octicon:`dash` :ref:`ABQ block <zxsuite_mobile_ABQ_block>`
:octicon:`dash` :ref:`ABQ delete <zxsuite_mobile_ABQ_delete>`
:octicon:`dash` :ref:`ABQ deleteRule <zxsuite_mobile_ABQ_deleteRule>`
:octicon:`dash` :ref:`ABQ import <zxsuite_mobile_ABQ_import>`
:octicon:`dash` :ref:`ABQ list <zxsuite_mobile_ABQ_list>`
:octicon:`dash` :ref:`ABQ listRules <zxsuite_mobile_ABQ_listRules>`
:octicon:`dash` :ref:`ABQ set <zxsuite_mobile_ABQ_set>`
:octicon:`dash` :ref:`ABQ setNotificationInterval <zxsuite_mobile_ABQ_setNotificationInterval>`
:octicon:`dash` :ref:`ABQ setRule <zxsuite_mobile_ABQ_setRule>`
:octicon:`dash` :ref:`addressBook add domain <zxsuite_mobile_addressBook_add_domain>`
:octicon:`dash` :ref:`addressBook add global <zxsuite_mobile_addressBook_add_global>`
:octicon:`dash` :ref:`addressBook list domain <zxsuite_mobile_addressBook_list_domain>`
:octicon:`dash` :ref:`addressBook list global <zxsuite_mobile_addressBook_list_global>`
:octicon:`dash` :ref:`addressBook remove domain <zxsuite_mobile_addressBook_remove_domain>`
:octicon:`dash` :ref:`addressBook remove global <zxsuite_mobile_addressBook_remove_global>`
:octicon:`dash` :ref:`deleteABQMessage domain <zxsuite_mobile_deleteABQMessage_domain>`
:octicon:`dash` :ref:`deleteABQMessage global <zxsuite_mobile_deleteABQMessage_global>`
:octicon:`dash` :ref:`doAddAccountLogger <zxsuite_mobile_doAddAccountLogger>`
:octicon:`dash` :ref:`doAddEASFilter <zxsuite_mobile_doAddEASFilter>`
:octicon:`dash` :ref:`doDeleteEASFilter <zxsuite_mobile_doDeleteEASFilter>`
:octicon:`dash` :ref:`doMoveEASFilter <zxsuite_mobile_doMoveEASFilter>`
:octicon:`dash` :ref:`doRemoveDevice <zxsuite_mobile_doRemoveDevice>`
:octicon:`dash` :ref:`doRemoveLogger <zxsuite_mobile_doRemoveLogger>`
:octicon:`dash` :ref:`doResetAccount <zxsuite_mobile_doResetAccount>`
:octicon:`dash` :ref:`doResetDevice <zxsuite_mobile_doResetDevice>`
:octicon:`dash` :ref:`doRestartService <zxsuite_mobile_doRestartService>`
:octicon:`dash` :ref:`doResumeDeviceSync <zxsuite_mobile_doResumeDeviceSync>`
:octicon:`dash` :ref:`doSimulateSync <zxsuite_mobile_doSimulateSync>`
:octicon:`dash` :ref:`doStartService <zxsuite_mobile_doStartService>`
:octicon:`dash` :ref:`doStopService <zxsuite_mobile_doStopService>`
:octicon:`dash` :ref:`doSuspendDeviceSync <zxsuite_mobile_doSuspendDeviceSync>`
:octicon:`dash` :ref:`doWipeDevice <zxsuite_mobile_doWipeDevice>`
:octicon:`dash` :ref:`duplicateABQMessage domain <zxsuite_mobile_duplicateABQMessage_domain>`
:octicon:`dash` :ref:`duplicateABQMessage global <zxsuite_mobile_duplicateABQMessage_global>`
:octicon:`dash` :ref:`getABQMessage domain <zxsuite_mobile_getABQMessage_domain>`
:octicon:`dash` :ref:`getABQMessage global <zxsuite_mobile_getABQMessage_global>`
:octicon:`dash` :ref:`getAccountLoggers <zxsuite_mobile_getAccountLoggers>`
:octicon:`dash` :ref:`getAllDevices <zxsuite_mobile_getAllDevices>`
:octicon:`dash` :ref:`getAllEASFilters <zxsuite_mobile_getAllEASFilters>`
:octicon:`dash` :ref:`getDeviceInfo <zxsuite_mobile_getDeviceInfo>`
:octicon:`dash` :ref:`getDeviceList <zxsuite_mobile_getDeviceList>`
:octicon:`dash` :ref:`getProperty <zxsuite_mobile_getProperty>`
:octicon:`dash` :ref:`getProvisioning <zxsuite_mobile_getProvisioning>`
:octicon:`dash` :ref:`getServices <zxsuite_mobile_getServices>`
:octicon:`dash` :ref:`initABQMessage <zxsuite_mobile_initABQMessage>`
:octicon:`dash` :ref:`setABQMessage domain <zxsuite_mobile_setABQMessage_domain>`
:octicon:`dash` :ref:`setABQMessage global <zxsuite_mobile_setABQMessage_global>`
:octicon:`dash` :ref:`setProperty <zxsuite_mobile_setProperty>`
:octicon:`dash` :ref:`setProvisioning <zxsuite_mobile_setProvisioning>`
:octicon:`dash` :ref:`setSharedFolderSync <zxsuite_mobile_setSharedFolderSync>`
