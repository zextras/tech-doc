Release 25.9.0
=================


New Features and Enanchements(29)
---------------------------------

This section highlights the new features and the enanchements introduced
in this release. Each feature is designed to enhance user experience and
system functionality. New features and Enhancements are visible to end
users, for example, a new module, a new button, or a new option in a
dropdown.

Enable pagination for GAL user search in Chats (\ WSC-1445\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pagination improves user experience by displaying search results in
blocks of 10 users, allowing for efficient navigation when creating
Chats. This ensures scalability and performance when dealing with large
Global Address Lists (GAL).

Technical details:\  New attributes are introduced in
SearchUsersByFeatureRequest to handle pagination, including 'offset',
'more', and 'total' within the responses, enhancing the search
mechanism.

Related / Origin:\  WSC-194, CO-1489, CO-1294

UI automatically logs out after session expires (\ SHELL-287\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensures that the user interface logs users out once their session
expires, preventing unauthorized access to personal data during client
inactivity or prolonged reminders.

Technical details:\  The feature utilizes the attribute
zimbraAuthTokenLifetime to manage session expiration and logout
processes.

Related / Origin:\  ZIF-1126

Implements download functionality for directories and multiple nodes (\ FILES-952\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Users can now efficiently select and download multiple files or entire
directories in Carbonio Files, streamlining data backup and offline
access.

Technical details:\  A new endpoint allows users to download nodes
within a zip file, with preliminary checks via specific endpoints.
Enhancements include the right-click menu, hover actions, and
multi-selection mode. Config updates support maximum download size
settings.

Related / Origin:\  CO-2380, ZTD-1343

Focus changes correctly when opening a file in Carbonio Files (\ FILES-925\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances user experience by ensuring that the focus and highlight
correctly follow the opened file, preventing confusion and errors during
file navigation.

Technical details:

Related / Origin:\  CO-2109, CF-1106

Transfer ownership of documents and folders (\ FILES-611\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enables users to transfer ownership of files and folders to another
user. This is beneficial when a user changes roles or leaves a project,
ensuring continuous management of vital documents.

Technical details:\  Users can select multiple items and assign a new
owner. The system checks the new owner's storage quota before completing
the transfer. Existing permissions and shared links remain intact.
Transfers are definitive and items in the Trash cannot be transferred.

Related / Origin:\  FILES-402

Improve collaborator permissions interface and editing/removing shares (\ FILES-581\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The improved interface for managing collaborator permissions now offers
a more intuitive layout with better visibility of permissions, making
management of shared files or folders straightforward for
sysadmins/operators. Collaborators are displayed in a vertical list, and
permission adjustments are easier to access and modify.

Technical details:\  The previous chip-based design is replaced with a
vertical list displaying full names and email addresses. Permission
buttons are made larger with clear icons. The UI adapts based on user
permissions and offers tooltips for restricted actions. Planned future
enhancements include bulk collaborator removal.

Related / Origin:\  CDS-268, ZIF-443, ZIF-446, CDS-329, CO-2369, GB-801

Support license subscription in Chats module (\ CO-2429\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Chats module now adapts its visibility and functionality based on
license validity, ensuring admins and users only access licensed
features. This prevents confusion and maintains an optimized user
interface.

Technical details:\  When the Chats license is invalid, the module is
hidden or disabled with warnings depending on user role. For Global
Admins, the configuration card is removed from the Admin Panel.
Delegated Admins see a disabled Chats section with a warning. For end
users, the Chats icon is hidden from the navigation bar.

Related / Origin:\  CO-2417, CO-2444, WSC-1837

Allow deletion of emails using keyboard shortcuts (\ CO-2325\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances user experience by enabling the deletion of emails using the
Delete and Backspace keys, streamlining email management for users.

Technical details:\  Added keyboard shortcuts to delete emails. Users
can navigate between emails using the Up and Down arrow keys, press
Enter to select an email, and then use the Delete or Backspace key to
delete the selected email.

Related / Origin:\  CO-2228

Set maximum number of events in all-day calendar row (\ CO-2261\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Limits the number of all-day events displayed in the calendar grid,
enhancing usability when many events are scheduled for the same day.

Technical details:

Related / Origin:

Enhance Contacts Advanced Search with Additional Filters (\ CO-2236\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the Contacts advanced search with additional filters such as
first name, last name, multiple email addresses, company, job role, and
various phone numbers, improving search accuracy for administrators.

Technical details:

Related / Origin:

Adds basic keyboard support for Mails module (\ CO-2228, CO-1524\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduces essential keyboard shortcuts enhancing mail navigation,
enabling a smoother experience without relying on the mouse.

Technical details:\  Implementation includes Shift + Click for range
selection, Enter to open emails, Esc to close viewers or modals,
Del/Backspace to delete emails, and arrow keys for list navigation.
Improvements also address folder toggling and email focus management.

Related / Origin:\  CF-716, CO-2338, CO-2259, CO-2325, WSC-2041

Improve resource input validation in Calendar (\ CO-2199\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances user feedback for 'Equipment' and 'Meeting room' inputs in
Calendar, providing clear error messages and suggestions when inputs are
invalid, thereby improving user experience.

Technical details:\  Enhanced validation for resource inputs includes
error states and action icons for both valid and invalid entries. Allows
duplicates, spaces, and validates existing appointments with checks on
labels and email properties.

Related / Origin:\  CO-2044, CO-2214, CO-2210, CO-2209

Improve month view layout in Calendars (\ CO-2189\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the month view layout, allowing users to view all events on
days with many entries, improving readability and accessibility.

Technical details:\  The enhancement adds new keys for displaying
additional events and a 'Show more' button, enabling a complete list of
events that occur on the same day.

Related / Origin:\  CF-1229, CF-1284

Review License Panel to add contract end date (\ CO-2182\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clearer distinction between license validation expiry and subscription
expiry dates aims to reduce user confusion and support requests.

Technical details:\  License Panel updates include showing both the
license validation expiry and the subscription expiry dates, with
revised labels for clarity.

Related / Origin:\  ZIF-1390, ZIF-1189, CO-1753

Show active email filter status (\ CO-2159\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the email interface by visibly indicating which email filter is
currently active, reducing user confusion about missing emails when
filters like 'Not Read' are applied.

Technical details:

Related / Origin:\  CO-1963, GB-793, CF-1281

Enhance contacts advanced search with additional filters (\ CO-2157\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The advanced search for contacts now supports multiple filters, allowing
system administrators to efficiently locate contacts by various
attributes such as name, email, and organization.

Technical details:\  Users can search using multiple criteria including
first name, last name, email, phone number, company, job role, tags, and
select a specific address book to streamline the search process.

Related / Origin:\  CO-2237, CF-1276

Mail Composer supports emoji (\ CO-2156\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Users can now add emoji in the mail composer, allowing for enhanced
expression of tone and emotion in email communication.

Technical details:\  This enhancement introduces emoji support within
the mail composition interface. Users can now easily insert emoji while
drafting emails, providing a simple way to express tone, emotion, and
intent more clearly. The feature enhances the personalization of
messages and improves user engagement, especially in informal or
conversational contexts.

Related / Origin:\  ZIF-1329, CF-687

Display warning when special characters are used in Contacts/Calendars searches (\ CO-2150/2151\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Users will now see a warning if search queries in Contacts/Calendars
include special characters, ensuring they understand how search results
might be affected.

Technical details:

Related / Origin:

Focus changes appropriately when double-clicking on email (\ CO-2109\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves user experience by ensuring emails are highlighted correctly
when double-clicked, preventing confusion between selected and opened
items.

Technical details:

Related / Origin:\  FILES-925, FILES-944

Prevent duplicate values in advanced search filters for Mails, Contacts, and Calendars (\ CO-2095\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This enhancement eliminates the possibility of inputting duplicate
values in advanced search filters, promoting more efficient searches
across Mails, Contacts, and Calendars.

Technical details:

Related / Origin:\  CO-1994

Resource selection during event creation is enhanced (\ CO-2044\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The event creation process in Carbonio now provides immediate feedback
about unavailable resources, such as meeting rooms and equipment. This
improvement reduces user confusion and enhances the scheduling
experience.

Technical details:\  Conditionally rendered editor resources based on
availability, with loading and error state management. Validation added
to prevent unnecessary entries in the calendar resource fields.
Implemented a unified 'useFetchEditorResources' hook to manage resource
fetching.

Related / Origin:\  CO-2199, ZIF-1347, CF-691

Admin Panel and CLI warn on duplicated VirtualHostname (\ CO-1989\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

System administrators are now warned if a virtual hostname is already in
use when configuring domains via the Admin Panel and CLI. This prevents
potential conflicts that can disrupt services.

Technical details:\  The system performs a check to detect duplicate
VirtualHostnames and provides a warning to the user. This enhancement is
implemented in both the Admin Panel and CLI, allowing changes despite
duplicates.

Related / Origin:\  CF-827

Add visual notification on parent folders for unread emails in subfolders (\ CO-1983\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduces visual indicators on parent email folders to notify users of
unread emails in subfolders, enhancing awareness of unread messages.

Technical details:\  A badge now appears on the parent folder icon in
the secondary bar when subfolders contain unread emails. Hovering over
the folder displays a tooltip with the unread email count. This
functionality helps prevent oversight of unread messages hidden in
nested folders.

Related / Origin:\  CO-2232, CF-964, ZTD-1046

Add sharing link in Edit Calendar Properties modal (\ CO-1968\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the calendar functionality by integrating sharing options
directly into the 'Edit Calendar Properties' modal for improved ease of
access and usability.

Technical details:

Related / Origin:\  CF-1235, IRIS-5103

Differentiate filtering from sorting messages/conversations (\ CO-1963\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves clarity by separating filtering from sorting functions,
enabling users to use these features without confusion.

Technical details:\  Two separate lists have been introduced: one for
filtering messages and another for sorting them. An icon representing
sorting options is added. Sorting options include
'Ascending/Descending', 'From', 'Date', 'Subject', while filtering
options include 'Unread', 'Important', 'Flagged', 'Attachment'. A reset
button is available for the default main list view.

Related / Origin:\  CO-2159, IRIS-5099, ZIF-987, IRIS-5098, ZIF-941

Inform users about specific email editing/sending errors (\ CO-1959\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves error messaging by clearly indicating issues like invalid email
addresses or exceeded message size, allowing users to address problems
directly and successfully send emails.

Technical details:\  The system now displays specific error banners when
an email can't be sent due to invalid email addresses or exceeding
message size limits. Users see a warning banner with details about
invalid addresses and size limits, and the 'Send' button is disabled
until the issue is corrected. Also, information banners can be manually
closed.

Related / Origin:\  HIT-209, CO-2115, CO-2120, CO-2251, IRIS-4705

Add support for ephemeral data (\ CO-1066, CO-502\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This feature enables the use of an external Redis-like service to store
ephemeral data instead of using LDAP in order to improve and optimizing
performance for large-scale infrastructures.

Technical details:\  ephemeral data like auth tokens and login
information can be stored on Redis-like system, avoidng LDAP
fragmentation. Those data are often related to IMAP connection for
shared folders

Related / Origin:\  CO-502, CO-1067, ZTD-1241, CF-331

Update icon set to include share-off icons (\ CDS-329\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances user experience by updating the icon set to include share-off
icons, improving clarity in indicating share status.

Technical details:

Related / Origin:\  FILES-581

Set default value for carbonio_storages_download_enabled to false (\ CO-2517\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sets the default state of the storage download feature to disabled,
providing administrators with more control over enabling it as needed.

Technical details:

Related / Origin:\  CO-2468

| 

Third-parties update, CVE and Security fixes(11)
------------------------------------------------

This section outlines the security updates and fixes included in this
release. Security is a top priority, and these updates help protect your
data and systems.

Resolve possible injection vulnerability in Chats getUsers endpoint (\ WSC-2089\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This fix addresses an injection vulnerability in the Chats getUsers
endpoint, enhancing security by preventing unauthorized data exposure
through crafted requests.

Technical details:\  The solution involves adding a property to the
query string parameter in the openapi.yaml file, ensuring proper
validation and safeguarding against potential injection attacks.

Related / Origin:\  GB-752, GB-794

Harden and upgrade Tomcat on the Videoserver to close vulnerabilities and remove info-leaking defaults (\ WSC-2088 / WSC-2100 \ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves security on the Carbonio videoserver by upgrading Apache Tomcat
to resolve vulnerabilities like denial of service, remote code
execution, and memory leaks. Enhances the security of the Apache Tomcat
on the video server by removing default and example pages that could
reveal sensitive information. Helps prevent potential information
leakage.

Technical details:

Related / Origin:\  CO-2269, CF-1417, ZTD-1308, ZIF-1466, CF-1418

Migrate SDK to Java 17 (\ UM-49\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Migrating to Java 17 ensures the system benefits from the latest
performance improvements, security patches, and language features.

Technical details:\  Migrate the codebase to Java 17 and update
dependencies to resolve CVEs.

Related / Origin:

Remove circular dependency in carbonio-perl-email-date-format (\ IN-918\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Eliminates unnecessary dependency to improve package integrity and
system stability.

Technical details:\  The carbonio-perl-email-date-format package is
identified as unused and is removed to resolve any potential circular
dependencies.

Related / Origin:

Update Postfix to 3.10.3 and synchronize custom configurations (\ IN-904\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upgrades Postfix to version 3.10.3, ensuring Carbonio MTA custom
configurations are in sync with upstream defaults for better stability
and security alignment.

Technical details:

Related / Origin:\  IN-899

Update docs-editor to latest cp-25.04.3-2 (\ IN-903\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Updates the docs-editor to the latest version for improved stability and
performance.

Technical details:

Related / Origin:

Disable VRFY command in Postfix (\ IN-899\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhancing email server security by disabling the VRFY command in Postfix
prevents account enumeration by not revealing email address validity.

Technical details:\  The VRFY command in Postfix has been disabled to
prevent email enumeration attacks. Previously, the command could accept
an email address and reveal its validity. Now, issuing VRFY results in a
'502 5.5.1 VRFY command is disabled' message. The configuration change
requires setting 'disable_vrfy_command = yes' in Postfix.

Related / Origin:\  IN-904, CF-1215

Update Platform dependency for security/performance (\ IN-894\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Update memcached to 1.6.38

-  Upgrade carbonio-mariadb to 10.11 series

-  Update perl-crypt-openssl-rsa to version 0.35

-  Update perl-crypt-openssl-random to version 0.17

-  Update curl to version 8.14.1

-  Update ClamAV to version 1.4.3

-  Update to OpenJDK 17.0.15-6

-  Update OpenSSL to latest 3.5 LTS

-  Update Nginx to version 1.28.0

Technical details:

Related / Origin:\  IN-922, IN-894, IN-893, IN-892, IN-891, IN-889,
IN-888, IN-887, IN-886, IN-885

Anyone can revoke file sharing rights (\ FILES-941\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where users other than the original creator could
revoke and regenerate file sharing links, ensuring only the creator can
manage these links.

Technical details:\  A new mechanism for generating collaboration links
is implemented, with options for 'View', 'Edit', 'View and manage
sharing', and 'Edit and manage sharing'. Users select rights via a
dropdown menu to generate links, each with distinct option chips. If all
link types are used, the interface disables further link generation
until a link is revoked.

Related / Origin:\  CF-1236, CF-1254

Update jgroup to 3.6.20 and hsqldb to 2.7.4 (\ CO-2288\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Updating these libraries improves system stability and security by
leveraging the latest patches and performance enhancements.

Technical details:

Related / Origin:\  HIT-40

Prevent privilege escalation from Group Management Admin to Domain Admin (\ CO-2054\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This change addresses a security issue where Group Management Admins
could escalate their privileges to Domain Admins via the Admin Panel.
This prevents unauthorized access to domain-wide controls.

Technical details:\  The security group section is now hidden in the
Admin Panel for non-global admins. Only global admins can modify
security groups through the account editor.

Related / Origin:\  CO-2143, CF-896

| 

Improvements(64)
----------------

This section details the improvements made to the system, focusing on
performance and stability. Technical improvements are visible to system
administrators and may impact users even if they do not interact with
them directly.

Upgrade User Management SDK to version 0.5.6 (\ WSC-2104\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This upgrade ensures better performance and compatibility in user
management functions for both Carbonio and Carbonio CE.

Technical details:

Related / Origin:

Move imports from shell-ui to carbonio-ui-soap-lib module (\ WSC-2057\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances module organization by relocating SOAP-related functionalities,
improving maintainability.

Technical details:

Related / Origin:\  FILES-957

Configure file descriptor limits for better scalability (\ WSC-2056\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This enhancement increases the file descriptor limits to allow the
server to handle more simultaneous connections, improving scalability
for production environments.

Technical details:\  File descriptor limits are increased using
systemd's LimitNOFILE and LimitNOFILESoft parameters set to 1048576.
This adjustment is applied to multiple service units, including
ws-collaboration, ws-collaboration-sidecar, message-dispatcher,
message-dispatcher-sidecar, carbonio-message-broker, and
carbonio-message-broker-sidecar.

Related / Origin:\  WSC-2099

Implement Websocket API versioning (\ WSC-2015\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves communication and backward compatibility between frontend and
mobile clients by implementing API versioning for WebSocket connections.

Technical details:\  Implemented WebSocket API versioning using
subprotocol negotiation as per RFC 6455, Section 1.9. A temporary
default version (1.6.0) has been introduced for backward compatibility.
Versions are proposed by clients and negotiated during the handshake
phase. The use of asyncapi specification was considered but replaced
with YAML due to better suitability.

Related / Origin:

Implement API versioning (\ WSC-1947\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduces API versioning to ensure backward compatibility between
backend and client applications, improving development and integration
processes.

Technical details:\  This change applies header-based versioning using a
custom header 'X-WSC-API-VERSION'. If the backend does not support the
client version, the API will return a 422 status code.

Related / Origin:

Bump mailbox SDK version (\ UM-47\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Updates to the mailbox SDK improve stability and performance for
mailbox-related operations.

Technical details:\  Bumped to version 1.11.0. Changes can be reviewed
at: https://github.com/zextras/carbonio-mailbox-sdk/pull/57

Related / Origin:

Move SOAP related features to a new specialized module (\ SHELL-271\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SOAP related features have been extracted from the main Shell to improve
modularization. This allows for better maintainability and decouples
SOAP services.

Technical details:\  SOAP features have been moved into a dedicated npm
module to provide better encapsulation and management. The module
includes handling of SOAP polling, storage, and notification through the
window object and custom events. Old exports have been deprecated, and
the folder structure has been reorganized.

Related / Origin:\  CO-1951, CO-2139, CO-2140, CO-2141

Preview connects to lookup via Consul (\ PREV-156\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Allows more reliable service discovery by connecting Preview to the
lookup service through Consul, replacing the deprecated memcached
configuration.

Technical details:

Related / Origin:\  GB-783

Unify Preview service configuration (\ PREV-153\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Simplifies configuration for Preview service by supporting optional
config.ini and enabling environment variable overrides. This change
facilitates flexible deployment setups.

Technical details:\  Configuration can now be managed via an optional
config.ini file or environment variables such as PREVIEW_HOST and
PREVIEW_PORT for networking parameters. This allows sysadmins to
override default hardcoded configuration values easily.

Related / Origin:\  FILES-955, ZPE-1151, GB-783, GB-812

Integrate all services under carbonio.target for uniform restarts (\ IN-881\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

System administrators can now restart all Carbonio services with a
single systemctl command, reducing manual intervention and oversight
(applicable only to systemd-based distributions: Red Hat 9 and Ubuntu
24.04).

Technical details:\  All services are linked to carbonio.target or its
dependencies like carbonio-mta.target and carbonio-proxy.target.
Services previously unmanaged by carbonio.target are now included using
soft dependencies.

Related / Origin:\  ZTD-1259, IN-919

Bump mailbox SDK version in Drive migration tool (\ FILES-962\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Updates the SDK used in the Drive migration tool to improve performance
and compatibility.

Technical details:

Related / Origin:

Move imports from shell-ui to carbonio-ui-soap-lib module (\ FILES-956\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The SOAP-related features have been consolidated into the
carbonio-ui-soap-lib, improving code organization and maintenance.

Technical details:

Related / Origin:\  CO-2155

Unify configuration for all projects (\ FILES-955\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances consistency and manageability in backend service configurations
by standardizing configuration methods and storage locations.

Technical details:

Related / Origin:\  UM-44, TSK-109, PREV-153, FILES-954, DOCS-231

Unify configuration for backend projects (\ FILES-954\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Provides a unified configuration structure for backend projects,
allowing easier management and customization through a centralized
configuration file.

Technical details:\  Configurable properties include service host and
port settings within /etc/carbonio/files/config.properties. Defaults are
provided, and custom settings can be easily applied. Example services
include Files, Docs Connector, Mailbox, Message Broker, PostgreSQL,
Preview, Storages, and User Management.

Related / Origin:\  FILES-955

Enable reset filters button immediately in owner and keyword fields (\ FILES-940\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the user experience in the filtering system by enabling the
'Reset Filters' button as soon as typing begins in the 'Owner' or
'Keyword' fields, allowing changes to be undone instantly.

Technical details:\  The 'Reset Filters' button in the file search
interface now activates immediately as the user begins typing in related
fields, including 'Owner' and 'Keyword'. This change permits clearing of
input at any state, improving interaction flexibility.

Related / Origin:\  CO-2012

Unify configuration of backend projects (\ DOCS-231\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Standardizes configuration across backend projects, enhancing
manageability and consistency for sysadmins. Custom configurations can
be defined via config files, allowing tailored service connections.

Technical details:\  Unified configuration allows customized service
start and connection settings via
/etc/carbonio/docs-connector/config.properties. Default or custom values
can be used for various components, enhancing flexibility.

Related / Origin:\  FILES-955

Remove deprecation warning from HA CLI command output (\ CO-2484\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Removes deprecation warnings from HA CLI commands to prevent script
disruptions for users of older habeat scripts. This change supports a
smoother transition to the new namespace.

Technical details:\  Removed deprecation warning about namespace change
from the CLI to avoid breaking scripts. This is to ensure a seamless
transition for users relying on the old namespace.

Related / Origin:\  CO-2195

Manage ft_wsc_basic license on Chats (\ CO-2433\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhance license management by ensuring that if ft_wsc_basic is not
included in the license, related UI attributes are disabled.

Technical details:

Related / Origin:\  WSC-1857

Link license service with Chats (\ CO-2432\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Integrates the license management functionality with Chats, allowing
services to access the license JSON via a new centralized service.

Technical details:\  The carbonio-license-sdk has been extended to
fetch, read, and validate licenses from the key-value store. A new
service, 'carbonio-license', handles writing, reading, and verifying the
license data, requiring updates to policies.json.

Related / Origin:\  WSC-1856

Revert Delete key interaction to prevent accidental deletions (\ CO-2332\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This change prevents the accidental deletion of conversations or
messages caused by pressing the Delete key while typing in an input
field, addressing an issue with event bubbling.

Technical details:

Related / Origin:

Refactor mailbox test to remove indirect dependencies (\ CO-2321\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves test maintainability by simplifying account creation in mailbox
tests, allowing easier use and understanding for developers.

Technical details:

Related / Origin:

Update API for backup smart scan and purge configurations (\ CO-2306\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the Admin Panel functionality to manage backup settings with
enhanced configuration options for scheduling and enabling/disabling
processes.

Technical details:\  The API payload update involves adding new
attributes for \`backupSmartScanScheduler\` and
\`backupPurgeScheduler\`, allowing for cron pattern configuration and
enabling or disabling these features globally.

Related / Origin:

Remove redundant setting code from Admin Panel (\ CO-2275\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This improves the maintainability of the Admin Panel by eliminating
unnecessary code, simplifying future updates.

Technical details:

Related / Origin:\  SHELL-292

Ensure reliable product version detection at startup (\ CO-2243\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves reliability in distinguishing between Carbonio and Carbonio
Community Edition installations, preventing user interface
inconsistencies and potential customer confusion.

Technical details:\  Enhancements made across login and Admin Panel
interfaces to better detect and handle Carbonio versus Carbonio CE
installations. Involves changes to catalog services and requires new
proxy handling. The catalog service has become a required service, and
its licensing has been updated.

Related / Origin:\  ZIF-1389, EI-5

Storage cache thread leak resolved (\ CO-2227\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes a thread leak in the storage cache mechanism. Administrators can
now manage cache download threads using a new configuration attribute.

Technical details:\  A new configuration attribute,
localStoreCacheThreadPoolConfig, has been introduced to manage cache
download threads. This attribute is server and global-based, allowing
administrators to set corePoolSize, maxPoolSize, and keepAliveTime
parameters. Restart is required after changes.

Related / Origin:

Remove usages of deprecated attributes (\ CO-2224\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This update removes obsolete code, helping to maintain a cleaner
codebase without affecting existing functionality.

Technical details:

Related / Origin:

Remove usages of SmimeFeatureEnabled (\ CO-2223\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the system by removing obsolete checks for S/MIME feature
support, streamlining operations.

Technical details:

Related / Origin:

Remove ChildAccount class and usages (\ CO-2222\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances system maintainability by removing obsolete code related to
ChildAccount.

Technical details:

Related / Origin:

Remove 'UC' attribute usages where possible (\ CO-2221\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances system maintainability by eliminating unnecessary 'UC'
attribute references, potentially reducing complexity.

Technical details:

Related / Origin:

Remove deprecated LDAP attributes from code generation (\ CO-2220\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Deprecated LDAP attributes have been removed from code generation,
reducing unnecessary handling in the system. This change simplifies the
codebase without impacting existing LDAP data.

Technical details:

Related / Origin:

Prevent saveEditor invocation during email sending with smart links (\ CO-2213\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This improvement reverts changes that caused performance degradation
when sending emails with smart links. The editor now functions as
originally intended, enhancing overall efficiency.

Technical details:

Related / Origin:\  CO-2177, CO-1707

Mailbox avoids uncontrolled use of System.exit (\ CO-2208\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves system stability by preventing unexpected application crashes,
allowing for error recovery and better system reliability.

Technical details:

Related / Origin:

Remove admin APIs related to zimlets (\ CO-2205\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The removal of specific admin APIs simplifies the system by eliminating
redundant functionality related to zimlets. This change helps maintain
compatibility with future enhancements to the Admin Panel.

Technical details:

Related / Origin:

Remove usages of zimbraFeatureChatEnabled and deprecate the attribute (\ CO-2203\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This change simplifies the configuration by removing deprecated
references to zimbraFeatureChatEnabled. Admins no longer need to manage
this attribute.

Technical details:

Related / Origin:

Remove old XMPP chat classes and usages (\ CO-2201\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Old XMPP chat classes and their usages have been removed from the
codebase to streamline the system and reduce maintenance overhead.

Technical details:

Related / Origin:

Add nginx.conf.web.upstreams configuration (\ CO-2197\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Allows upstreams customization by moving their definitions to a separate
configuration file. No expected impact on current behavior.

Technical details:

Related / Origin:

Remove dead code related to additional quota provider in Mailbox (\ CO-2196\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Streamlines the Mailbox code by eliminating obsolete and unused code
related to an additional quota provider, reducing maintenance overhead
and potential confusion.

Technical details:

Related / Origin:

Rename CLI commands and module from 'ha' to 'MailReplica' (\ CO-2195\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Updates the CLI commands to align with the new MailReplica terminology
while retaining backward compatibility with the old 'ha' commands. This
change assists system administrators in transitioning to the updated
namespace without immediate disruption.

Technical details:\  The transition introduces the
MailReplicaRootCommand utilizing the existing HA command logic. Both
'carbonio ha' and 'carbonio mailreplica' commands are supported
simultaneously, ensuring backward compatibility.

Related / Origin:\  ZPE-1183, CO-2484, ZIF-1388

Move nginx-lookup-store into mailbox code (\ CO-2181\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Integrating nginx-lookup-store into the mailbox codebase ensures tighter
dependency management and reduces configuration issues when deploying in
containerized environments. This change simplifies the setup process and
improves stability.

Technical details:\  The nginx-lookup-store, previously part of a
separate package, is now incorporated into the mailbox.jar. This
integration resolves dependency management issues related to the
commons-net library.

Related / Origin:

Modify notification message for backup migration (\ CO-2166\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the clarity of backup migration success notifications,
providing better feedback to administrators.

Technical details:\  The notification now reports the updated backup
volume path and provides actionable guidance for cleaning up residual
data.

Related / Origin:\  ZIF-1106, CO-940

Move imports from shell-ui to carbonio-ui-soap-lib module (\ CO-2140\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The transition of SOAP-related features to a dedicated library enhances
the modularity and maintainability of the Calendars component, reducing
potential integration issues.

Technical details:

Related / Origin:\  SHELL-271

Move imports from shell-ui to carbonio-ui-soap-lib module (\ CO-2139\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This change simplifies maintenance by centralizing SOAP-related features
into the carbonio-ui-soap-lib library, streamlining updates and future
enhancements.

Technical details:\  SOAP-related imports have been relocated from
shell-ui to the carbonio-ui-soap-lib module. Changes involve direct
import usage in Calendars and replacing the useRefresh and useNotify
hooks.

Related / Origin:\  SHELL-271

Disables account selection in quota usage table in Admin Panel (\ CO-2137\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the Admin Panel's usability by preventing misleading account
selection in the quota usage table, reducing administrative errors.

Technical details:

Related / Origin:\  CO-1988

Convert Contacts module to use carbonio-ui-commons npm package (\ CO-2119\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves maintainability by standardizing the Contacts module on the
carbonio-ui-commons npm package.

Technical details:

Related / Origin:\  CO-2067

Convert Calendars module to use carbonio-ui-commons (\ CO-2118\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the maintainability and consistency of the Calendars module by
adopting the common package for shared code and configurations.

Technical details:\  The conversion includes moving ESLint and
TypeScript configuration to the local project as well as test mocks,
utilities, and configurations.

Related / Origin:\  CO-2067

Convert Mails module to use carbionio-ui-commons npm package (\ CO-2117\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Streamlines the integration of the Mails module with the common UI
components, reducing dependency overhead and simplifying project
structure.

Technical details:

Related / Origin:\  CO-2067

Add region parameter to customS3 bucket (\ CO-2116\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enables specifying a region when creating a custom S3 bucket, enhancing
flexibility for system configurations.

Technical details:

Related / Origin:

Convert Calendar settings from JSX to TSX (\ CO-2113\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The conversion from JSX to TSX improves type safety and maintainability
of the Calendar settings component, enhancing the backend performance.

Technical details:

Related / Origin:

Remove references to wiki.zextras.com (\ CO-2100\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This task addresses the removal of outdated references to a disabled URL
within the codebase, improving maintainability and accuracy of
documentation links.

Technical details:

Related / Origin:\  CO-890

Fix input placement in advanced filters modal across modules (\ CO-2094\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensures that when users switch modules and reopen the Advanced Filters
modal, only relevant search criteria for the selected module are
displayed, preventing cross-module input errors.

Technical details:\  The solution focuses on clearing irrelevant values
in the advanced filters when a user navigates between different modules.
For example, subject or sender fields from the Mail module are cleared
when switching to the Files module.

Related / Origin:\  CO-1994

Fix Advanced Filters modal behavior on close (\ CO-2091\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the behavior of the Advanced Filters modal in the Search
module, ensuring field contents persist or reset based on search
actions. Enhances user workflow efficiency in managing search criteria.

Technical details:

Related / Origin:\  CO-1994

Improve Advanced Search functionality (\ CO-1994\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhancements made to the Advanced Search functionality, improving
usability and consistency across modules. This will aid sysadmins in
performing and managing complex searches more effectively.

Technical details:\  Refactoring involved aligning misalignments in the
Contacts module, addressing button misalignments across all modules, and
ensuring a consistent naming and function of search-related buttons.

Related / Origin:\  CO-1219, CO-1223, CO-1232, CO-1960, CO-1215,
CO-1217, CO-1221, CO-1216, CO-2004, CO-1952, CO-1998, CO-1744, CO-2006,
CO-2005, CO-1225, CO-1930, ZIF-932, CO-2036, CO-2050, CO-1229, CO-2069,
CO-2091, CO-2060, CO-2094, CO-2095, CO-1743, CO-2066, CO-2065

Import SOAP features from carbonio-mailbox-api-ui (\ CO-1951\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances maintainability by integrating SOAP features directly in Mails
from the new library, ensuring the latest updates are used. Operators
must adjust polling intervals explicitly in the Mails settings.

Technical details:

Related / Origin:\  SHELL-271

Clean up Mailbox Split Mode (\ CO-1768\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Removes unsupported configurations in Mailbox's web.xml related to Split
Mode, improving code clarity and maintainability.

Technical details:

Related / Origin:\  CO-1767

Improve SmartLink logic for large file uploads (\ CO-1707\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Optimizes handling of large email attachments by converting them
directly to SmartLinks, reducing wait times and preventing misleading
errors during email composition.

Technical details:\  On uploading a large file, the process now prompts
to convert it directly to a SmartLink, bypassing the Mailbox and
directly calling the Files API. This avoids the lengthy saveDraft
process that computes attachment sizes.

Related / Origin:\  CF-872, CO-1731, CO-1732, CO-1738, CO-2213, CF-847

Implement useAuthenticated hook for Mails (\ CO-1537\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the security context handling within the Mails component by
utilizing the useAuthenticated hook from the shell, ensuring more
efficient authentication processes.

Technical details:\  The useAuthenticated hook implementation was
previously incorporated into the code, improving how Mails functions
within the authentication framework.

Related / Origin:

Ensure file integrity during download from Amazon S3 (\ CO-1452\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A new logic check prevents file corruption issues during S3 downloads,
reducing service disruptions caused by corrupted files.

Technical details:\  File logical size checks have been implemented
before each download to prevent issues with corrupted files in the
Carbonio preview service.

Related / Origin:\  HIT-64, CF-581

Reorder date range fields and remove 'Sent On' filter in Mail's Advanced Search (\ CO-1225\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Advanced Search for the Mails module is more intuitive by reordering
date fields to 'Sent after' and 'Sent before', enhancing the alignment
with typical date input behavior. This update improves search accuracy
and user experience.

Technical details:\  In the Advanced Filters for the Mails module, the
seldom-used 'Sent on' filter was removed. The date fields were reordered
to create a logical flow which aids in easier and more intuitive date
range input.

Related / Origin:\  CO-1994, IRIS-4096

Reduce LDAP load and fragmentation from frequent auth-token creation (\ CO-1067\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Transitioning to a Redis ephemeral store reduces LDAP load and database
fragmentation caused by frequent authentication token creation for IMAP
accounts using shared folders. This enhances performance and ensures
efficient resource usage.

Technical details:\  Authentication tokens for IMAP operations in shared
folders are now stored in a Redis ephemeral store instead of the LDAP
backend. This change helps avoid excessive writes and fragmentation in
the LDAP database.

Related / Origin:\  CO-1066, CF-319

New /download endpoint in carbonio-storages-service (\ CO-2230, CO-2229, CO-2147, CO-2468\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduces a download endpoint within the carbonio-storages-service,
enabling services to directly connect HTTP based storage, avoiding usage
of mailstore cache. This change improves the efficiency and reliability
of the carbonio-storage-service.

Technical details:\  The endpoint supports external HTTP filesystem,
like S3 and swift. Storage configuration shared using centralized
Postgres. A feature flag named 'carbonio_storages_download_enabled' is
introduced. When enabled, Carbonio will use carbonio-storages-service
for downloads instead of the default endpoint.

Related / Origin:

Replace soapfetch references from Shell to soap-lib in auth-ui (\ CO-2545\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the stability and maintainability of authentication features by
consolidating SOAP-related functionality into a dedicated library.

Technical details:

Related / Origin:\  —

Remove AsyncFS and NioFS (\ CO-2493\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Removes unused class hierarchies to improve code maintainability.

Technical details:

Related / Origin:\  —

Migrate SOAP to carbonio-ui-soap-lib (\ CO-2154\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Replaces shell-soap-utils with new library utilities to improve backend
scalability and maintainability.

Technical details:

Related / Origin:\  —

Email field required in contact creation (\ CO-1722\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Requiring an email address when creating contacts ensures they appear
correctly in autocomplete searches and other modules, enhancing
usability for sysadmins.

Technical details:\  The email field is now mandatory in the contact
creation process to avoid 'undefined' labels and ensure consistent
integration across the system modules like Calendar and Mail.

Related / Origin:

| 

Bug Fixes(90)
-------------

| 

Fix missing reaction chip information (\ WSC-2101\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where reaction chips in chat message bubbles would not
display correct names or avatars after reloading or opening a meeting
page.

Technical details:

Related / Origin:

Fix file descriptor limit in carbonio-message-dispatcher (\ WSC-2099\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where the carbonio-message-dispatcher service could
exhaust file descriptors, affecting large infrastructures. This fix
ensures the service can handle more simultaneous connections, preventing
service interruptions.

Technical details:\  The systemd configuration for
carbonio-message-dispatcher.service has been updated to increase the
LimitNOFILE parameter to 6553, allowing more open socket connections.
This change addresses issues in environments with a high number of
active users.

Related / Origin:\  WSC-2056, HIT-18

Restrict recording folder selection to writable single folders (\ WSC-2098\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the selection process by ensuring users can only choose
writable folders as recording destinations. Eliminates errors caused by
selecting read-only or multiple folders.

Technical details:\  Implement maxSelection: 1 and isValidSelection in
the modal to restrict folder selection to a single folder with write
permissions.

Related / Origin:\  CO-2342

Fix webcam view disruption during screen sharing in Calls (\ WSC-2085\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue in Calls where resizing the window or enabling screen
share disrupted the webcam view for other participants. This affected
calls with more than five participants, especially when using Firefox or
Chrome.

Technical details:

Related / Origin:\  CO-2467, HIT-122

Default devices not set correctly (\ WSC-2071\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where Chats did not retain the selection of audio and
video devices, affecting user experience by reverting to default devices
upon entering a room.

Technical details:

Related / Origin:\  HIT-43

Fix forwarding of messages with special characters or emoji (\ WSC-2067\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where users could not forward messages containing
emojis or special characters, preventing errors and ensuring reliable
message forwarding.

Technical details:\  The message content insertion method was changed
from innerHTML to textContent to handle special characters and emojis
correctly, preventing invalid XML markup errors.

Related / Origin:

Unread badge appears on chat after message is read (\ WSC-2061\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This fix resolves an issue where the unread badge incorrectly appeared
on Chats after the message was read, ensuring accurate message status
across all groups.

Technical details:

Related / Origin:

Fix incorrect highlight color when clicking on referenced message (\ WSC-2060\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the highlight color for referenced messages did
not match the active theme, improving the user experience in both dark
and light modes.

Technical details:\  The issue arose because the property for detecting
the current theme was not properly read, leading to mismatch in
highlight colors. Ensured the use of the correct dark mode property
'carbonioPrefDarkMode'.

Related / Origin:\  CO-2250

Fix unread reaction badge when input is focused (\ WSC-2052\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where reaction badges in Chats remain unread if a
user's message receives a reaction while the input is already focused.
This ensures accurate message notification.

Technical details:

Related / Origin:

Keep caption of first failed attachment (\ WSC-2042\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When an attachment with a caption longer than 220 characters fails to
send, the caption is retained in the user's input field, preventing data
loss.

Technical details:

Related / Origin:\  WSC-2043

Fix attachment title overflow in Chats without preview (\ WSC-2031\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves the issue of long attachment titles overflowing in Chats when
no preview is available by truncating them and adding a tooltip for full
visibility.

Technical details:

Related / Origin:\  GB-789

Fix scroll position above last message in Chats (\ WSC-1877\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Addresses an issue in Chats where scrolling would not automatically
position on the last message, requiring manual adjustment by users.

Technical details:

Related / Origin:\  WSC-1874, CF-980

Fix UI refresh issue when pasting certain control characters in Chats text field (\ WSC-1865\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where pasting specific control characters into the
Chats text field caused the interface to refresh. This fixes potential
disruptions during message composition.

Technical details:\  Implemented input sanitization on the client side
to filter out invalid control characters, preventing them from causing a
stream error in the XMPP connection.

Related / Origin:\  WSC-1125, CO-1580

Adjust cursor positioning after inserting emoji (\ WSC-1821\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes the cursor position issue in Chats where it moved to the end of
the sentence after inserting an emoji, improving message composition
experience for users.

Technical details:

Related / Origin:

Hovering menu icons shows labels (\ SHELL-291\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Restores the functionality where labels are shown when hovering over
menu icons in Carbonio Webmail, improving usability and aiding users
unfamiliar with the icons.

Technical details:

Related / Origin:\  CF-1363

Session timeout now logs out user after idle period (\ SHELL-288\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensures that user sessions in Carbonio WebUI are properly ended after a
configured idle time, enhancing security by automatically logging out
inactive users.

Technical details:\  The existing functionality to configure session
idle time using the attribute zimbraMailIdleSessionTimeout was corrected
to ensure it logs out the user after the specified inactivity period.
This involves automatically expiring the authentication token when the
session times out.

Related / Origin:\  CF-1158

Fix wrong KillSignal for sidecar systemd units (\ IN-917\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where sidecar units using /usr/bin/consul did not
terminate correctly, impacting shutdown procedures when stopping
carbonio.target.

Technical details:

Related / Origin:

Fix inconsistent error handling with zmsaupdate (\ IN-911\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This resolves an error handling issue in zmsaupdate on systemd-based
distributions, improving stability and usability for system
administrators.

Technical details:\  On systemd-based distributions, zmsaupdate now
exits successfully without performing any actions if systemd targets are
enabled. This update ensures backward compatibility with distributions
like Ubuntu 22.04 and RHEL8. The sa-update and sa-compile processes are
shifted to a systemd unit controlled by the
carbonio-mailthreat-update.timer, included in the carbonio-amavisd
package and aligned with existing cron scheduling.

Related / Origin:\  CF-1404

Fix Nginx startup issue due to missing nginx.conf (\ IN-905\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where Nginx could not start due to a missing
configuration file. This fix ensures Nginx can successfully start and
load the configuration, improving system reliability.

Technical details:\  The error was caused by a method name change in the
mailbox which was not updated in carbonio-jylibs commands.py.
Specifically, the method ProxyConfGen.createConf was missing, as noted
in the configd log. The issue originated from a specific commit in the
Carbonio mailbox.

Related / Origin:\  GB-788

Fix components.json duplication post-upgrade (\ IN-864\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where components.json had duplicate entries or missing
UI modules after upgrading the proxy component, particularly affecting
versions 24.12 and 25.3. This ensures consistent functionality and
prevents errors in UI module availability.

Technical details:\  Issue mitigated in post-installation script. It now
considers only the latest modified folders during the generation of
components.json, reducing the chance of duplication despite not being an
ideal long-term solution.

Related / Origin:\  CF-1141

Fix document opening issue after editor update (\ DOCS-234\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where accessing documents in the latest Carbonio Docs
Editor update resulted in a blank page. This fix ensures the
CheckFileInfo operation no longer fails, preventing 401 error codes.

Technical details:\  The problem arose due to a malformed URL in
Collabora’s backend, which added an extra '?' when constructing the URL
for the CheckFileInfo operation. This patch corrects the URL
construction, ensuring proper functionality.

Related / Origin:\  GB-791

Preview doesn't work with default configuration (\ CO-2486\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where the preview service failed with the default
configuration due to improper use of HTTP instead of HTTPS. This fix
ensures that previews function correctly without manual configuration
changes.

Technical details:

Related / Origin:\  GB-796, GB-814

Fix ZAL version misalignment (\ CO-2482\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This fix resolves the discrepancy between the reported ZAL version in
the CLI and server. Ensures consistent version tracking across platforms
for accurate system management.

Technical details:

Related / Origin:\  GB-796, GB-813

Resolve S3 bucket connection errors (\ CO-2479\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixed an issue where configuring and testing the connection with an S3
bucket resulted in an error. This ensures reliable integration with S3
storage, allowing operators to store and retrieve data seamlessly.

Technical details:

Related / Origin:\  GB-796, GB-811

Fix clean-up issue for region or URL with doUpdateBucket (\ CO-2476\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved issue where administrators were unable to clear either the
region or URL settings when updating a bucket configuration, allowing
for correct switching between settings.

Technical details:

Related / Origin:\  GB-796, GB-808

Fix inline attachments lost during message forwarding (\ CO-2475\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Addresses the issue where inline attachments were not being retained
when forwarding emails, ensuring that all attachments appear correctly
in the composer and the sent emails.

Technical details:

Related / Origin:\  CO-2255, HIT-140

Fix regression causing video stream issues when enabling/disabling screen share or webcam (\ CO-2467\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where toggling screen share or webcam disrupted video
streams for other participants. This fix ensures seamless video calls.

Technical details:

Related / Origin:\  WSC-2085, WSC-2108, HIT-134

Increase connection limit for Carbonio Chats from 1024 to 65536 (\ CO-2426\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where Carbonio Chats could not handle more than 1024
concurrent connections, making it unsuitable for large infrastructures.
The fix increases the max connection limit to 65536, aligning with
system capabilities.

Technical details:\  Max connection limits have been adjusted in the
service-protocol.json files on both the carbonio-proxy and
carbonio-ws-collaboration sides, setting the limit to 65536. The Jetty
configs (MAX_THREADS, MIN_THREADS, MAX_QUEUE_REQUESTS) are now exposed
on consul k/v for better configurability.

Related / Origin:\  WSC-2073, HIT-51

Fix Carbonio Chats memory leak causing OutOfMemoryError (\ CO-2392\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves a memory leak in Carbonio Chats that caused OutOfMemoryError
due to improper handling of websocket connections.

Technical details:\  The problem was identified in the
SessionPingManager component of carbonio-ws-collaboration, where a
ScheduledExecutor was incorrectly continuing tasks after websocket
connections had closed. Refactoring was done to stop tasks when sessions
terminate. Additionally, the caffeine cache was replaced with a
concurrent hash map and the ping interval was increased to reduce
network traffic.

Related / Origin:\  WSC-2103, HIT-41

Fix ActiveSync state table excessive growth issue (\ CO-2309\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue with excessive growth of the ActiveSync state table in
PostgreSQL, which could lead to storage issues in environments with
large mailboxes. The problem was caused by the failure of scheduled
cleanups and insufficient manual cleanup processes.

Technical details:\  Implemented deletion of old state data when
inserting new data to manage table size. Optimized queries with indexing
and enabled transaction-free deletion scripts to handle the large
dataset efficiently.

Related / Origin:\  CO-2315, ZPE-1243, CF-1451

Fix faulty rendering of links in HTML message preview (\ CO-2308\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves issues where mailto: URLs in Carbonio Webmail were not properly
detected or rendered. This fix ensures full mailto: links, including
query parameters, are rendered correctly, improving the usability of
messages containing such links.

Technical details:\  Refactor of the HTML mail message renderer to
improve maintainability and centralize related functionality. The text
rendering logic is moved into an isolated package, and the business
logic is separated from the presentation layer.

Related / Origin:\  CO-2244

Import commercial certificate for S/MIME fixed (\ CO-2295\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue preventing the import of commercial S/MIME
certificates when the Certificate Authority (CA) is not included. This
allows users to successfully import p12 certificates containing only the
end-user certificate and key.

Technical details:

Related / Origin:\  CF-1422

Resolve incorrect timezone for password recovery emails (\ CO-2293\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where password recovery emails were sent with incorrect
timestamps due to GMT usage, impacting user experience across different
time zones.

Technical details:

Related / Origin:\  HIT-77, CF-524

Fixes unexpected modal window appearance when navigating tabs in Admin Panel backup section (\ CO-2289\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves the issue where an unnecessary modal window would appear when
switching between tabs within the backup section of the Admin Panel.

Technical details:

Related / Origin:\  GB-752, GB-780, GB-802

Remove outdated mobile app links from appointment invites (\ CO-2274\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The appointment invite emails no longer contain links to deprecated
mobile apps, ensuring recipients only receive relevant information.

Technical details:

Related / Origin:

Fixes date validation error in advanced search filter for past dates (\ CO-2272\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue in the advanced search filter where selecting past
dates would trigger an 'Invalid time value' error. This fix ensures
compatibility with non-US date formats, crucial for French and Italian
interfaces.

Technical details:

Related / Origin:\  HIT-177, CF-1431

Resolve rescheduling malfunction for appointments in version 25.6 (\ CO-2270\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue preventing proper rescheduling notifications for
appointments in version 25.6, ensuring users receive correct updates.

Technical details:

Related / Origin:\  TAU-208, CF-1430

Fix plaintext signature handling in mail composer (\ CO-2268\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves issues with handling plaintext signatures, preventing data loss
and incorrect text removal when composing emails in plaintext mode.

Technical details:\  Fix addresses broken plaintext signature handling
by improving quoted text separator management and enabling proper
signature replacement. Updates to the getMailBodyWithSignature function
and dedicated plaintext generation for replies ensure reliability.

Related / Origin:

Restore missing Composing Messages option in settings (\ CO-2267\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Composing Messages option, which allows users to configure email
composition settings, is now available again in the settings panel.

Technical details:

Related / Origin:

Emails have 'undefined' body when attachments are present in WebUI (\ CO-2266\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix intermittent issue where emails sent from WebUI with attachments
have 'undefined' as the body. This ensures messages are correctly
formatted and stored, maintaining communication integrity.

Technical details:

Related / Origin:\  GB-786, CF-1415

Fix message body visibility for forwarded PlainText emails (\ CO-2264\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the body content of plain text emails becomes
invisible when forwarding, impacting user workflows. Ensures complete
visibility of email content in all scenarios.

Technical details:\  Implementation of a new boolean property for mail
parts to properly differentiate between message body and attachments.
Updated logic to exclude content marked as body from attachment lists.

Related / Origin:\  CO-2215, CF-1396

Forwarding attaches PEC correctly (\ CO-2255\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where PEC attachments were not included when
forwarding emails, ensuring all intended documents are sent.

Technical details:

Related / Origin:\  CF-1410, CF-1413, CO-2475, HIT-49

Fixes error messaging when sending to non-existing local addresses (\ CO-2251\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The system now properly informs users when an email cannot be sent due
to an invalid local address. This prevents confusion from generic errors
and aids in troubleshooting address-related issues.

Technical details:

Related / Origin:\  CO-1959, CO-2247, HIT-17

Provides informative error for invalid internal email addresses (\ CO-2247\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enhances the system's error messages when sending emails to non-existing
internal addresses, aiding quick troubleshooting for administrators.

Technical details:

Related / Origin:\  CO-2251

Expose zimbraAuthLdapExternalDn in Admin Panel (\ CO-2246\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the zimbraAuthLdapExternalDn attribute was not
exposed in the Admin Panel, facilitating advanced AD authentication
configurations for better user-mapping.

Technical details:

Related / Origin:\  HIT-106, CF-1259

Fixes faulty rendering of links in text message previews (\ CO-2244\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue in Carbonio Webmail where mailto links were improperly
rendered, leading to incorrect or incomplete hyperlink generation. This
fix ensures complete and accurate detection and rendering of mailto
links, improving user experience and reliability.

Technical details:\  Replaced the custom URL detection implementation
with the Autolinker library to improve link detection accuracy and
reliability. This includes precise handling of mailto links, Unicode
support, and secure link handling by enforcing target and rel
attributes. Removed internal helpers in favor of minimal email-specific
logic.

Related / Origin:\  CO-2308, CF-1239

Fix folder creation with system folder name breaking secondary bar in Mails (\ CO-2241\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where creating a new folder with a system folder name in
Mails causes a UI error, ensuring seamless user experience.

Technical details:

Related / Origin:\  CF-1395

Resolve threading issue with 'Edit as New' emails (\ CO-2235\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes incorrect threading of emails edited as new, preventing them from
being included in the original conversations. Improves UI and
performance, especially for large email threads.

Technical details:

Related / Origin:\  CO-2234, CF-1342

Fix "Edit as new" feature to remove conversation headers (\ CO-2234\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Improves the 'Edit as new' action by ensuring that newly edited messages
are treated as standalone and not linked to existing conversations. This
resolves the issue causing confusion due to message aggregation into
ongoing threads.

Technical details:\  Ensures that when using the 'Edit as new' action,
the original ID is removed from the message object and subject prefixes
like 'RE:' or 'FWD:' are sanitized to prevent accidental linking to
existing conversations. Enhanced test coverage confirms correct
behavior.

Related / Origin:\  CO-2235, CF-417

Email badge includes unread emails from collapsed subfolders (\ CO-2232\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Corrects the email counter to display the total number of unread emails,
including those in collapsed subfolders, ensuring accurate visual
notifications for users.

Technical details:

Related / Origin:\  CO-1983, CF-1228

Persist sorting and filtering when switching folders (\ CO-2219\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where sorting preferences are lost after navigating away
from a folder and then returning. Sorting and filtering settings are now
retained, enhancing user convenience.

Technical details:

Related / Origin:\  GB-793

Fix Admin Panel bucket selection issue for existing volumes (\ CO-2217\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue in the Admin Panel where selecting a different bucket
for an existing volume appeared to save changes but failed to apply
them. Ensures configured bucket changes are properly implemented.

Technical details:

Related / Origin:\  CF-554

Fixed 'Public' sharing option in UI (\ CO-2216\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Corrects a UI issue where the 'Public' sharing option was available,
even when public sharing was disabled. This adjustment prevents user
confusion and possible graphical inconsistencies.

Technical details:\  The sharing option logic in the calendar UI was
refactored to dynamically hide the 'Public' option based on user
permissions. When public sharing is disabled, the option no longer
appears.

Related / Origin:\  CF-760

Mailbox bootstrap handles existing databases correctly (\ CO-2211\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the mailbox database bootstrap command would
fail when invoked on a system with already initialized databases,
preventing upgrades to proceed.

Technical details:\  The issue was due to concurrency problems during
role creation when roles and databases already existed. The solution
involves checking the existence within the script to prevent exit code
1.

Related / Origin:\  ZPE-1126, CO-2173, CF-1390

Resource unavailability status becomes visible in Calendar (\ CO-2209\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where the resource unavailability status was not visible
in the appointment editor, enabling admins to view when resources are
already booked.

Technical details:\  Changes ensure that the resource unavailability
status is properly visible to users when booking resources in the
Calendar component.

Related / Origin:\  CO-2199

Reset email selection when leaving Search module (\ CO-2204\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes issue where email selection from the Search module was not reset
upon navigating away, preventing unexpected selected states in other
modules.

Technical details:\  This update ensures the selection state is cleared
when moving from the Search module to other modules, adhering to
expected navigation behavior.

Related / Origin:

Fix UI break in Search module after using advanced filters (\ CO-2194\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where the UI would break when switching from the Files
to the Mails module in the Search, after using the advanced filters.
This ensures a stable interface across modules when applying filters.

Technical details:

Related / Origin:\  CF-1379

Fix advanced filter inputs misplaced when switching from Mails to Files UI (\ CO-2193\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where advanced filter inputs from the Mails and Files
UIs were incorrectly placed in the keywords section. This fix improves
the usability and accuracy of the filtering functionality.

Technical details:

Related / Origin:

Correct advanced filter input placement in Contacts (\ CO-2192\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes the issue where advanced filter inputs from files and mails
modules were incorrectly placed in the keywords section of Contacts.
This ensures more accurate filtering and user experience.

Technical details:

Related / Origin:

Correct misplaced advanced filter inputs in Mails when switching from Files UI (\ CO-2191\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where advanced filter inputs from the Files UI were
incorrectly positioned in the keywords section of the Mails module,
ensuring a coherent user experience.

Technical details:

Related / Origin:

Fixes Filters anchor navigation in Webmail Settings (\ CO-2188\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the anchor for the "Filters" section in Webmail
Settings was not functioning, preventing users from navigating directly
to that section.

Technical details:\  Fixes anchor navigation for the "Filters" section
in Carbonio Webmail Settings. The "Filters" section now renders with
id="filters", ensuring the left-hand menu anchor works as expected.

Related / Origin:\  CF-1362

Resolve issue with ICS imported events being unmodifiable or undeletable (\ CO-2180\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where imported calendar events from an ICS file could not
be modified or deleted. This improves the reliability of ICS imports,
critical for data migration processes.

Technical details:\  The API call to update appointments incorrectly
forced the 'comp' field to 0. The solution involves using the correct
component number ('compNum') from the appointment invite. This primarily
affects scenarios where multiple appointments are imported from ICS
files, ensuring all imported events can be managed properly.

Related / Origin:\  HIT-3

Fix email text deletion when adding a signature (\ CO-2175\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where adding a signature while composing an email
inadvertently deletes text, ensuring email content is preserved.

Technical details:

Related / Origin:\  HIT-13, CF-1166

SmartScan running despite scheduling being disabled (\ CO-2170\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the SmartScan process continues to run on its
schedule even when it has been disabled, preventing unwanted operations
and resource usage.

Technical details:

Related / Origin:\  CF-384

Fix ActiveSync remote access flags in Admin Panel (\ CO-2145\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Addresses an issue in the Admin Panel where mails, calendars, and
contacts ActiveSync remote access flags were incorrectly set at the user
level. This change prevents non-global admins from editing these
settings.

Technical details:\  Mails, calendars, and contacts ActiveSync remote
access flags should be managed globally. Removed feature flags from the
user section and introduced a single LDAP attribute
(zimbraFeatureMobileSyncEnabled) at the user/COS level.

Related / Origin:\  CO-2144

Prevent duplicate values in Advanced filters within Mails (\ CO-2126\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This update ensures that users cannot insert duplicate values in the
'status of e-mail item', 'Attachment type', 'tags', and 'keywords'
fields within the Mail's advanced filters, leading to more efficient
searches.

Technical details:

Related / Origin:

Prevent duplication of values in advanced filters (\ CO-2125\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where users could enter duplicate values in the
'keywords' field of advanced filters, ensuring more efficient searches.

Technical details:

Related / Origin:

"FWD:" and "RE:" missing in email after forwarding/replying in conversation view (\ CO-2123\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Addresses an issue where emails forwarded or replied to in conversation
view did not display "FWD:" or "RE:" in the subject. Ensures proper
tracking of email threads.

Technical details:

Related / Origin:\  GB-748

Prevent duplication of values in Advanced filters (\ CO-2121\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensures users cannot insert duplicate values in the advanced filters,
improving search efficiency for sysadmins/operators.

Technical details:

Related / Origin:

Display full name instead of email in chip (\ CO-2111\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Corrects the search functionality, ensuring email addresses are
displayed instead of display names. Enhances accuracy for sysadmins
testing email filters.

Technical details:

Related / Origin:\  CO-1743

Display message count in shared account Draft folder (\ CO-2105\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes the issue where the message counter was not displaying the number
of messages in the Draft folder of shared mail accounts.

Technical details:

Related / Origin:

Fix toggle persistence for 'Include shared folders' in Advanced Filters (\ CO-2104\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensures the 'Include shared folders' toggle state is preserved correctly
based on user actions. This prevents unintended toggle state
persistence, improving user experience.

Technical details:\  The issue involved the 'Include shared folders'
toggle in the Advanced Filters modal. Closing the modal without
performing a search now correctly retains or discards changes to the
toggle state.

Related / Origin:

Retention policy displays incorrect state (\ CO-2068\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes issue where changes to retention policy in mail folders were not
displayed, ensuring accurate display of policy settings.

Technical details:

Related / Origin:\  IRIS-4565

[Calendars] Preserve date filters on close (\ CO-2020\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where date filters in the Advanced Filters modal reset to
default values when the modal is closed without searching. Now, date
changes persist to ensure user modifications are retained.

Technical details:

Related / Origin:

Auto-reply message indicates when character limit is exceeded (\ CO-1990\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

System now alerts when the maximum character limit for an auto-reply
message is reached, preventing users from saving unsent messages.

Technical details:\  Added error indication messages for exceeding
auto-reply character limits in the webmail interface. Removed outdated
string keys related to out-of-office settings.

Related / Origin:\  CF-761

Fix Free/Busy availability settings for domain users (\ CO-1984\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where calendar Free/Busy availability settings for
restricting visibility to domain users did not function correctly,
affecting up to 6000 mailboxes. This fix ensures the setting is properly
applied and persists in the Web-client.

Technical details:

Related / Origin:\  CF-848, GB-799, ZIF-1538, CF-908

Fixes file duplication when creating a smartlink (\ CO-1977\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue in which converting an email attachment from Carbonio
Files to a smartlink created a duplicate file with an external link.
Prevents multiple copies and ensures smartlinks point to the original
file, maintaining file integrity.

Technical details:

Related / Origin:\  CF-1131

Root folders in advanced mail filters are selectable under 'is contained in' field (\ CO-1960\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where root folders could not be selected in the advanced
filters' 'is contained in' field, enhancing usability in mail filtering
tasks.

Technical details:

Related / Origin:\  CO-1994, IRIS-4846

Fix broken behavior in advanced mail filter (\ CO-1743\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Addresses issues with the advanced filter modal in mail, where adding a
user created an editable chip in multiple incorrect fields.

Technical details:

Related / Origin:\  CO-1994, CO-2111

Improve user interaction with smart links for oversized attachments (\ CO-1731\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Attachments exceeding the maximum allowed size are now automatically
converted to smart links, improving the user experience when sending
emails.

Technical details:

Related / Origin:\  CO-1707, CO-2271

User can now search sentences with ‘:’ character (\ CO-1223\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where users could not search for email subjects
containing a colon. This fix enhances the search functionality, allowing
users to perform searches without encountering input errors or needing
to refresh the page.

Technical details:\  The search engine now handles punctuation
characters in the same manner as the dollar sign, improving search
accuracy and usability.

Related / Origin:\  CF-560, CO-1994, IRIS-4036

Fix invalid link generation for smart links with local attachments (\ CO-2529\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where creating a smart link from a local attachment
generated an invalid link. Enhances reliability in email composition by
ensuring that generated links are correct.

Technical details:

Related / Origin:\  HIT-235

Fix error message for emails sent to invalid recipients (\ CO-2528\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An error message is now correctly displayed when users attempt to send
an email to an invalid internal recipient. This enhances error clarity
for system administrators.

Technical details:

Related / Origin:\  HIT-239

New email filters cause display issues in filters order ### (\ CO-2527\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Addresses display issues with email filters for users who upgraded from
version 25.6, ensuring filters apply correctly. Essential for
maintaining correct email filter functionality post-upgrade.

Technical details:

Related / Origin:\  HIT-236

Fix recipient display in Sent subfolders (\ CO-2520\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Corrects an issue where emails in Sent subfolders did not show the
recipient, ensuring all Sent folders display the recipient as expected.

Technical details:\  This update addresses a regression affecting
message-view functionality, where Sent subfolders now correctly display
the TO participants instead of FROM participants.

Related / Origin:\  HIT-217

Service-discover fails to start after upgrade (\ CO-2518\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where the service-discover service would not start
post-upgrade due to incorrect systemd configuration. Ensures seamless
operation after upgrading by addressing service dependencies.

Technical details:\  Updated the systemd configuration for
service-discover and related Prometheus services to use
'WantedBy=multi-user.target', resolving startup failures.

Related / Origin:\  GB-796, IN-919, IN-881, GB-816

Mark all as read now updates email list view (\ CO-2516\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes an issue where using 'Mark all as read' did not update the email
list view, ensuring all emails display as read. This improves accuracy
for users managing multiple unread emails.

Technical details:\  Refactored message normalization and getFlags
function to handle default read flag scenarios based on SOAP message
objects. Added test coverage for the updated behavior.

Related / Origin:\  HIT-42

Fix HSM policy application to incorrect server via SOAP (\ CO-2505\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where the HSM policy was applied to the wrong server
due to SOAP calls executing on a different server than the one selected
in the Admin Panel.

Technical details:

Related / Origin:\  CF-1445

Fix missing 'Download' label in Files (\ CO-2499\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolves an issue where the 'Download' option in Files displayed
incorrectly, affecting user interaction.

Technical details:

Related / Origin:\  GB-796, GB-815

Fix wrong hostname for S3 bucket (\ CO-2470\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where attempts to move blobs to an S3 bucket were
failing due to incorrect hostname configuration. This correction
prevents disruptions in blob storage operations for administrators.

Technical details:

Related / Origin:\  GB-796, GB-806

| 

Translation Updates(5)
----------------------

| 

Fix missing translation in Chat settings (\ WSC-2087\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensures that the "Home" string in Chats settings is translated properly
to improve user experience for non-English users.

Technical details:

Related / Origin:\  CO-2253

Add Slovenian as supported language (\ SHELL-294\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The user interface and Admin Panel now support Slovenian, enhancing
accessibility for Slovenian-speaking users.

Technical details:

Related / Origin:\  CF-1369

Resolve missing strings for translation in French (\ CO-2253\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Adds missing strings to enable complete translation of Carbonio into
French, enhancing accessibility for French-speaking users.

Technical details:

Related / Origin:\  WSC-2087, CF-1258

Correct French translation for calendar reply in mailbox (\ CO-2252\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixed incorrect French translation for the tentative reply to a calendar
event in the mailbox. This helps ensure that the email notifications
sent to event organizers display the correct message.

Technical details:

Related / Origin:\  CF-1388

Fix Italian translation issue in Smartlink upload (\ CO-2530\ )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolved an issue where the Italian translation was incorrect or
truncated when informing users about file upload status using Smartlink.
Improves user experience for Italian-speaking users.

Technical details:

Related / Origin:\  HIT-238

| 
