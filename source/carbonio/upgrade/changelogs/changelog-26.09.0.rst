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

**Instant preview of inline images:** Newly uploaded inline images now appear immediately in the Lexical mail composer, without waiting for the next draft autosave. Temporary local URLs provide an immediate preview while the permanent service URLs are synchronised in the background.

**Other fixes:** Fixed draft handling when sending messages quickly, distribution-list display names, non-ASCII attachment filenames, and attachment filename encoding for iPhone Mail and Outlook.

:changelog-category:`Calendars`
-------------------------------

**Scheduling and board customisation:** Creating events from Day View and moving events in Month View now require fewer manual steps and behave more consistently. Calendar colours, hexadecimal values and handling of unsaved board changes have also been improved.

**Invitations and delegation:** Organisers can compare and accept proposed meeting times more easily, while delegated events now clearly show who created them. Event forwarding also handles subjects and descriptions more consistently.

**Clearer update notifications:** Calendar notifications now highlight changes to time, location, rooms, resources, attendees and messages, with clearer cancellation details and more targeted delivery. Notifications also use the recipient's timezone and can open the relevant appointment directly.

**Copying appointments across accounts:** Users can now copy appointments to any writable calendar, including calendars belonging to other accounts or delegated users. Calendar selection now includes calendars across accounts and groups them by owner for easier navigation.

**Other fixes:** Fixed appointment visibility preferences, editing events linked to removed resources, weekly recurrence display, translations, document language and reply-status visibility for non-organisers. Users and administrators can configure the preferred time display format (12-hour AM/PM or 24-hour) through the new carbonioPrefTimeFormat LDAP attribute.

:changelog-category:`Contacts`
-------------------------------

**Alphabetical contact filtering:** The Contacts module now includes a letter-based filter that allows users to navigate large address books more quickly. Contacts are grouped alphabetically, with visible matching contact counts.

:changelog-category:`Admin Console`
-----------------------------------

**A more consistent foundation:** The Admin Console has been extensively refactored with declarative routing, smaller components and improved data handling, resulting in more predictable navigation and reduced flicker and unnecessary requests.

**Usability improvements:** Selecting a domain now opens the Accounts section directly, while domain creation still opens General Settings. Breadcrumbs are also navigable and more accessible.

**Guided volume configuration:** Volume configuration now adapts to the selected storage type, showing only relevant options and clearer constraints for current and tiered volumes. Settings for volumes already in use are read-only.

**S3 connector management:** S3 connector management now shows associated Powerstore and backup volumes with search and pagination, and prevents connectors from being deleted while they are still in use.

**Support for external Class of Service identifiers:** The subscription module now accepts Class of Service identifiers that are not UUIDs, allowing configurations using identifiers such as defaultExternal to load and be edited correctly in the Admin Console.

**Enhanced account restore wizard with comprehensive configuration options:** The account restore wizard has been enhanced with full configuration options, including destination account selection, point-in-time restore, HSM policy application, and email notifications. The restore summary now displays all selected options before execution. Fixed an issue preventing users from proceeding to the next wizard step due to incorrect account selection handling.

:changelog-category:`Storages`
-----------------------------------

**Storage types and S3 connectors:** Carbonio 26.9 consolidates storage into Local Storage, Standard S3 and Carbonio S3 for AWS, with unified CLI and Admin UI management, connection validation and clearer connector-to-volume relationships. **Action required:** Custom S3, Scality, Ceph and MinIO configurations must be migrated to Standard S3.

**Storages module now loads in the web client:** The Storages module is now correctly registered and exposed through the feature flag, allowing it to load in the web client when enabled for the user.

**Quota panel availability:** The quota panel is now consistently registered in the web client shell, independently of the backend service state or Class of Service feature flag.

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

**Configurable quota warning notifications:** Administrators can configure how frequently storage quota warning emails are resent, choosing an interval of 1, 7, 14, or 30 days. The default interval is 7 days, helping ensure users receive reminders before reaching their storage limits.

:changelog-category:`Chats`
-----------------------------------

**Message formatting:** Chat messages now support a subset of Markdown, including bold, italic, strikethrough, inline code, links, blockquotes, lists and code blocks. Unsupported elements such as tables and images are displayed as plain text.

**Media Gallery, version 2:** The Media Gallery now separates Images, Videos and Documents into tabs, with file counts, sender filtering, multi-selection and bulk actions. The backend also supports MIME-category filtering and independent total counts.

**Meeting stability and UX fixes:** Fixed typing indicators triggered by non-printing keys, stuck audio/video controls, Bluetooth audio interruptions, rotated portrait videos in Firefox and guest users getting stuck while opening meetings.

**More reliable MongooseIM configuration during upgrades:** MongooseIM configuration is now generated from a packaged template during upgrades. The configuration script uses atomic file replacement and retrieves credentials from Consul, ensuring deprecated configuration keys are removed and preventing upgrade-related crashes on MongooseIM 6.6.0.

:changelog-category:`Security & Auth`
-------------------------------------

**Free/busy data exposed without authentication:** Unauthenticated access to calendar availability is now disabled by default, with a domain-level setting to control access when required. This addresses a security finding related to account enumeration.

**Real client IP in EAS authentication:** Exchange ActiveSync authentication now propagates the original client IP address to ZxAuth, ensuring that audit logs record the actual source address instead of ``127.0.0.1``.

**Account type returned for guest users:** The API now correctly identifies guest accounts, preventing clients from granting them features intended for internal users.

**Improved 2FA QR code visibility:** The two-factor authentication QR code now has improved contrast in dark mode, making it easier to scan.

**Feature flags in authentication settings:** Auth Settings now correctly respects the feature flags for ActiveSync and Mobile Apps, ensuring that the available settings reflect the enabled features.

**Sensitive information removed from SASL logs:** Cleartext credentials and authentication tokens are now redacted from SASL logs, reducing the risk of exposing sensitive authentication data in log files.

:changelog-category:`Web client`
-----------------------------------

**Module visibility:** Module visibility is now handled consistently between frontend and backend, and an explicitly declared but unset visibility attribute is no longer treated as enabled. **Action required:** extension developers must remove empty visibility keys or replace them with valid attributes; administrators should verify feature attributes after upgrading.

:changelog-category:`Proxy`
---------------------------

**Automatic configuration for CalDAV and CardDAV clients:** The proxy now supports the ``.well-known`` URLs required for automatic CalDAV and CardDAV configuration, including equivalent URLs with or without a trailing slash.

**Browser caching of proxied content:** Fingerprint-based static resources are now cached by browsers, while user content and attachments use time-based caching with revalidation, improving loading times and reducing repeated requests.

**Request routing to the mailbox node:** Fixed a proxy lookup regression that returned the mailbox node's IP address instead of its hostname.

**Deprecation of IP-based virtual hosting:** The legacy zimbraVirtualIPAddress attribute and related virtual IP configuration attributes are now deprecated in favour of Server Name Indication (SNI), which supports modern multi-certificate configurations. Administrative CLI commands and setup scripts issue non-blocking warnings when legacy virtual IP configurations are detected.

:changelog-category:`Mesh & Monitoring`
---------------------------------------

**Missing health checks:** Added application-level health checks for ``carbonio-push-connector`` and ``carbonio-notification-push``, allowing service discovery and external monitoring to correctly detect when these services are unavailable.

**Duplicate check identifiers:** Removed duplicate health-check identifiers from several services, eliminating ambiguity in logs, dashboards and monitoring systems.

**Proxy-to-memcached communication rule:** Updated the service mesh rule to allow ``carbonio-proxy`` to communicate with the shared memcached instance introduced in Carbonio 26.3.

**Notification push service migrated to Quarkus:** The carbonio-notification-push service has been migrated to Quarkus as part of the backend modernisation work.

:changelog-category:`LDAP address book`
---------------------------------------

**No longer tied to the Mobile license:** The LDAP address book is now available independently of ActiveSync licensing and can be used with IMAP and POP clients. It has moved to the Core module, with updated CLI/API namespaces and new Admin Panel controls.

:changelog-category:`Installation & Upgrade`
---------------------------------------------

**Pre-flight checks:** Installation and upgrade playbooks now verify repository consistency, target versions, license coverage and required SSL certificate files before making changes, with support for non-interactive execution.

**Service-discover registration:** Service-discover registration is now handled automatically during server reconfiguration and service changes, avoiding cases where administrators had to manually update the LDAP installed-services attribute.

**Removed manual service-discover LDAP workaround:** The installation and HA playbooks no longer manually modify the zimbraServiceInstalled and zimbraServiceEnabled LDAP attributes to register service-discover. These attributes are now managed by the service-discover scripts.

**Safer Playbook Execution:** Installation and upgrade playbooks are now more idempotent and safer to resume after interruptions, preserving generated identifiers and skipping steps that have already been completed.

**Additional playbook reliability fixes:** Installation and upgrade automation now preserves generated Kafka cluster identifiers across reruns, checks for existing LDAP replication agreements, makes PostgreSQL exporter database setup idempotent, preserves configured repositories during Patroni replica provisioning on RHEL, and verifies service-mesh registration before installing notification push.

**Workaround for antivirus database updater startup failures:** In multi-mailbox deployments, the installation and upgrade playbooks now automatically configure carbonio-avdb-updater.service on Proxy servers by setting its administrative endpoint to the first Application server in the inventory. The service is restarted when the configuration is created or changed.

**Improved Single Server optimisation:** Installation and upgrade playbooks now preserve the required MTA and ClamAV sidecars and their Service Discover configuration. Amavis is configured to use the local ClamAV endpoint, and monitoring cleanup removes obsolete configuration for disabled Prometheus exporters.

**New packages handled:** Installation and upgrade playbooks now support the new ``carbonio-preview-db`` and ``carbonio-license-service`` packages introduced in 26.9.

**Webui meta-package removed:** The ``carbonio-webui`` meta-package has been removed in 26.9. **Action required:** custom playbooks and installation scripts must replace it with the nine individual web UI packages.

**Mail logs no longer duplicated:** The default rsyslog configuration no longer duplicates mail messages in both the dedicated mail log and ``carbonio.log``. **Action required:** administrators using the old dedicated mail log must update archiving and analysis procedures to use ``carbonio.log``.

**Fixed certificate permissions:** The ``carbonio-openjdk-cacerts`` package now correctly sets ownership and permissions for the Java truststore, preventing SSL certificate deployment failures on multi-node installations.

**Playbook review:** The installation and upgrade playbooks have been reviewed and standardised for naming, structure, Ansible modules, conditions, dependencies, service handling, documentation and repository organisation, with no intended behavioural changes.

:changelog-category:`Platform`
---------------------------------------------
**Vulnerable dependency updates:** Carbonio 26.9 updates multiple backend dependencies with known vulnerabilities, removes unmaintained libraries and upgrades Jetty to 12.1.10, reducing exposure to issues in third-party components.

**Updated ClamAV antivirus engine to 1.5.4:** carbonio-clamav has been upgraded to version 1.5.4, with clamav-data updated to 1.4.6 to incorporate upstream security and stability fixes.

**Updated carbonio-postfix to 3.11.7:** Upgraded Postfix to version 3.11.7, fixing SMTP smuggling vectors (stripping stray CR characters in proxy filters), remote DoS vulnerabilities in smtpd, and improving TLS session ticket handling.

**Updated Memcached to 1.6.45:** The Memcached package has been upgraded to address issues involving item reference counts, crawler backend buffer overflows, and segmentation faults under out-of-memory conditions.

:changelog-category:`Closed CVEs`
---------------------------------------------


.. list-table::
   :header-rows: 1
   :widths: 22 18 20 40

   * - Component / Module
     - CVE ID / Ref
     - Severity / Category
     - Vulnerability Description & Mitigation
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20213``
     - High / Buffer Overflow
     - Heap buffer overflow write during PE file rebuild compressed with Aspack.
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20217``
     - Medium / Crash & DoS
     - Invalid free pointer cleanup in the PESpin unpacker causing scanner crash.
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20214``
     - High / OOB Write
     - Underflow in the FSG unpacker loop during PE scanning causing out-of-bounds write.
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20215``
     - High / OOB Write
     - Substream count overflow in the 7z parser resulting in memory under-allocation and OOB write.
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20216``
     - Medium / Resource Exhaustion
     - Extraction limit bypass in InstallShield archives leading to temporary storage exhaustion.
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20243``
     - Medium / DoS
     - Dimension handling error in ALZ archive parser resulting in daemon panic/crash.
   * - **ClamAV 1.5.3**
     - ``CVE-2026-20244``
     - Low / DoS (32-bit)
     - Insufficient validation of DMG stripe tables causing crash on 32-bit builds.
   * - **ClamAV 1.5.3 (Rust)**
     - ``CVE-2026-41676``
     - Medium / Dependency
     - Vulnerability in the Rust ``openssl`` crate resolved via dependency bump.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20337``
     - High / Heap Overflow
     - Heap out-of-bounds write in ZIP catalog indexing.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20345``
     - High / Stack OOB
     - Stack out-of-bounds read/write during GPT partition name conversion.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20339``
     - High / Integer Overflow
     - Integer overflow in the PESpin unpacker causing buffer under-allocation.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20338``
     - Medium / Invalid Free
     - Invalid free in ZIP catalog record merge on corrupted archives.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20346``
     - Medium / DoS
     - Integer underflow in PDF parser causing crash on malformed hex strings.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20347``
     - Medium / DoS
     - Integer overflow and undefined behavior in Mach-O parser.
   * - **ClamAV 1.5.4**
     - ``CVE-2026-20348``
     - Medium / Resource Exhaustion
     - Excessive memory allocation in XAR parser on malformed uncompressed tables.
   * - **ClamAV 1.5.4**
     - ``CVE-2025-8088``
     - High / Path Traversal
     - Path traversal on Windows/NTFS ADS within bundled UnRAR library.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-63072``
     - High / Heap Overflow
     - Heap buffer overflow during CMS key unwrapping.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-75803``
     - Medium / Cryptographic Flaw
     - Risk of AEAD cryptographic bypass with empty ciphertext via ``EVP_Cipher()``.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-18798``
     - High / DoS
     - Double free in the QUIC server during ``INITIAL`` packet processing.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-63076``
     - Medium / Crash
     - Invalid pointer dereference in CMP server via crafted ``protectionAlg`` parameter.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-14457``
     - Medium / Crash
     - Null pointer dereference in RPK server sigalg selection without certificate.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-14456``
     - Medium / DoS
     - Uncontrolled inbound channel queue growth in QUIC server causing Denial of Service.
   * - **OpenSSL 3.6.4**
     - ``CVE-2026-63075``
     - Low / DoS
     - Memory exhaustion due to retention of QUIC ACK-only packets.
   * - **Postfix 3.11.7**
     - *Security Fix*
     - High / SMTP Smuggling
     - Mitigation of SMTP Smuggling (spurious CR stripping) and remote DoS in ``smtpd``.
   * - **Memcached 1.6.45**
     - *Security Fix*
     - Medium / Memory & DoS
     - Fixed refcount overflow in ``binprot``, crawler module buffer overflow, and ASCII parser OOM segfault.
   * - **Log4j 2.25.4**
     - ``CVE-2025-68161``
     - Medium / Spoofing
     - Missing TLS hostname verification in Socket Appender.
   * - **WireMock 3.0.1**
     - ``CVE-2023-41329``
     - High / SSRF
     - Domain restriction bypass via DNS Rebinding.
   * - **Bouncy Castle 1.79**
     - ``CVE-2025-8916``
     - Medium / DoS
     - Unbounded resource allocation / throttling issue.
   * - **carbonio-ws-collaboration**
     - ``CO-3563``
     - High / XXE & SSRF
     - Hardened XML parsing in ``XmppMessageBuilder`` and ``MessageDispatcherMongooseImpl`` to disable DOCTYPE/XXE, preventing SSRF and arbitrary file read.
   * - **Calendar / FreeBusy**
     - ``YWH-PGM9081-51``
     - Medium (CVSS 5.3) / Info Leak
     - Removed unauthenticated access to Free/Busy availability data (``GetFreeBusyRequest`` and ``/service/pubcal/freebusy.ifb``) to prevent user enumeration.
   * - **SASL Auth Logging**
     - *Internal Fix*
     - Low / Credential Leak
     - Prevented plaintext passwords and authentication tokens from appearing in ``saslauthd`` and syslog.
   * - **ZxAuth EAS**
     - *Internal Audit*
     - Low / Audit Trail
     - Propagated real client IP address instead of ``127.0.0.1`` during ActiveSync authentication sessions.