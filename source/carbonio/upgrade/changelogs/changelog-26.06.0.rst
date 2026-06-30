Release 26.6.0
===============



.. card:: Important Notes Before Upgrading

   - **MIGRATION REQUIRED — Unified Quota:** This release introduces a unified quota model. Each account now has a single total limit covering Mail, Files, and Chat together, stored on a new backend attribute. The resolution order is: (1) account-level override, if set, wins; (2) otherwise the COS limit applies; (3) otherwise the global default applies (currently none, which falls through to unlimited); (4) the domain limit, if set, acts as a cap on the resolved value — it can lower but never raise the effective quota. Because the new attribute is separate from the previous per-service quota fields, **existing configurations are not migrated automatically. Partners must run the provided migration script after upgrading.** Refer to the Partner Portal documentation for instructions and steps.
   - **EULA acceptance added to installation flow:** The Ansible playbook now includes an interactive EULA acceptance step. A non-interactive flag is available for automated/CI deployments. ``ZCT-1709``, ``ZCT-1865``
   - **2FA enforcement on legacy authentication endpoints:** The SOAP ``AuthRequest`` endpoint can no longer be used to bypass Two-Factor Authentication when 2FA is enabled. This enforcement applies automatically to both user and administrator authentication flows. Administrators should review any automation or legacy integrations that rely on direct ``AuthRequest`` calls and update them to handle the standard 2FA challenge flow. ``CO-3809``
   - **WSC package versions required for TURN reconnection fix:** To ensure webcam and screen-share streams recover correctly after temporary TURN server disconnections, upgrade to ``wsc-ui 0.16.3``, and ``wsc 1.11.0``. No additional configuration changes are required. ``CO-3707``
   - **Localhost entry in** ``/etc/hosts`` . Recommended check before upgrade. System administrators should verify that all mailbox servers include the standard ``127.0.0.1 localhost`` entry before upgrading. This avoids unexpected hostname-resolution behavior and helps guarantee correct ``zmconfigd`` startup. ``CO-3608``
   - **Command removed:** ``core getVersion``. The deprecated CLI command has been removed. Update any automation scripts that relied on it. ``CO-3512``
   - **Systemd replacement of** ``zmfixperms``. The migration introduced in 26.3 remains in effect. See 26.3 release notes for details. ``CO-3422``


Release Highlights
==================


#. **Unified Quota — Migration script required** This release introduces
   a unified quota model that tracks storage consumption across Mail,
   Files, and Chat under a single quota value per account. See the
   dedicated section below for the resolution logic, sysadmin actions,
   and CE implications.

#. **Flexible 2FA Enrollment with Grace Period** Administrators can now
   enforce OTP setup for users without triggering mass lockouts. A
   configurable grace period, a guided OTP Setup Wizard, and brute-force
   protection with cooldown periods are all included, covering both the
   user and admin login flows.

#. **External Calendar Subscriptions (ICS and CalDAV)** Users can
   subscribe to external read-only calendars with automatic sync, via
   both ICS URL and CalDAV protocol.

#. **Chat Media Gallery** A new Media Gallery tab in the conversation
   info panel shows all shared attachments grouped by month, with
   preview, navigation between files, filtering by sender, download, and
   deletion with confirmation.

#. **TURN Server for Video over Port 443** *(Beta — not yet officially
   supported)* A new ``carbonio-turn-server`` package enables TURN relay
   for video traffic over port 443, resolving connectivity issues in
   restricted network environments such as corporate firewalls. This
   feature is currently in beta and still under active development.

#. **Security Fixes — CVE and RCE** An XXE vulnerability in
   WS-Collaboration chat message forwarding and an unauthenticated RCE
   in ``carbonio-nginx`` (NGINX Rewrite Module) have been resolved.

#. **Ansible Installation Playbooks Unified** Single-server and
   multi-server Ansible playbooks have been merged. Multiple pre-flight
   validation checks have been added. Review your deployment scripts
   before upgrading.

#. **Stronger 2FA enforcement and Admin 2FA setup** The admin login page
   now supports a guided 2FA setup wizard for administrators accessing
   from untrusted networks. In addition, legacy direct SOAP
   authentication now strictly enforces 2FA policies and can no longer
   bypass second-factor verification. ``CO-2610``, ``CO-3809``

#. **Upgrade and service reliability fixes** Several upgrade and
   bootstrap issues have been resolved, including
   HA ``db-connectors`` installation logic, OpenLDAP bootstrap failures
   on read-only filesystems, misleading Memcached status reporting, and
   TURN media reconnection after temporary network
   interruptions. ``ZCT-1936``, ``CO-3594``, ``CO-3808``, ``CO-3707``


New Features
============


Unified Quota
--------------------

.. card:: Sysadmin action required

   Existing per-service quota values are **not** automatically migrated
   to the new model.
   Partners must run the provided migration script after upgrading.
   Without this step, all accounts will default to unlimited quota.
   Refer to the Partner Portal documentation for instructions and steps.

   This release replaces the previous per-service quota model with a single
   unified quota per account covering Mail, Files, and Chat storage
   combined. Quota enforcement is integrated across all storage-consuming
   modules (Mailbox, Files, Powerstore, Docs, WSC) and exposed consistently
   through updated UI components and a unified backend API.
   
   This feature is exclusive to Carbonio and represents a key differentiator from Carbonio
   CE.

**Resolution order:** When determining the effective quota for an
account, the system applies the following precedence:

#. **Account override** — if an explicit limit is set on the account, it
   wins.
#. **COS limit** — otherwise, the Class of Service limit applies, if
   set.
#. **Global default** — otherwise, the global default applies (currently
   none, which falls through to unlimited).
#. **Domain cap** — the domain limit, if set, acts as a ceiling on the
   resolved value. It can lower the effective quota but never raise it.
   The domain scope has no "unlimited" setting, because it is a cap, not
   an override.


Admin capabilities
------------------

-  View quota information per account directly in the Admin Console
   account settings page. ``CO-3162``
-  Edit quota value per account directly in the Admin Console account
   settings page. ``CO-3163``
-  Handle unlimited quota at COS level in the Admin Console. ``CO-3268``
-  Handle unlimited quota at account level in both Admin and User
   interfaces. ``CO-3202``
-  Configure domain-level quota constraints from the Admin UI.
   ``CO-3331``
-  Download a quota usage report for all accounts. ``CO-3477``
-  Activate the unified quota feature via feature flag at runtime,
   without service restart. ``CO-3447``
-  **Previous COS quota settings removed** in favour of the new unified
   quota attribute. ``CO-3478``
-  Hide the mailbox quota section under domain settings (superseded by
   the unified quota model). ``CO-3461``
-  Reset icon added to quota input fields, allowing quick revert to
   default. ``CO-3323``

 

Quota visibility — User and Admin UI
------------------------------------

-  View a compact quota total in the account summary panel. ``CO-2984``
-  View quota breakdown by module (Mail, Files, Docs, etc.) in user
   account settings. ``CO-3193``
-  Show quota information only for active/licensed modules. ``CO-3474``
-  Tooltips displayed on hover over individual segments of the quota
   bar. ``CO-3270``
-  Color coding on the compact quota component: warning and error states
   for over-threshold and over-quota accounts. ``CO-3225``
-  Warning/error icons for shared accounts in the compact quota
   component. ``CO-3322``
-  Shared accounts quota usage visible in the settings view. ``CO-3321``

 

Real-time quota updates
-----------------------

-  Quota data automatically refreshed after storage-consuming operations
   in the Files module. ``CO-3409``
-  Quota data automatically refreshed after storage-consuming operations
   in the WSC (Chats/Meetings) module. ``CO-3460``
-  Quota data updated in real time after any quota-impacting action
   anywhere in the UI. ``CO-3504``
-  Overquota/threshold warning banner displayed in the UI when limits
   are reached or approached. ``CO-3200``
-  Unified quota notification mechanism for over-threshold accounts,
   consolidating previous per-service alerts. ``CO-3550``
-  Error message displayed when any quota-related API call fails
   partially. ``CO-3515``

 

Backend and integrations
------------------------

-  Quota enforcement integrated with Powerstore for Files: operations
   that would exceed quota are now proactively rejected. ``CO-3324``
-  Quota enforcement integrated with Powerstore for WSC: attachment
   uploads are validated against available quota. ``CO-3325``
-  Quota integration for Docs-Connector: shared files count against the
   owner's quota. ``CO-3456``
-  Quota integration for Files ownership transfers: quota is
   recalculated when file ownership changes. ``CO-3455``
-  Overquota/underquota calculation centralized in a single backend
   service and exposed to all clients via a unified API. ``CO-3511``
-  Quota API response properties aligned across all ``getQuota``
   endpoints, ensuring consistent behavior for automation and
   monitoring. ``CO-3179``
-  Database queries for calculating usage and limits across multiple
   users have been optimized for performance at scale. ``CO-3519``
-  New admin CLI command to sync quota usage for inactive accounts,
   correcting counters that may drift in long-running or distributed
   environments. ``CO-3708``

 
Security & Authentication
-------------------------

Flexible 2FA Enrollment
-----------------------

This release completes the full 2FA enrollment and activation workflow
initiated in Q1.

Administrators can now enforce OTP setup for users without triggering
mass lockouts. When a user has 2FA enabled but has not yet configured an
OTP, the backend exposes a flag indicating that OTP setup is required.
The frontend then presents the OTP Setup Wizard, guiding the user
through enrollment. A configurable grace period allows users a defined
window to complete setup before access is blocked. Brute-force
protection adds cooldown periods after repeated failed OTP attempts,
applying to both the user and admin login flows. Admins can enable or
disable the OTP wizard on a per-account or per-COS basis.

``CO-2783``, ``CO-3085``, ``CO-3090``, ``CO-3091``, ``CO-3108``,
``CO-3315``, ``CO-3346``, ``CO-3377``, ``CO-3402``, ``CO-3545``,
``CO-3546``, ``CO-3562``, ``ZIF-1386``, ``ZIF-1556``


Calendar
--------

External Calendar Subscriptions (ICS and CalDAV)
------------------------------------------------

Users can now add external calendars in read-only mode with automatic
synchronization:

-  **ICS subscriptions:** Subscribe to any public or authenticated ICS
   URL; the calendar is kept in sync automatically.
-  **CalDAV subscriptions:** Add external CalDAV-compatible calendars.

``CO-2747``, ``CO-3093``
 

Chat & Meetings
---------------


Media and Document Gallery
---------------------------

A new Media Gallery tab has been added to the conversation info panel in
Carbonio Chats. All attachments shared in a conversation are listed and
grouped by month, with keyset pagination for performance. Key
capabilities:

-  Sub-tabs for "All attachments" and "My attachments" (files sent by
   the current user).
-  Each attachment shows metadata: file name, sender, and file size.
-  Inline preview with navigation between adjacent attachments.
-  Image thumbnails with lazy loading.
-  Single-file download button.
-  Single-file deletion with confirmation modal.

``CO-2410``, ``CO-2834``, ``CO-3536``, ``CO-3537``, ``CO-3538``,
``CO-3539``, ``CO-3540``, ``CO-3541``, ``CO-3581``, ``CO-3582``,
``CO-3583``

**iOS push notifications now show the sender name:** iOS push
notifications now display the sender's name directly in the notification
title, showing the group chat room name for multi-user conversations and
the individual contact name for one-to-one messages. The update is
delivered with Notification Push service version ``0.4.1`` and requires
no configuration changes. Administrators should verify that iOS client
devices are updated to a version compatible with the enriched
notification format. ``CO-3382``

 

**TURN Server for Video over Port 443**  - (Beta — not yet officially supported)
--------------------------------------------------------------------------------

.. card:: New package required: ``carbonio-turn-server``

   This feature is currently in beta and still under active development.
   It is not yet officially supported.
   Partners who wish to test it are welcome to do so, but it should not
   be deployed in production environments without prior alignment with
   Zextras.

   A new ``carbonio-turn-server`` package enables TURN relay for videotraffic over port 443.
   This resolves video connectivity issues
   encountered when end-users are behind corporate firewalls or restrictive
   proxies that block non-HTTP ports. ``CO-3097``


Admin & Licensing
-----------------
 

Edition Fields in Subscription (Admin UI + CLI)
------------------------------------------------

New edition fields are now exposed in the subscription management view
and via CLI, providing explicit visibility into which capabilities are
licensed for the current subscription.

``CO-3556``

Updated Subscription input field (Admin UI)
--------------------------------------------

The updated interface features automatic input focus and whitespace
trimming for pasted token.

``CO-3506``

Monitoring
----------

Installed Package Versions as Prometheus Metrics
-------------------------------------------------

Carbonio now collects the version of each installed Carbonio package on
each VM and exposes them as Prometheus metrics. This enables monitoring
dashboards and alerts to detect version drift across nodes in
multi-server environments.

``ZCT-1431``

Recording Notifications in Files
----------------------------------------

When a meeting recording completes processing, the recording owner now
receives a notification in the Files module. The notification is
interactive and navigates directly to the recording file.

``CO-3320``


Improvements to Existing Features
====================================


Security & Authentication
--------------------------

-  **Separate UserUI / AdminUI sessions:** User and admin sessions are
   now handled independently with separate session cookies. Logging out
   from the user interface no longer terminates the admin session, and
   vice versa, reducing the risk of unintended privilege escalation.
   ``CO-3194``, ``CO-3284``, ``CO-3466``
-  **External change-password endpoint:** Admins can configure a custom
   external URL for password changes. When set, the Auth UI displays
   this URL in place of Carbonio's native password change link, enabling
   integration with enterprise identity systems or IdP portals.
   ``CO-3472``
-  **Direct password change in user menu:** A shortcut to the password
   change page has been added directly to the user menu. ``CO-3423``
-  ``zimbraPasswordLocked`` **exposed in Admin UI:** Admins can now
   view and toggle the ``zimbraPasswordLocked`` attribute directly from
   the Admin UI account detail page. ``CO-3605``


Admin Panel
-----------

-  **Read-only fields as plain text:** Admin UI now renders read-only
   data as plain text instead of disabled input fields, improving
   readability and reducing visual clutter. ``CO-3419``
-  **Required fields and auto-focus across modules:** Required fields
   are now visually flagged with indicators across all module forms
   (Mails, Calendar, Chats, Files, Contacts, Admin UI). Forms auto-focus
   the first required field on open. ``CO-3416``, ``CO-3418``,
   ``CO-3426``, ``CO-3427``, ``CO-3428``
-  **TURN server hostname override** *(Beta)*: Admins can configure a
   hostname override for the TURN server to handle NAT scenarios where
   the server's public address differs from the internal hostname.
   ``CO-3604``

 

UI / UX
-------

-  **Standardized delete icons:** The Trash Can icon is now used
   consistently for all delete actions across all modules platform-wide.
   ``CO-3169``

 

Calendar
--------

-  **Internal/public sharing distinction:** The calendar sharing modal
   now more clearly differentiates between sharing a calendar with
   specific internal users and making it publicly accessible.
   ``CO-3429``
-  **Confirmation modal on board close:** The calendar event editor now
   displays a confirmation prompt before discarding unsaved changes.
   ``CO-3431``
-  **ICS calendar indicator tooltips updated:** Tooltip text on ICS
   subscription indicators in the calendar list has been revised for
   clarity and consistency. ``CO-3703``

 

Chat & Meetings
---------------

-  **Mobile push notification muting:** Users can now mute mobile push
   notifications from the chat notification settings panel, extending
   the existing mute behavior (previously web-only) to mobile push.
   ``CO-3568``
-  **Incoming call notifications with cross-device sync:** Call
   notification handling has been improved with dedicated push
   notification types for incoming calls. Declining a call on one device
   now syncs the notification dismissal across all devices. ``CO-3578``
-  **Call state awareness:** Carbonio Chats now provides full visibility
   into 1:1 call states through automatic, timestamped system messages
   within conversation threads. When a call is initiated, both
   participants receive a notification confirming the start time. Upon
   completion, the chat history is updated with a persistent record
   displaying the exact end time and total call duration. If a callee
   declines an incoming call, the caller's interface closes
   automatically with a clear "Call Declined" status, eliminating
   ambiguous waiting states; both parties receive a corresponding system
   message logging the decline event. ``CO-2834``
-  **Webcam support on mobile browsers:** Users can now join video
   meetings with full video from mobile browsers (iOS and Android).
   Previously, only audio was supported from mobile browsers.
   ``CO-3527``
-  **Chat text preserved when removing an attachment:** Removing an
   attachment from the chat message composer no longer clears any text
   that was already typed. ``CO-3396``
-  **Chat room caching for faster initial load:** Room and conversation
   data is now cached client-side, significantly improving initial
   loading performance in the chat list. ``CO-3327``

 

Mail
----

-  **Send/On Behalf Of UI improvements:** The copywriting and
   interaction model for delegate send actions have been revised for
   clarity. Users granted "Send As" or "Send on Behalf" rights have
   clearer controls in the composer. ``CO-3167``
-  **Mail actions unified for messages and conversations:**
   Single-message and conversation-level actions are now handled from a
   consistent, unified action set, reducing behavioral inconsistencies.
   ``CO-3212``
-  **Archive option in displayer menu and list hover:** The Archive
   action is now accessible from the message displayer context menu and
   from the list item hover actions, in addition to the existing Archive
   button. ``CO-3439``
-  **Composer extensibility API:** External integrations and modules can
   now inject custom actions into the Mail Compose editor toolbar,
   enabling third-party extensions to add buttons or actions.
   ``CO-3424``

 

Files & Docs
------------

-  **Files description editing affordance improved:** The description
   field in the Files details panel now has a clearer visual treatment
   to indicate it is editable inline. ``CO-3420``

 

Infrastructure & Deployment
---------------------------

-  **Ansible playbook pre-flight validations:** Multiple new validation
   checks have been added to the installation playbook: hostname/FQDN
   validated against the inventory, Ubuntu minimized installation
   detected, IP address format validated, deprecated ``ansible_*`` fact
   variables replaced with ``ansible_facts[]``. ``ZCT-1741``,
   ``ZCT-1805``, ``ZCT-1827``, ``ZCT-1842``, ``ZCT-1921``, ``ZCT-1926``
-  **Carbonio Erlang runtime updated:** The ``carbonio-erlang`` package
   and related dependencies have been upgraded. A service restart is
   required after upgrade. ``CO-2407``
-  **Videorecorder migrated to Quarkus:** Introduced in 26.3, the
   Quarkus-based videorecorder is now stable. Configuration is
   centralized in
   ``/etc/carbonio/videorecorder/application.properties``. ``CO-3364``
-  **Systemd hardening and sd_notify integration:** Systemd unit files
   now include privilege restriction directives, namespace isolation,
   and proper ``sd_notify`` readiness signaling for more reliable
   service orchestration. ``CO-3422``, ``CO-3143``
-  **Prometheus/monitoring stack improvements:**

   -  OpenLDAP exporter replaced with a better-maintained upstream fork,
      with an updated Grafana dashboard. ``ZCT-1830``
   -  New Prometheus alerting rules for exporter job failures.
      ``ZCT-1672``
   -  Prometheus configuration file reorganized for maintainability.
      ``ZCT-1802``
   -  LDAP service health monitoring and multi-instance HA alertover
      support added. ``ZCT-1457``
   -  Service Discovery dashboard panel naming improved. ``ZCT-1816``
   -  ``carbonio-storages-ui`` package added to installation and upgrade
      playbooks. ``ZCT-1913``
   -  Prometheus monitoring packages upgraded to latest versions.
      ``ZCT-1900``

-  **LDAP attributes fall back to default values when not set:**
   Provisioning operations no longer fail when optional LDAP attributes
   are absent; schema defaults are applied automatically. ``CO-3098``
-  **Directory server static attribute documentation generated at build
   time:** A reference bundle for LDAP schema attributes is now produced
   as a build artifact, improving admin documentation. ``CO-3561``,
   ``CO-3589``
-  **Scality S3 checksum validation automatically enabled:** Checksum
   parameters are now automatically configured for Scality S3 storage
   backends, improving data integrity. ``CO-3717``
-  **Mailbox composer API calls optimized:** Redundant ``getMessage``
   API calls during composition have been reduced, lowering server load.
   ``CO-3281``
-  **Internal service-to-service mailbox API:** New internal API for
   backend service communication with the mailbox, without going through
   the public SOAP/REST layer. ``CO-3298``
-  **Carbonio message-broker reorganized on cluster nodes.**
   ``ZCT-1829``

 

Localization
------------

-  **Hindi translations added:** Full Hindi UI translation is now
   available for Carbonio. ``ZCT-1744``
-  **Indonesian and Chinese language selection fixed:** Selecting
   Indonesian or Chinese in language settings now correctly applies the
   selected language. ``CO-3341``
-  **Admin UI panel icon tooltips translated:** Tooltips on sidebar
   icons in the Admin UI are now correctly translated for non-English
   language settings. ``CO-3383``
-  **Docs spell checker inherits webmail language:** The spell checker
   in the Docs editor now uses the user's configured webmail language
   instead of always defaulting to English. ``CO-3549``


 

Bug Fixes
=========

Security & Authentication
-------------------------

-  Perpetual license activation failed for previously valid tokens.
   ``CO-3201``
-  Login failure occurred when canceling OTP creation from the admin
   side. ``CO-3520``
-  Edge cases in the incomplete 2FA wizard caused broken authentication
   states. ``CO-3365``
-  Mailbox folder with an external data source lacked correct flags and
   permissions in API responses. ``CO-3347``
-  Cannot create a persona using a Dynamic Distribution List (DDL) email
   address in Mails UI. ``CO-3277``
-  "Hide Change Password" menu option in account settings was not
   respected when disabled by policy. ``CO-3510``
-  Unable to manage Send As / Send on Behalf permissions for Dynamic
   Distribution Lists in admin UI. ``CO-3276``
-  **Legacy** ``AuthRequest`` **2FA bypass blocked:** The
   SOAP ``AuthRequest`` endpoint can no longer be used to bypass
   Two-Factor Authentication when 2FA is enabled. The system now
   strictly enforces 2FA policies across both WebUI and WebAdminUI
   authentication flows. Administrators should review automated services
   or scripts that rely on direct ``AuthRequest`` calls and update them
   to handle the standard 2FA challenge flow. ``CO-3809``

 

Mail
----

-  ``reject_unlisted_recipient`` MTA setting caused an infinite loop
   with the SendLater feature when the recipient address was an invalid
   internal address. ``CO-2795``

-  Sending a file from the Files module to a mail composer never
   completed until the draft was explicitly saved. ``CO-3448``

-  Drag-and-drop folder move incorrectly highlighted unrelated folders
   in the sidebar. ``CO-3252``

-  Delegated Admins received 401 Unauthorized errors when accessing
   admin management pages. ``CO-3483``

-  "Not set" option in the Public Service Protocol field did not persist
   after saving. ``CO-3509``

-  Mail message and conversation display ignored the user's preferred
   format setting (plain text vs HTML). ``CO-3297``

-  Conversation list became empty after a new conversation was created
   in conversation view. ``CO-3522``

-  "Save and leave" action on the settings page did not work correctly.
   ``CO-2851``

-  New time proposals sent by meeting attendees became inactive after
   being moved to the Trash folder. ``CO-2149``

-  Removed the non-functional "Default Mail Search" setting, which
   caused inconsistent search behavior. ``CO-3494``

-  **Inline attachments preserved when forwarding emails:** Non-image
   inline attachments are now correctly preserved when forwarding
   messages. Previously, only inline images were preserved in the
   composer, while other embedded files became inaccessible. The system
   now converts these items to standard attachments in the attachment
   bar during forwarding, ensuring full visibility and
   manageability. ``CO-3798``

-  **Missing tags no longer duplicate in delegated folder
   previews:** Tags that no longer exist in the user's local tag list,
   such as tags from deleted delegated accounts, are now displayed only
   once in delegated folder message previews. This removes repeated tag
   rendering and reduces visual clutter in the preview
   header. ``CO-3796``

-  **External HTTPS images restored in printed messages and
   conversations:** External HTTPS images are no longer blocked in print
   previews or printed output. The Content Security Policy has been
   updated to allow HTTPS image sources while preserving strict controls
   for scripts and forms. ``CO-3794``

-  **Composer table styles preserved:** The new email composer no longer
   overwrites user-defined table styles such as widths, borders, and
   spacing. Explicit author-defined attributes are preserved in drafts,
   replies, and sent messages, while default styling is applied only
   when no explicit values are provided. ``CO-3793``

-  **Sender email address restored in print output:** Printed messages
   and conversations now correctly render sender email addresses in
   the ``From`` header. Angle brackets around email addresses are
   properly escaped, preventing browsers from interpreting them as HTML
   tags. ``CO-3792``

 

Calendar
--------

-  Removed the non-functioning "List" option from the Calendar default
   view setting. ``CO-3446``

 

Chat & Meetings
---------------

-  Internal users were unable to re-enter a video conference room after
   leaving. ``CO-2390``
-  Pinned meeting messages were not fully hidden when the sidebar was
   collapsed. ``CO-3359``
-  Media resources (microphone and webcam) were not released by the
   browser after leaving a meeting. ``CO-3290``
-  Chat input area became unclickable and the attachment button
   disappeared after removing an attachment from the composer.
   ``CO-3445``
-  Calendar of a delegated mailbox could not be enabled or disabled
   (regression from previous release). ``CO-3485``
-  **Attachment descriptions fixed in mobile push
   notifications:** Mobile push notifications for attachments with
   descriptions no longer display incorrectly encoded characters. The
   Push Connector now decodes the GraphQL API payload before delivery,
   ensuring recipients see clean, human-readable descriptions. This fix
   is included in Push Connector version ``0.2.2`` and requires no
   configuration changes. ``CO-3569``

 

Admin Panel
-----------

-  Account status displayed "Lockout" in the accounts list but "Active"
   in the General tab for the same account. ``CO-3469``
-  Domain creation date displayed non-deterministic random values on
   each page load. ``CO-3470``
-  Volume edit page in admin UI had display issues preventing proper
   editing. ``CO-3388``
-  Multiple visual inconsistencies in quota-related Admin UI pages.
   ``CO-3514``

 

Files & Docs
------------

-  Files module silently ignored errors returned by Powerstore on delete
   operations, incorrectly showing a success confirmation. ``CO-3553``
-  Docs editor redirected to wrong server instances in multi-server
   environments. ``CO-3576``
-  Cannot upload p12 S/MIME certificates: file name was not shown in the
   upload dialog, making it impossible to confirm the selected file.
   ``CO-3580``
-  Body of printed messages was not visible in print preview.
   ``CO-3386``

 

Infrastructure & Backend
------------------------

-  Carbonio Appserver failed to start due to a Redolog write error
   causing a mailbox crash on startup. ``CO-3503``

-  Database sidecar services did not auto-start after a system reboot,
   due to a missing ``service-discover.target`` dependency in systemd
   unit files. ``CO-3709``

-  Bootstrap process failed due to systemd timeout on systems with older
   systemd versions; incompatible directives have been removed.
   ``CO-3524``

-  Pending-setups process failed due to systemd unit timeouts on RHEL8.
   ``CO-3732``

-  RHEL8 deployment failed due to Python 3.6 incompatibility in Ansible
   modules. ``ZCT-1937``

-  LDAP ``setcap`` command was applied at the wrong point during
   upgrade, causing service startup failure. ``CO-3244``

-  ``carbonio-videorecorder`` service was left disabled after a clean
   installation. ``CO-3531``

-  Missing ``Crypt::OpenSSL::Bignum`` dependency in
   ``carbonio-perl-crypt-openssl-rsa`` caused Amavis to fail to start.
   ``CO-3567``

-  Breadcrumb labels in the Admin UI showed incorrect or duplicated
   text. ``CO-3606``

-  Domain Administrators were unable to delete user accounts after
   upgrading to 26.3 (regression). ``CO-3749``

-  HSM tiering policies based on the ``size`` parameter did not work.
   ``CO-3204``

-  Powerstore copy operation did not copy items to the correct target
   server. ``CO-3459``

-  RabbitMQ connection and shutdown failures gave no feedback to end
   users, causing silent failures. ``CO-3577``

-  Folder deletion in UI commons did not remove the entire folder
   subtree, leaving orphaned child folders. ``CO-3532``

-  Input fields lost focus after the first character was typed.
   ``CO-3372``

-  Creating a new distribution list erroneously displayed an error
   message even when the operation succeeded. ``CO-3404``

-  ``carbonio-prometheus-openldap-exporter`` was incorrectly configured
   for HA LDAP deployments, causing missing metrics. ``ZCT-1934``

-  **HA** ``db-connectors`` upgrade logic fixed:** The upgrade playbook
   now installs additional ``db-connectors`` on every host in
   the ``dbsConnectorServers`` group. Previously, the condition checked
   only the first host in the group, so new connectors could be
   installed only on the
   first ``db-connectors`` node. ``ZCT-1936``, ``ZCT-1953``

-  ``/var/log/carbonio.log`` **permissions fixed:** Incorrect
   permissions on ``/var/log/carbonio.log`` no longer prevent
   the ``zextras`` user from reading the log. The update restores
   appropriate read access for the ``zextras`` group and
   ensures ``logrotate`` preserves the correct permissions, preventing
   failures in utilities such
   as ``zmdailyreport`` and ``zmmsgtrace``. ``CO-3630``

-  ``zmconfigd`` **startup improved when localhost resolution is
   incomplete:** ``zmconfigd`` no longer fails to start
   when ``/etc/hosts`` lacks the
   standard ``127.0.0.1 localhost`` directive. Administrators should
   still verify that mailbox servers include the correct IPv4 localhost
   mapping before upgrading to avoid unexpected resolution
   behavior. ``CO-3608``

 

Localization
------------

-  Message date in mail print preview did not respect the user's locale
   (24-hour format and non-English date formats were ignored).
   ``CO-2798``
-  Missing localized strings on the settings modal for several
   languages. ``CO-3489``

 

Other Technical Improvements (Sysadmin / Platform)
--------------------------------------------------

-  **JNI replaced with Java FFM:** ``carbonio-mailbox-native`` JNI
   bindings have been replaced with Java Foreign Function and Memory
   (FFM) API and stdlib equivalents, removing the native shared library
   dependency. ``CO-3493``
-  **Janus (videoserver) upgraded** to the latest upstream version, with
   dependency alignment across videoserver packages. ``CO-3136``,
   ``CO-3311``
-  **Lua module compilation support added to** ``carbonio-nginx``:
   Nginx is now compiled with Lua module support, enabling dynamic
   request handling extensions. ``CO-3463``
-  **Directory service version updated** in the Mails component.
   ``CO-3326``
-  **Obsolete config store removed** from ``admin-console-ui``, reducing
   technical debt and simplifying the frontend architecture. ``CO-3349``
-  **WSC capabilities fetched from WSC service:** Clients now fetch WSC
   capability information directly from the WSC service instead of the
   mailbox. Sysadmins should verify the WSC service endpoint is
   reachable after upgrade. ``CO-3203``
-  **Database transaction overhead removed** for single-write statements
   in ``carbonio-advanced``, reducing unnecessary lock contention.
   ``CO-3486``
-  **Videorecorder logging improved:** Log entries now include recording
   job IDs, making it easier for admins to search and correlate logs for
   specific recording jobs. ``CO-3457``
-  **Storages admin API logs enriched** with additional context for
   storage operations, improving operational visibility. ``CO-3704``
-  **Admin UI version source changed:** The Admin UI now reads the
   Carbonio version from ``/opt/zextras/.version`` instead of making a
   runtime API call, eliminating a potential startup dependency.
   ``CO-3265``
-  **Memcached reconfiguration step removed** from the upgrade playbook;
   it was a no-op following the 26.3 migration. ``ZCT-1839``
-  **Prometheus monitoring packages upgraded** to the latest versions,
   with associated configuration migrations. ``ZCT-1900``
-  ``carbonio-erlang`` **and related packages updated.** ``CO-2407``
-  **Ansible** ``ansible.posix`` **dependency updated:** The deprecated
   import of ``to_native`` from ``ansible.module_utils._text`` has been
   removed by updating the ``ansible.posix`` collection dependency to
   version ``2.2.0``, eliminating the related deprecation
   warning. ``ZCT-1778``



 

Security Fixes
==============


-  **CVE — XXE in WS-Collaboration chat message forward:** An XML
   External Entity (XXE) injection vulnerability in the chat message
   forwarding path has been resolved. XML parsing is now restricted to
   prevent document-type declaration processing. ``CO-3563``
-  **CVE — Unauthenticated RCE in** ``carbonio-nginx``: A flaw in
   the NGINX Rewrite Module enabled remote code execution without
   authentication. The ``carbonio-nginx`` package has been updated to
   address this vulnerability. ``CO-3710``
-  **Systemd security hardening:** Core systemd unit files now include
   ``NoNewPrivileges``, capability restrictions, and namespace isolation
   (``PrivateTmp``, ``ProtectSystem``, ``ProtectHome`` where
   applicable), reducing the attack surface of running services.
   ``CO-3143``, ``CO-3422``
-  **SonarQube security hotspots resolved** in
   ``carbonio-admin-console-ui``. ``CO-3715``
-  **SonarQube reliability issues resolved** in
   ``carbonio-admin-console-ui``. ``CO-3716``
-  **2FA bypass via SOAP** ``AuthRequest`` **blocked:** A vulnerability
   allowing direct SOAP ``AuthRequest`` calls to bypass Two-Factor
   Authentication has been resolved. When 2FA is enabled, second-factor
   verification is now strictly enforced across both user and
   administrator authentication flows. ``CO-3809``
