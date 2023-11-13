.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Changelog - Release 23.11.0
====================================

Release Date: November 13th, 2023

New Features List
-----------------

**TSK-55: Enhanced Task visibility and functionality**
   Now, when a user creates and completes a task, pressing the "COMPLETE" button from the display header action will mark the task as completed. It will remain visible in the list until manually deleted, ensuring better task management. Additionally, we have refined the functionality of the complete and delete buttons, as well as added validation to limit the number of tasks to 200 for optimal performance.

..


**TEAMS-4112: updated "Rooms" label to "Virtual Rooms" in appointment**
   We've rebranded 'Rooms' to 'Virtual Rooms' for a more intuitive appointment experience.

..


**TEAMS-4109: Improved Meeting moderator chat notification**
   Moderators will no longer receive chat browser notifications for messages in an external meeting room's chat if they are not actively participating in the meeting. This change ensures notifications are relevant and actionable by the recipient.

..


**IRIS-4743: Excluded disabled actions from secondary contextual menu**
   We've improved the user experience by hiding disabled actions in the secondary bar when right-clicking. This prevents user confusion. For instance, disabled actions unrelated to a specific calendar were previously visible in the secondary bar of the Calendar. This enhancement ensures a more intuitive interaction.

..


**IRIS-4540: Introducing click-to-copy email addresses**
   Copy to clipboard email address is a new feature in the Carbonio webmail client where users can copy email addresses by simply clicking over the copy option in the TO, CC, and BCC address fields by just expand the recipient list

..


**IRIS-4531: Clarified private event sharing label**
   Updated the checkbox label and added an information icon tooltip for the setting that controls sharing of private appointments in calendars. This change aims to make it clearer for users what "see my private appointments" means in terms of detail visibility.

..


**IRIS-4404: Appointments edit mode enhaced**
   When a user edits an appointment, the appointment is always opened on a dedicated board.

..


**IRIS-3851: Automated focus on initial field in new boards**
   Experience improved workflow efficiency as the first mandatory field now gains automatic focus when opening a new board. This enhancement applies to Mail (body), Appointments (title), and Contacts (name), eliminating the need for manual field selection.

..


**IRIS-3757: Full screen conversation view**
   It is now possible to read a single email or a conversation full screen by double-clicking on it in the list of emails.

..


**IRIS-3258: Enhanced message composition with drag-and-prop email addresses**
   Users can now effortlessly compose messages by dragging and dropping email addresses in the TO, CC, and BCC fields.

..


**IRIS-3067: Improved calendar permission management wording and labeling**
   The enhancement of wording and labeling for the management of permissions in Calendars offers users a more intuitive and user-friendly approach to governing access and sharing within the calendar application.

..


**IRIS-2589: Shared Account Calendar View**
   Users can now view and manage calendars from accounts shared with them within the Carbonio Web Mail interface. This feature enhances collaborative scheduling and event planning management.

..


**COR-1004: Improved logging for unknown/invalid attribute names**
   Previously, during startup, if a deprecated or removed attribute was encountered, an exception with an error level was logged. With this update, only a warning message will be logged without including a stack trace. This enhancement provides more concise and informative log entries for better attribute handling.

..


**COR-982: Enhanced Admin capability in purging activeSync state table**
   This latest update grants administrators the ability to purge the ActiveSync state table. This functionality provides admins with greater control over system performance and ensures seamless synchronization processes for users relying on ActiveSync services.

..


**COR-957: Domain operation notification scope review**
   In order to make the product more usable for the domain admins, we changed the notification scoper for the operation involving the domains so that they'll receive related notifications.

..


**COR-854: Notification address configuration update**
   Notifications from Carbonio Advanced B.E. now utilize the recipient and sender email addresses as configured by the Global Admin, either at the domain or infrastructure level. This ensures that notifications such as Smart Scan, Restore Account, and HSM job notifications are sent from the correct address.

..


**CO-883: EULA Update in Carbonio Bootstrap**
   The End User License Agreement (EULA) displayed during the Carbonio bootstrap process has been updated. The new content now includes links to both the open-source licenses on GitHub and the proprietary Zextras EULA, ensuring users are fully informed about the licensing terms of Carbonio components.

..


**CO-874: LDAP upgrade post-Install migration**
   The carbonio-directory-server LDAP schema upgrade process has been transitioned to occur during the post-install phase of the RPM package deployment. This ensures that schema upgrades are applied after the package installation, reducing potential conflicts and dependencies during the upgrade process.

..


**CO-850: Enhanced Read-receipt functionality in shared account**
   Now when the user sends emails to shared accounts, it will prompt a "Read receipt required" pop-up upon opening, just like in standard accounts

..


**CO-826: Streamlined mailbox logs with optimized slogger usage**
   This update improves mailbox logs by reducing the density of slogger entries. Now, with refined logging levels, mailbox logs are more organized and clutter-free.

..


**CO-825: Resolved ClamAV antivirus socket error**
   Enhancements made to the Antivirus Service with improvements in various parameters. The ClamAV timeout socket error, occurring during the scanning of large files and high throughput on MTA, has been fixed. This improvement ensures that users no longer receive messages with the subject alert "Unchecked.." and that every file is scanned without service failures.

..


**CO-788: RFC 6266 Compliance and handling Enhancements**
   This update guarantees adherence to RFC 6266 for attachment names. It introduces support for RFC-6266 compliant filename extraction, including non-Latin characters like Cyrillic. Additionally, the handleMultipartUpload function has been refactored to enhance both readability and maintainability.

..


**AC-825: Reactivation of domain resources tab**
   The Resources tab within the Domain section has been reactivated. This update enables administrators to access and utilize the Resources tab, ensuring alignment with recent interface updates.

..


**AC-807: Theme renamed to Whitelabel Settings**
   The term "Theme" in the Carbonio Admin has been updated to "Whitelabel Settings" to better represent its functionality and to provide clarity.

..


**AC-803: Enhanced delegated admin accounts with full email address**
   In the Carbonio Admin panel, domain admin accounts now display the complete email ID with the domain, replacing the local name. Additionally, the menu name "domain delegates" has been updated to "Delegated Domain Admins" for clearer identification and improved user experience.

..


**AC-796: Improved pagination functionality in Carbonio admin panel**
   Fixed pagination issue in Carbonio admin panel, allowing smooth navigation through user/mail list pages. Previously, an incorrect page count was displayed, but using the search bar temporarily corrected the problem. This issue has now been resolved for seamless user experience.

..


**AC-792: Enhanced domain list visibility for admins**
   The Carbonio admin panel now allows administrators to view the list of all available domains without the need to select a specific domain from the search domain filter. This enhancement provides admins with a comprehensive domain list for improved accessibility and ease of management.

..


**AC-780: Enhanced email account creation format**
    First name, middle name, and last name fields are now concatenated with a dot for email ID formation (e.g., firstname.middleinitials.lastname@company.com). This enhancement provides a more streamlined and standardized account creation process.

..


**AC-774: Admin Login page support the expired password**
   Admin Login page now supports the expired password feature and provide change password option button with old password, new password and confirm password in same page.

..


**AC-732: Improved mail queue management**
   Admins now have the ability to view mails with various parameters such as sender address, recipient address, To/From domain, and mail size. Additionally, admins can perform actions like deleting, queuing, and holding emails, providing greater flexibility and control over the mail queue.

..


**AC-704:  Enabled search filter during record fetch error**
   The search filter functionality in Carbonio has been improved for accounts exceeding 1,000. Now, when the API encounters an error while fetching records, the search filter remains active, allowing administrators to locate accounts by name.

..


**AC-653: Global admin can list all global and delegated admins**
   Global admin now has the ability to list all global and delegated admins in the infrastructure.

..


**AC-471: Improved domain creation functionality in carbonio admin panel**
   The Carbonio admin panel application has been updated to facilitate domain creation directly from the admin UI dashboard on the homepage header. This enhancement ensures smooth and error-free domain creation, with the "create" button in the header now functioning as intended.

..


**AC-452: Enhanced COS domain and account visibility**
   Global Admins can now see the list of domains and accounts linked or assigned to a specific Class of Service (CoS). This feature aims to provide a better understanding of the impact of modifying or deleting a CoS.

..


**AC-390: Enhanced certificate management for admins on the Virtual Hosts & Certificates**
   Empower your administrators with the ability to seamlessly manage certificates on the 'Virtual Hosts & Certificates' panel. Now, admins can effortlessly utilize downloaded certificates, choosing between full_chain + private key or certificate + chain + private key for enhanced security and convenience.

..

*****


Bugfix List
-----------

**UM-25: Locale format fixed in Carbonio accounts**
   This update addresses an issue with the returned locale format in Carbonio accounts, now the Locale attribute in the JSON response will accurately reflect the selected language in Carbonio.

..


**TEAMS-4105: Fixed AZERTY input deletion for moderator field**
   Resolved an issue where using a French (AZERTY) keyboard to add a '.' (dot) in the "Add moderator" input field.

..


**SHELL-176: Enhanced "from name" input field in New persona**
   The new name is now displayed inside the input field without the need for a manual refresh, addressing the previous issue where the old name persisted.

..


**SHELL-161: General Settings 'Discard Changes' functionality fixed**
   Fixed the "Discard Changes" function in the General Settings on the user interface; the values are properly reverted to the dark mode, locale (language), and time-zone settings.

..


**IRIS-4845:  Enhanced editing an appointment on shared calendar**
   Editing appointments on a shared calendar no longer triggers an error.

..


**IRIS-4844: Snackbar appears for sent appointments**
   When creating or editing a new appointment, the 'appointment invitation sent' snackbar now correctly appears when participants are added and the 'Send' button is clicked.

..


**IRIS-4841: Enhanced Editing for Appointments in Shared Accounts**
   Allows users to edit and save changes to appointments within a shared account without encountering errors, ensuring the organizer is set correctly.

..


**IRIS-4840: Unwanted text overlay issue resolved**
   In 'view by message' mode, the issue of unwanted text overlaying every message has been successfully addressed. Previously, this caused inconvenience, but it's now resolved, ensuring a cleaner and more user-friendly interface for message viewing.

..


**IRIS-4771: Dynamic Calendar board title for new appointments**
   The board tab for creating a new appointment in the calendar module now dynamically displays the title. Initially, it shows "New appointment" and updates based on what the user types in the "Event title" input field.

..


**IRIS-4709: Enhanced E-mail filter option**
   Users now have the ability to remove the 'Do not process additional filters' flag in the email filter feature, providing them with greater flexibility in refining their filtering criteria.

..


**IRIS-4708: Enhanced inline image rendering in conversation view**
   Now, when replying to a forwarded message with an inline image, the text and image alignment in the mail body have been improved. This enhancement ensures that the conversation view now displays the content consistently, as well as the message view. Earlier, we had an issue where emails were incorrectly rendered in the conversation view.

..


**IRIS-4612: Enhanced Draft saving functionality in board**
   The message editor board has been enhanced to reduce the frequency of draft-saving messages upon initial opening. Previously, an unnecessary draft saving was observed as soon as the editor was opened on the new board. With this improvement, the draft-saving functionality now occurs after content is added to the editor board.

..


**IRIS-4107: Correct 'Event Title' display in appointment board tab**
   The tab now correctly displays the 'Event Title' within the board of a new appointment. When creating different elements (a new message, a new event, and a new contact) with different names inside the same board, all the names of the elements being created are visible.

..


**IRIS-3758: Draft save prompt optimization**
   Improved the behavior of saving Drafts, Carbonio should not prompt for draft saving unless there's manual input from the user.

..


**IRIS-3384: Calendar context menu enhanced**
   Context menu options for Calendars are streamlined to remove unused or unnecessary actions.

..


**DOCS-199: Correct Language settings in document URLs**
   When opening a document, certain languages are now accurately reflected in the URL, enhancing user experience and accessibility.

..


**COR-1003: Reduced authentication timeout**
   The Auth handler timeout is now reduced to just one second, ensuring that the login form opens swiftly and login occurs promptly even if one or more app servers are inaccessible.

..


**COR-980:  Fixed carbonio prov Command**
   Resolved a bug causing warnings in the `carbonio prov` command. The command now runs without any warnings.

..


**COR-963: Delegated admin active session view rights**
   Delegated admins can now view active session details for users within their granted domain scopes. This enhancement ensures that delegated admins have sufficient oversight without granting them unnecessarily broad access.

..


**COR-959:  Automated cache management**
   Now the local store cache folder is cleaned up when reaching the configured limit so it cannot exceed the configured cache size.

..


**CO-878: Config handler values fixed**
   Fixed a bug that caused the Auth config handler to return invalid values on request. Now the handler returns the correct values.

..


**CO-861: WSDL SOAP protocol version fixed**
   Now the protocol version is properly reported in the definitions on replying to a SOAP request.

..


**CO-855: Enhanced Favicon Display in Carbonio WebUI**
   The Carbonio web interface now features the official Carbonio favicon, replacing the previous Jetty icon. This upgrade also ensures accurate display of white labeling favicons, leading to a more seamless user experience.

..


**CO-842: Account specific debug log improvement**
   Updates have been applied to ensure account-specific log categories are established and recognized by Carbonio, allowing for verbose logging across various services.

..


**CO-823: Enhanced CalDAV client synchronization and Busy/Free indication**
   The free/busy status in the mail client enhanced. When configuring CalDAV calendar sync in MAPI clients like Thunderbird, creating two events for the same time slot while inviting attendees will display a busy blue strip in the time cell. This indicates a reserved slot. If this strip is absent, the slot is free for invited attendees, streamlining scheduling and calendar management.

..


**CO-817: ProxyConfGen: Debug Output Displays in stdout**
   ProxyConfGen now has the capability to display debug output directly to stdout.

..


**AC-829: Accurate date and time display in MTA queue**
   The MTA queue in the Carbonio admin panel now displays the correct time, day, and date. This enhancement provides accurate and reliable information for efficient queue management.

..


**AC-828: Account delegates option enhached**
   The account delegates option is now improved, and no longer shows the duplicate/double option.

..


**AC-808: HSM Schedule Toggle Sync**
   The Enable Schedule toggle in the HSM Settings of the Admin UI is now accurately reflecting the actual state of the HSM policy schedule as confirmed via the CLI. The UI toggle and CLI output should now be in sync, showing consistent enabled or disabled status.

..


**AC-790: Admin dashboard domain quickaccess button improvement**
   The Quickaccess buttons on the Dashboard now correctly navigate to their respective sections under Domains for Accounts and Mailing Lists, ensuring a seamless admin experience.

..

*****

End of of changelog
