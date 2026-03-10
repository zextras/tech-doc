Release 26.3.0
===============

.. contents::
   :local:
   :depth: 1
   :backlinks: none

New Features & Major Changes
----------------------------

Security & Authentication
~~~~~~~~~~~~~~~~~~~~~~~~~

Guided 2FA Enrollment Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^

In Carbonio 26.3.0, the Two-Factor Authentication (2FA) system has been enhanced
to support flexible enrollment and activation.

Administrators can now enforce OTP setup for users who have 2FA enabled but
have not yet configured an OTP, ensuring consistent security policies without
risking mass user lockouts. The backend now exposes a flag indicating when OTP
setup is required, enabling the frontend to prompt users accordingly.

The Admin UI has also been updated to clarify management options, changing the
label from *“One Time Password management”* to *“Allow users to configure 2FA.”*

These changes introduce per-account 2FA requirements, improved setup validation,
and enhanced recovery mechanisms while maintaining backward compatibility with
existing configurations.

Tracking code: CO-2783, CO-3131, CO-3127, CO-3128, CO-3129, ZIF-1556, ZIF-1386, CO-3183


SAML for Admin Login
^^^^^^^^^^^^^^^^^^^^

The admin login page now supports SAML authentication.

The SAML workflow for the Admin Console uses a new LDAP attribute
``adminConsolePublicUrl`` provided via the configuration endpoint to determine
the correct redirect URL after authentication.

After a successful SAML login, all relevant session cookies
(``ZM_AUTH_TOKEN``, ``ZX_AUTH_TOKEN``, ``ZM_ADMIN_AUTH_TOKEN``) are correctly
set for both the web and admin interfaces.

Tracking code: CO-2610, CO-2611, CO-2318


Domain Admin – Manage 2FA Trusted IPs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Domain administrators can now view and manage **2FA Trusted IP lists** for their
domain directly from the Admin UI.

Previously, this capability was available only to global administrators.
A new right, ``manageTwoFactorAuthPolicies``, enables this functionality.

.. note::

   After upgrading, it is necessary to re-initialize domain delegation to apply
   the new permission.

Tracking code: CO-2799, HIT-130


Mail
~~~~

Archive System Folder and Action
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A new **Archive** system folder has been introduced.

The folder behaves similarly to other system folders (Inbox, Sent, Drafts,
Junk) and cannot be renamed or deleted.

An **Archive** action is now available in the context menu for both single and
multiple email selections. When triggered, items are immediately moved to the
Archive folder. The folder displays a badge showing the unread count when
applicable.

Multi-selection mode also includes an Archive button in the mail list header.

.. warning::

   The feature is automatically enabled for all users except those who already
   have a custom folder named ``Archive``. In this case, administrators must
   rename the existing folder and reload the mailbox.

Tracking code: CO-2786, ZIF-1441, CF-1151


Distribution List "Send As" and "Send on Behalf Of"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Users and distribution list (DL) members can now send emails **as** or
**on behalf of** a distribution list when the appropriate rights are granted.

Key capabilities include:

* DL addresses appear directly in the **From** dropdown in the composer
* No manual CLI identity creation is required
* Revoking permissions automatically removes the DL identity
* Supported in both Webmail and the Mobile App
* All operations are logged for auditing purposes

The system validates permissions at send time and records the originating user.

Tracking code: CO-2787, CF-752, CF-490, ZIF-602, CF-1531, CO-3233, CO-3221, CO-3182, CO-3167


Include Original Attachments on Reply
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Users can optionally include original attachments when replying to emails.

Tracking code: CO-2784, IRIS-3662, ZIF-723, CO-1261, ZIF-1169, CO-2692, CF-902


Default Read Receipt Setting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A new WebUI preference allows users to define the default behavior for the
**read receipt** flag on outgoing messages.

Users can choose to always request read receipts by default, while still being
able to override the option for individual emails.

Tracking code: CO-2848, HIT-259, CO-1982, CO-2579


Unread Notification Badges at Account Level
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Unread notification badges are now displayed at the **account/root level**
in the mail sidebar.

The badge aggregates unread counts across all subfolders, allowing users to
quickly see the total number of unread messages without expanding the folder
structure.

Tracking code: CO-2106, CO-1983, ZTD-1046, CF-964, CF-1228


Calendar
~~~~~~~~

Custom Repeat Dialog Redesign
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The custom recurrence dialog has been redesigned with improved usability:

* clearer layout
* toggle buttons for weekday selection
* smarter default values
* dedicated **Cancel** and **Set** buttons

.. note::

   The current implementation does not yet support the option
   *“every working day”*.

Tracking code: CO-3157, CO-2287


Chat & Meetings
~~~~~~~~~~~~~~~

Pin Messages
^^^^^^^^^^^^

Users can pin one message per chat conversation, keeping important information
visible at the top of the discussion. Moderation rules apply to group chats.

Tracking code: CO-2587


Manual Chat History Export and Clear for Virtual Rooms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Moderators of virtual meeting rooms can now:

* export chat history in plain text
* clear all messages and attachments in a room

This functionality allows moderators to reuse virtual rooms while maintaining
privacy between sessions.

Tracking code: CO-2416, WSC-1867


Video Pinning on iOS
^^^^^^^^^^^^^^^^^^^^

Participants in video calls can now pin a video tile on iOS devices.

Tracking code: CO-2890


Files & Storage
~~~~~~~~~~~~~~~

Bulk Removal of Collaborators
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Users can now remove multiple collaborators from shared documents in a single
operation.

Tracking code: CO-2829


Clickable File Notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Notifications generated by the Files module are now interactive and allow
direct navigation to the related file or folder.

Tracking code: CO-2810


Admin & Licensing
~~~~~~~~~~~~~~~~~

Perpetual License Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Carbonio now supports **perpetual license management with version compliance
checks**.

If the installed Carbonio version exceeds the maximum supported version of the
license, the backend blocks activation. The Admin UI displays warning or error
messages for:

* maintenance expiration
* version compatibility

Email notifications are also generated for maintenance warnings and expiry.

Tracking code: CO-2460, CO-2922, CO-2923, CO-2924, EI-13, CO-3017


Infrastructure
~~~~~~~~~~~~~~

Systemd: tmpfiles.d and sysusers.d Adoption
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

User and directory management now uses systemd mechanisms:

* ``tmpfiles.d``
* ``sysusers.d``

This replaces legacy post-install scripts and ``zmfixperms``.

.. warning::

   ``zmfixperms`` is no longer used. Administrators should review systemd
   configuration accordingly.

Tracking code: CO-2524, IN-754, GB-889, GB-890, HIT-31


Automated Database Migrations (Flyway)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Database migrations for several services are now automatically managed
through **Flyway**, eliminating the need for manual intervention and the
``postgres-client`` package.

Tracking code: CO-2404, CO-2788, CO-2792, WSC-1769


Videorecorder Refactor (Quarkus)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``carbonio-videorecorder`` service has been refactored to use the
**Quarkus** framework.

Benefits include:

* faster startup times
* reduced memory usage
* improved configuration management

Key improvements include database-backed metadata, REST APIs for job
management, automatic retry for failed jobs, dynamic video layouts, and a
configurable retention policy.

.. warning::

   A new package and bootstrap command are required:
   ``carbonio-videorecorder-db``.

Tracking code: CO-2398, WSC-1994, ZCT-1670, QA-903


Improvements & Enhancements
---------------------------

Mail UI & Composer
~~~~~~~~~~~~~~~~~~

Draft Management Redesign
^^^^^^^^^^^^^^^^^^^^^^^^^

Drafts are now automatically saved without confirmation dialogs.

A footer in the composer shows the save status, and a delete button is
available directly in the editor. Empty drafts are not stored unless manually
requested.

Tracking code: CO-2865, CO-3142, CO-3048, CO-3035


Responsive Header and Action Buttons
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The mail header now adapts to available space, improving display of recipients,
tags, and quick actions across all modules.

Tracking code: CO-2278, CO-2114, CO-2927, CO-3187


Recipient and Conversation Display
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The logic for displaying senders and recipients in mail lists and
conversations has been improved for greater clarity.

Tracking code: CO-2300, HIT-320, ZIF-450


Composer Toolbar Compatibility Improvements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The mail composer toolbar now uses only email-client-compatible HTML
elements. HTML5 semantic elements and unused plugins have been removed.

Tracking code: CO-2934, CO-2935, CO-2710, CO-2752


Mail Filter Dropdown: Explicit “All” Default
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The filter dropdown now includes an explicit **All** option to reset filters
independently from sorting.

Tracking code: CO-2871


Folder Selection Modal Improvements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Folder selection dialogs across modules now include a chevron navigation icon
and improved selection logic.

Tracking code: CO-2936, GB-862


Empty Folder Confirmation
^^^^^^^^^^^^^^^^^^^^^^^^^

The **Wipe Folder** action has been renamed to **Empty Folder**, with improved
confirmation dialogs to prevent accidental data loss.

Tracking code: CO-2800, HIT-47


Bug Fixes
---------

Mail
~~~~

Scheduled Email Editing Infinite Loop
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where editing a scheduled email in the Drafts folder caused
an infinite loading loop.

Tracking code: CO-3026, HIT-283


Draft Save Loop in Plain Text Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resolved a loop that repeatedly saved drafts when editing emails in plain
text mode.

Tracking code: CO-3048, CO-2865


Inline Attachments Lost on Draft Refresh
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Inline attachments are now preserved when refreshing draft messages.

Tracking code: CO-2981, CO-3116


Apple Mail Attachments Display
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where attachments from Apple Mail were not correctly shown
in the webmail message preview.

Tracking code: CO-2796, HIT-256


Composer Toolbar Covering Reply Area
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resolved a bug where the composer toolbar could overlap the reply area when
replying to long emails.

Tracking code: CO-3028, GB-864, GB-857, GB-798

Fix Sort Filter Logic for Delegated Accounts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where applying the same sort filter to the same folder ID
across multiple delegated and personal accounts could break the
``zimbraPrefSortOrder`` logic.

The update ensures correct replacement of sort order values, preventing
inconsistent sorting behavior.

Tracking code: CO-2952, HIT-349


Headings Font Size in Composer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where headings in the mail composer did not retain their
configured font size.

Tracking code: CO-2752, CO-1483, CO-1157, CO-2935


Conversation List: Real-Time Update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed a bug in conversation mode where the conversation list was not updated
correctly when new emails arrived, resulting in incorrect date ordering.

Tracking code: CO-2805, CO-3022


Draft Auto-Save on Styling Change
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Styling changes (for example text color) in the mail editor now trigger
automatic saving of drafts.

Tracking code: CO-3142, CO-2865


Email Content Partially Lost on Send
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where part of the email body content could be lost when
sending messages.

Tracking code: CO-3078, CO-3116, QA-893


Message Read/Unread Status Display
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resolved an issue where message flags were not correctly set in the message
view, causing incorrect display of the read/unread status and preventing
users from toggling the status as expected.

Tracking code: CO-3135


Editor Refresh on Single-Message Reply
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed the editor refresh behavior when replying to a conversation containing
a single message.

Tracking code: CO-3114, HIT-405, CO-2849


Settings Select – Default/Empty Option
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Improved handling of invalid values in language and dark mode settings.

If an invalid value is detected, the select component now displays
``Invalid option`` and defaults to:

* ``english`` for language
* ``auto`` for dark mode

This ensures UI and server values remain aligned.

Tracking code: CO-2365, SHELL-181, SHELL-161


Mark as Read Preference Ignored in Read-Receipt Dialog
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where declining a read-receipt request (*Do not notify*)
incorrectly marked the message as read when the
**Mark as read manually** preference was enabled.

The read-receipt dialog now respects the preference and keeps the message
unread unless the user explicitly marks it as read.

Tracking code: QA-918, QA-857, CO-3219


Calendar
~~~~~~~~


Calendar Invitation: External Images
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Calendar invitation previews in Mails now correctly display external images
embedded in the original description.

Tracking code: CO-2671


Attendee Label Persistence
^^^^^^^^^^^^^^^^^^^^^^^^^^

Attendee display names are now preserved after UI refresh or editor closure.

Tracking code: CO-1752


Propose New Time for External Organizers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed the inability to propose a new time for appointments organized by
external domains.

Tracking code: CO-2801, HIT-27


Organizer Cannot Decline Proposed New Time
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resolved an issue where organizers could not decline proposed new times for
calendar invitations.

Tracking code: CO-3024, HIT-350


Meeting Invitation Response Change from Calendar
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where users could not change their meeting response from the
calendar after responding via email.

Tracking code: CO-3056, HIT-351


Unwanted Characters in Invitation Emails
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Removed unwanted characters appearing in calendar invitation emails after
acceptance.

Tracking code: CO-2920, CF-1580, ZIF-1579


Contacts
~~~~~~~~


Middle Name Field Removed
^^^^^^^^^^^^^^^^^^^^^^^^^

The **Middle Name** field has been removed from Contacts in both edit and view
screens to maintain consistency.

Tracking code: CO-3030, CO-1464, CO-3133


Contact Creation and Tabs Missing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixed an issue where new contacts could not be created and tabs were missing
in the Contacts module.

Tracking code: CO-2891, GB-797, GB-798, GB-855