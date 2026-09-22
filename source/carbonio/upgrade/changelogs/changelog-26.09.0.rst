.. role:: changelog-category
   :class: blue

Release 26.9.0
===============

This release includes the following changes and improvements:

:changelog-category:`Mail`
--------------------------

**Importing and exporting mail folders:** Users can now import and export mail folders directly, with support for TGZ, ZIP and MBOX formats. Administrators can control the features per COS and account, while operations are audited for review and compliance.

**New mail composer, built on Lexical:** The mail composer has been rebuilt with Lexical, providing the existing composition features with improved editing, tables and pasting from Microsoft Word and Excel. Recipient validation, sending feedback and draft autosave have also been improved.

**Writing from shared mailboxes:** When composing from a shared mailbox, Carbonio automatically selects the correct sender identity and applies its signature.

**Other fixes:** Fixed draft handling when sending messages quickly, distribution-list display names, non-ASCII attachment filenames, and attachment filename encoding for iPhone Mail and Outlook.

:changelog-category:`Calendars`
-------------------------------

**Scheduling and board customisation:** Creating events from Day View and moving events in Month View now require fewer manual steps and behave more consistently. Calendar colours, hexadecimal values and handling of unsaved board changes have also been improved.

**Invitations and delegation:** Organisers can compare and accept proposed meeting times more easily, while delegated events now clearly show who created them. Event forwarding also handles subjects and descriptions more consistently.

**Clearer update notifications:** Calendar notifications now highlight changes to time, location, rooms, resources, attendees and messages, with clearer cancellation details and more targeted delivery. Notifications also use the recipient's timezone and can open the relevant appointment directly.

**Other fixes:** Fixed appointment visibility preferences, editing events linked to removed resources, weekly recurrence display, translations, document language and reply-status visibility for non-organisers.

:changelog-category:`Admin Console`
-----------------------------------

**A more consistent foundation:** The Admin Console has been extensively refactored with declarative routing, smaller components and improved data handling, resulting in more predictable navigation and reduced flicker and unnecessary requests.

**Usability improvements:** Selecting a domain now opens the Accounts section directly, while domain creation still opens General Settings. Breadcrumbs are also navigable and more accessible.

**Guided volume configuration:** Volume configuration now adapts to the selected storage type, showing only relevant options and clearer constraints for current and tiered volumes. Settings for volumes already in use are read-only.

**S3 connector management:** S3 connector management now shows associated Powerstore and backup volumes with search and pagination, and prevents connectors from being deleted while they are still in use.

:changelog-category:`Storages`
-----------------------------------

**Storage types and S3 connectors:** Carbonio 26.9 consolidates storage into Local Storage, Standard S3 and Carbonio S3 for AWS, with unified CLI and Admin UI management, connection validation and clearer connector-to-volume relationships. **Action required:** Custom S3, Scality, Ceph and MinIO configurations must be migrated to Standard S3.

**Storages module now loads in the web client:** The Storages module is now correctly registered and exposed through the feature flag, allowing it to load in the web client when enabled for the user.

:changelog-category:`Files & Docs`
-----------------------------------

**Document caching across multiple nodes:** Removed local and second-level document caching so that files are read directly from the database and users always access the current document version regardless of the node serving the request.

**Uploads that fail safely:** Uploads now preserve the existing file until the new content is confirmed, preventing empty files and orphaned references after failures. Concurrent uploads are rejected with ``409 Conflict``, and copying older files to uncompressed volumes has been fixed.

**Sending large files as attachments:** The **Send via e-mail** action now checks the estimated attachment size, including encoding overhead, and provides a clear message when the configured limit is exceeded.

**Files backend migrated to Quarkus:** The Files backend has been migrated to Quarkus 3.x with reactive I/O, API parity testing and hardened XML parsing, without changing client-visible behaviour.

:changelog-category:`Quota`
-----------------------------------

**Cached quota checks with a TTL:** Quota state is now cached with a TTL instead of being checked on every write operation, reducing the overhead of frequent writes, mail delivery and backup restores.

**Code and command cleanup:** The legacy V1 quota APIs and related code have been removed in favour of the unified V2 model. **Action required:** integrations using V1 APIs or aggregate quota attributes must be migrated to V2; ``zmcomputequotausage`` remains available but no longer performs calculations.

:changelog-category:`Chats`
-----------------------------------

**Message formatting:** Chat messages now support a subset of Markdown, including bold, italic, strikethrough, inline code, links, blockquotes, lists and code blocks. Unsupported elements such as tables and images are displayed as plain text.

**Media Gallery, version 2:** The Media Gallery now separates Images, Videos and Documents into tabs, with file counts, sender filtering, multi-selection and bulk actions. The backend also supports MIME-category filtering and independent total counts.

**Meeting stability and UX fixes:** Fixed typing indicators triggered by non-printing keys, stuck audio/video controls, Bluetooth audio interruptions, rotated portrait videos in Firefox and guest users getting stuck while opening meetings.

:changelog-category:`Security & Auth`
-------------------------------------

**Free/busy data exposed without authentication:** Unauthenticated access to calendar availability is now disabled by default, with a domain-level setting to control access when required. This addresses a security finding related to account enumeration.

**Real client IP in EAS authentication:** Exchange ActiveSync authentication now propagates the original client IP address to ZxAuth, ensuring that audit logs record the actual source address instead of ``127.0.0.1``.

**Account type returned for guest users:** The API now correctly identifies guest accounts, preventing clients from granting them features intended for internal users.

:changelog-category:`Web client`
-----------------------------------

**Module visibility:** Module visibility is now handled consistently between frontend and backend, and an explicitly declared but unset visibility attribute is no longer treated as enabled. **Action required:** extension developers must remove empty visibility keys or replace them with valid attributes; administrators should verify feature attributes after upgrading.

:changelog-category:`Proxy`
---------------------------

**Automatic configuration for CalDAV and CardDAV clients:** The proxy now supports the ``.well-known`` URLs required for automatic CalDAV and CardDAV configuration, including equivalent URLs with or without a trailing slash.

**Browser caching of proxied content:** Fingerprint-based static resources are now cached by browsers, while user content and attachments use time-based caching with revalidation, improving loading times and reducing repeated requests.

**Request routing to the mailbox node:** Fixed a proxy lookup regression that returned the mailbox node's IP address instead of its hostname.

:changelog-category:`Mesh & Monitoring`
---------------------------------------

**Missing health checks:** Added application-level health checks for ``carbonio-push-connector`` and ``carbonio-notification-push``, allowing service discovery and external monitoring to correctly detect when these services are unavailable.

**Duplicate check identifiers:** Removed duplicate health-check identifiers from several services, eliminating ambiguity in logs, dashboards and monitoring systems.

**Proxy-to-memcached communication rule:** Updated the service mesh rule to allow ``carbonio-proxy`` to communicate with the shared memcached instance introduced in Carbonio 26.3.

:changelog-category:`LDAP address book`
---------------------------------------

**No longer tied to the Mobile license:** The LDAP address book is now available independently of ActiveSync licensing and can be used with IMAP and POP clients. It has moved to the Core module, with updated CLI/API namespaces and new Admin Panel controls.

:changelog-category:`Installation & Upgrade`
---------------------------------------------

**Pre-flight checks:** Installation and upgrade playbooks now verify repository consistency, target versions, license coverage and required SSL certificate files before making changes, with support for non-interactive execution.

**Service-discover registration:** Service-discover registration is now handled automatically during server reconfiguration and service changes, avoiding cases where administrators had to manually update the LDAP installed-services attribute.

**Safer Playbook Execution:** Installation and upgrade playbooks are now more idempotent and safer to resume after interruptions, preserving generated identifiers and skipping steps that have already been completed.

**New packages handled:** Installation and upgrade playbooks now support the new ``carbonio-preview-db`` and ``carbonio-license-service`` packages introduced in 26.9.

**Webui meta-package removed:** The ``carbonio-webui`` meta-package has been removed in 26.9. **Action required:** custom playbooks and installation scripts must replace it with the nine individual web UI packages.

**Mail logs no longer duplicated:** The default rsyslog configuration no longer duplicates mail messages in both the dedicated mail log and ``carbonio.log``. **Action required:** administrators using the old dedicated mail log must update archiving and analysis procedures to use ``carbonio.log``.

**Fixed certificate permissions:** The ``carbonio-openjdk-cacerts`` package now correctly sets ownership and permissions for the Java truststore, preventing SSL certificate deployment failures on multi-node installations.

**Playbook review:** The installation and upgrade playbooks have been reviewed and standardised for naming, structure, Ansible modules, conditions, dependencies, service handling, documentation and repository organisation, with no intended behavioural changes.

:changelog-category:`Platform`
---------------------------------------------
**Vulnerable dependency updates:** Carbonio 26.9 updates multiple backend dependencies with known vulnerabilities, removes unmaintained libraries and upgrades Jetty to 12.1.10, reducing exposure to issues in third-party components.