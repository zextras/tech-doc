.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

==========
 |mobile|
==========

This section describe the various settings that can be changed to
allow access to |product| features from mobile devices. They are
currently available from the CLI only, so you need console access to
change the settings.

This section describes the most common tasks and introduces the
commands and most used sub-commands needed for the management of all
functionalities available to mobile devices.

.. _enable_carbonio_mobile_synchronization_for_a_cos:

Enable |mobile| Synchronization for a COS
=========================================

Use the following commands to enable or disable the COS-level
settings. However, remember that these settings can be overridden by
each user.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::
      :columns: 6

      Enable |mobile| at COS-level
      ^^^^^

      To enable |mobile| for all users in a COS from the CLI, run the
      command:

      .. code:: console

         zmprov mc COSName zimbraFeatureMobileSyncEnabled TRUE

   .. grid-item-card::
      :columns: 6

      Disable |mobile| at COS-level
      ^^^^^

      To disable |mobile| for all users in a COS from the CLI, run the
      command:

      .. code:: console

         zmprov mc COSName zimbraFeatureMobileSyncEnabled FALSE

.. _enable_carbonio_mobile_for_a_single_user:

Enable |mobile| for a Single User
=======================================

By enabling the |mobile| Module for a single user you authorise a
single user to use all the mobile functions of the |mobile|
Module.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::
      :columns: 6

      Enable |mobile|
      ^^^^^

      To enable |mobile| for a given user (e.g., `user@example.com`) in a COS
      from the CLI, run the command:

      .. code:: console

         zmprov ma user@example.com zimbraFeatureMobileSyncEnabled TRUE

   .. grid-item-card::
      :columns: 6

      Disable |mobile|
      ^^^^^

      To disable |mobile| for a given user john@example.com in a COS
      from the CLI, run the command:

      .. code:: console

         zmprov ma user@example.com zimbraFeatureMobileSyncEnabled FALSE

.. _mobile-password:

The Mobile Password Feature
===========================

The *Mobile Password* feature allows Global and Delegated Admins to
set an additional password for an account to be used for Exchange
ActiveSync authentications only.

The main benefits of using this feature are:

- Enforce **set-and-forget** safe passwords, regardless of any other
  password policy. In this way, in case the account password changes,
  tthere will be no need to change the password saved on all mobile
  devices synchronised with an account.

- Avoid to disclose the *real* password in case of unauthorised access
  to the device/client

A ``Mobile Password`` will not be valid for Webmail/POP3/IMAP/SMTP
logins, and the account password will not be valid for mobile logins.

.. _how_to_set_a_mobile_password_for_a_mailbox:

How to Set a Mobile Password for a Mailbox
------------------------------------------

Mobile Passwords are handled by the |auth| module, so please refer to
section :ref:`auth_create_new_credentials_qr_code` for more
information.

.. commenting out according to requests.
   
   .. _mobile_provisioning:

   Mobile Device Management (Mobile Provisioning)
   ==============================================

   Mobile Device Management (MDM - also known as `Mobile Provisioning`)
   allows an administrator to define a set of rules and security settings
   that are applied to one or more mobile devices, ranging from PIN
   policies to Allowed/Blocked app lists and including `one time`
   commands, such as the remote wipe of the entire device.

   MDM effectively allows administrators to limit and restrict the use of
   corporate mobile devices to avoid risky or improper behaviours.

   MDM is also a priceless aid for :abbr:`BYOD (Bring Your Own Device)`
   corporate policies, allowing users to connect their personal mobile
   devices to the corporate servers, while reducing the risk of security
   breaches to a minimum.

   .. _mobile_provisioning_features_available_on_your_client:

   Provisioning Features Available on Your Client
   ----------------------------------------------

   Not all provisioning features are available on all clients. Please refer
   to your device’s manufacturer and online resources for specific
   information about the MDM features supported by the device itself.

   .. this whole section seems not to be available in Carbonio.

   .. _carbonio_mdm:

   |carbonio| and MDM
   ------------------

   |carbonio| features advanced MDM features through the Exchange
   ActiveSync protocol version 14+.

   Mobile policies can be enabled at COS and mailbox levels, allowing both
   a quick ``one for many`` setup and user-based customized management. In
   both cases, Mobile Management Options are available in the `Mobile`
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

   .. hint:: By default, MDM is disabled in |mobile|. To enable
      navigate to :menuselection:`Zextras Suite --> Mobile --> Advanced
      Settings` and check the ``Enable Mobile Device Management`` option

   .. _mobile_enforceable_policies:

   Enforceable Policies
   ~~~~~~~~~~~~~~~~~~~~

   Enforceable Policies can be set from the CLI to limit some of the
   functionality of the devices connected via MDM. By using the following
   command, you can see all the available policies for a COS:

   .. code:: console

      # carbonio mobile getProvisioning cos default

   or for a user:

   .. code:: console

      # carbonio mobile getProvisioning account john@example.com

   All the listed properties can then be modified using :command:`zxsuite
   mobile setProvisioning`, for example:

   .. code:: console

      # carbonio mobile setProvisioning  account john@example.com AllowDesktopSync true

   The properties can be roughly grouped in these categories:

   - Sync Settings: Set synchronization spans and limits

   - Device Settings: Enable or disable device features such as camera,
     WiFi, removable storage or Bluetooth

   - Device Security Settings: Force an unlock code and define the
     minimum requirements for the code itself

   - Device Applications: Enable or disable `standard` device
     applications such as the Browser and POP/IMAP client or unsigned
     apps

   Moreover, two lists are also available for application
   whitelist/blacklist management:

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

.. _carbonio_mobile_and_the_syncstate:

|mobile| and the SyncState
--------------------------

The SyncState (short for Synchronization Status) is a set of information
kept on the server about the synchronization with a mobile device. Each
time a device establishes a connection with |mobile|, the
following steps take place:

#. The device requests a `folderSync` operation to synchronize the
   local Folders with the ones on the server

   :octicon:`arrow-right` One SyncKey per local folder is sent, but if
   this is the first connection between the device and the server, a
   single SyncKey set to **0** is sent

#. The server replies with a list of available folders

   :octicon:`arrow-right` One SyncKey per folder is sent by the server

#. The device requests an `itemSync` operation to synchronize all due
   items

   :octicon:`arrow-right` The server stores the items synchronized in
   the SyncState

#. After completing the `itemSync` operation, the device sends a
   ``ping`` to keep the connection alive

   :octicon:`arrow-right` Step 4 is repeated as long as no changes
   happen to the synchronised account

Every time a new item is stored on the mailbox or an old item is
modified, the server notifies the availability to the device, which
closes the active connection (the one kept alive by the ping command)
and repeats steps 3 and 4.

.. last sentence not clear

The SyncState is the combination of the SyncKeys saved on step 2 and the
`itemID`\s saved on step 3. It is saved by the server per the
userID/deviceID unique pair.

.. _mobile_sync_request:

Sync Request
~~~~~~~~~~~~

The Sync Request is the actual synchronization process, started by
either |mobile| or by the client. During a sync request, any
change in the mailbox that happened since the last request is
synchronized to the device and vice-versa.

A sync request is issued when:

- The SyncState changes

- A sync is forced client-side

- The current ``ping`` expires and a new one is sent by the
  device (the keepalive duration is defined by the client)

.. _mobile_managing_the_syncstates:

Managing the SyncStates
-----------------------

To manage the SyncStates of synchronised mobile devices
use any of the following commands from the CLI:

.. grid:: 1 1 2 3
   :gutter: 3

   .. grid-item-card::
      :columns: 4

      The ``doRemoveDevice`` command
      ^^^^^

      Syntax::

        zxsuite mobile doRemoveDevice {account} {device_id}

      Usage example:

      ``zxsuite mobile doRemoveDevice john@example.com Appl79032X2WA4S``

      Removes John's Appl79032X2WA4S device SyncState

   .. grid-item-card::
      :columns: 4

      The ``doResetDevice`` command
      ^^^^^

      Syntax::

        zxsuite mobile doResetDevice {account} [attr1 value1 [attr2 value2...

      Usage example:

      ``zxsuite mobile doResetDevice john@example.com Appl79032X2WA4S``

      Resets John's Appl79032X2WA4S device SyncState

   .. grid-item-card::
      :columns: 4

      The ``doResetAccount`` command
      ^^^^^^

      Syntax::

        zxsuite mobile doResetAccount {account}

      Usage example:

      ``zxsuite mobile doResetAccount john@example.com``

      Resets all the device states for John's account


.. _mobile_advanced_settings:

Advanced Settings
=================

.. _carbonio_mobile_dos_filter:

|mobile| DoS Filter
-------------------

|mobile| includes a dedicated DoS Filter component to improve both
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

The Mobile DoS Filter is entirely configured at global level via CLI,
with command :command:`zxsuite config global set|get|clear`. Specific
info for each property can be obtained via :command:`zxsuite config
info attribute [name]`, where `[name]` is one of the following:

-  ``mobileAntiDosServiceEnabled``: enable the Mobile DoS Filter
   service. Default ``false``;

-  ``mobileAntiDosServiceJailDuration``: duration (in milliseconds) of
   synchronization "jail". Default **600000**;

-  ``mobileAntiDosServiceTimeWindow`` interval of time to calculate the
   connection ratio. The jail is triggered if a device sends more than
   ``mobileAntiDosServiceMaxRequests`` requests in this time window.
   Default **30000ms**;

-  ``mobileAntiDosServiceMaxRequests`` maximum number of requests
   received within ``mobileAntiDosServiceTimeWindow`` milliseconds).
   Default **150**;

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

.. _carbonio_autodiscover:

.. _carbonio_mobile_performance_tuning:

|mobile| Performance Tuning
---------------------------

|mobile| provides three useful options to fine-tune |mobile|
according to system performance.

.. grid:: 1 1 2 3
   :gutter: 3

   .. grid-item-card::
      :columns: 4

      Notifications Latency
      ^^^^

      ``ZxMobile_NotificationsLatency`` represents The seconds of
      delay between an event on the server and its notification to the
      mobile device.

   .. grid-item-card::
      :columns: 4

      Use Instant Notifications
      ^^^^

      ``ZxMobile_UseInstantNotficiations`` enables or disables instant
      notifications. If **true**, it also overrides ``Notifications
      Latency``.

   .. grid-item-card::
      :columns: 4

      Max Ping Heartbeat
      ^^^^

      ``ZxMobile_MaxPingHeartbeat`` defines the maximum interval
      between :command:`ping` commands.

All settings can be edited via CLI using the ``zxsuite config``
command :command:`zxsuite config`.

.. _mobile_when_to_edit_the_performance_tuning_settings:

When to Edit the Performance Tuning Settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Default settings should be optimal for most situations. However, in
case you experience one or more of the problems listed below, please
apply the suggested solution.

.. csv-table::
   :header: "Problem", "Suggested solution"

   "High system load", "Disable instant notifications"
   "High system load after disabling instant notifications", "Raise
   notification latency"
   "Mobile users experience high network usage", "Disable instant
   notifications and tweak notifications latency"
   "Devices can connect but sessions are interrupted frequently",
   "Adjust Max Ping Heartbeat according to your network configuration"
   "Items are synchronized from server-to-device with an excessive
   delay", "Lower notification latency or enable instant
   notifications"

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

.. grid:: 1 1 2 2 
   :gutter: 2

   .. grid-item-card::
      :columns: 12 12 12 6 

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
      :columns: 12 12 12 6 

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
      :columns: 12 12 12 6 

      doDeleteEASFilter
      ^^^^

      This command deletes an existing EAS Filter.

      Syntax::

        zxsuite mobile doDeleteEASFilter _id_

      Usage example::

        zxsuite mobile doDeleteEASFilter 2

      Removes the filter with id = 2.

   .. grid-item-card::
      :columns: 12 12 12 6 

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
entirety of a user’s EAS logs into a dedicated logfile, with a
different verbosity than the one of the :file:`sync.log` file. This
allows for quicker troubleshooting.

When creating an account logger, the following parameters must be
specified:

- The target **account**

- The **log_level**, i.e., the `verbosity` of the log

- The dedicated **log_file**

- The **window_size** to enforce on all devices synchronizing with the
  account while the logger is running

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

The "Allow/Block/Quarantine" feature allows for granular access control
of mobile devices connecting to the server. It’s a "pre-emptive" type of
security feature, meaning that it acts upon the first connection to the
server and it’s made to ensure that only authorized devices can finalize
synchronization with server. This allows a full administrator to keep
track of all mobile device used in their network. Presently only CLI
tools are provided.

The global Boolean attribute ``abq_enabled_at_startup`` controls
whether ABQ will start together with the |suite|. While by default the
attribute is **true**, it is suggested to set it to **false** if it
not used, because this would save server resources.

To disable the ABQ, execute the following command, then restart
``mailboxd``::

  zxsuite config set global abq_enabled_at_startup false

To verify that ABQ was disabled, in the output of :command:`zxsuite
mobile getServices`, ABQ should appear as **not running** (i.e., the
value for ABQ's *running*  property should be **false**).


.. _mobile_components:

Components
----------

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
         mobile devices previously recognized by the |carbonio| server will be
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
---------

The ABQ feature is triggered for every mobile device that tries to
synchronize with server, and can be set to one of four possible modes:
"Permissive", "Interactive", "Strict” and "Disabled". This attribute is
Global for all the cluster.

.. grid:: 1 1 2 2
   :gutter: 1

   .. grid-item-card:: Interactive
      :columns: 4
   
      After authenticating the user and checking their account status
      for safety reasons, the Device Control system will check the
      "Device ID" sent by the device against the list of allowed
      devices:

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


   .. grid-item-card:: Strict
      :columns: 4
      
      After authenticating the user and checking their account status for
      safety reasons, the Device Control system will check the "Device ID"
      sent by the device against the list of allowed devices:

      - if the device/user couple or the device by itself is in the
        "allowed" list the synchronization will continue.

      - if the device is not in the “allowed” list the synchronization
        will be put in "Blocked" state, no data will be synchronized and
        a dummy email notifying the user of the device’s "Blocked" status
        will be sent.

   .. grid-item-card::  Permissive
      :columns: 4

      The Authorization Engine is not active, so after authenticating
      the user and checking their account status for safety reasons,
      the synchronization will continue. It is still possible to block
      specific devices but non-blocked devices will always be allowed
      to sync.

      
   .. grid-item-card:: Disabled
      :columns: 12

      ABQ is disabled, no checks are triggered and no policies are
      enforced.

.. _mobile_abq_mode_control:

ABQ Mode Control
----------------

The current mode can be checked by running the following command::

   zxsuite config global get attribute abqMode

The ABQ mode can be changed running the following command::

   zxsuite config global set attribute abqMode value [Permissive|Interactive|Strict|Disabled]

.. _mobile_dummy_data:

Dummy data
----------

The feature makes use of *Dummy emails* and a *Dummy mailbox* to put
devices on hold while waiting for authorization (Interactive Mode) or to
notify their *Blocked* status (Permissive Mode, Interactive Mode and
Strict Mode).

The *Dummy Mailbox* is a virtual mailbox consisting of only an *Inbox*
folder that will be synchronized to the device while this is in either
Quarantine or Block status, while *Dummy Emails* are predefined email
messages that are synchronised to a device in Quarantine or Block
status to alert the user. Whenever the ABQ status of a device is
changed, the device’s sync state will be reset.

.. note:: Currently, *Dummy email* messages can not be customised.

Dummy data have been introduced to make sure the user knows what is
happening, since the alternative being forcing the synchronization to fail
with no descriptive response for the user itself – which would likely
cause a significant overhead on support calls.

.. _mobile_custom_abq_emails:

Custom ABQ emails
-----------------

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
-------------

Administrators can be notified via email of quarantined devices at a
specific interval defined by the ``abqNotificationsInterval``
configuration attribute, expressed in milliseconds:

The interval can be checked by running the following command::

   zxsuite config global get attribute abqNotificationsInterval

The interval can be changed running the following command::

   zxsuite config global set attribute abqNotificationsInterval value [delay in milliseconds]

By default, the ``abqNotificationsInterval`` is set to 0, meaning that
no notifications will be delivered.

.. _mobile_abq_service_status:

ABQ Service Status
~~~~~~~~~~~~~~~~~~

The ABQ service status can be checked running the following command::

   zxsuite mobile getServices

The service can be stopped or started using the default service control
of the Mobile module::

   zxsuite mobile doStartService abq
   zxsuite mobile doStopService abq

When mode is `Disabled`, the ABQ service does not automatically start,
hence devices are always allowed to sync.

.. _mobile_abq_cli:

ABQ CLI
-------

The ABQ has its own set of CLI commands, including three `Rule
commands` (namely ``deleteRule``, ``listRules``, and
``setRule``). They share the same syntax of their ``delete``,
``list``, and ``set`` counterparts, with the difference that the `Rule
commands` accept regular expressions, which must comply with the `Java
regex patterns
<https://www.oracle.com/technical-resources/articles/java/regex.html>`_
standard (ERE with doubled backslashes).

``allow``
   A specific command for quarantined device, and sets device
   status to Allowed.

``block``
   A specific command for quarantined device, and sets device status
   to Blocked.

``delete`` and ``deleteRule``
   Delete a device from all lists.

``import``
   This command imports a list of device IDs from a file, and always
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

