
Release 25.3.0
=================

Release Date: March 18th, 2025

New Features List
-----------------

CO-1337: Enhanced email encryption with S/MIME
   Users can now manage email encryption certificates, sign and encrypt emails, and decrypt received emails using S/MIME, providing enhanced email security and privacy.


**CO-1488: Improved email meeting participants**
   Users can now send emails directly from the Appointment Card using the "Email Attendees" option. This new feature allows users to send a message to all attendees in a single action, improving efficiency and communication.


**CO-1489: Add pagination to search users**
   The SearchUsersByFeature API now supports pagination, allowing for more efficient searching and retrieval of user data, with optional parameters for offset, limit, and sorting.


**CO-1532: Enhanced appointment management features**
   The users can now read appointment notes and open appointments directly from reminder details, improving user experience to get all details of the appointment like URL, mobile


**CO-1589: Activate or deactivate backup  at COS**
   Global Administrators can now activate or deactivate backup settings for Class of Service (COS) directly from the Admin interface, providing easier management of backup settings without requiring CLI access.


**CO-1620: Calendar editor improved with faster contact addition**
   The Carbonio Calendar Editor has been improved to allow for quicker contact additions, weak typing issue has been identified and successfully resolved, ensuring better reliability and performance.


**CO-1661: Modularization of provutil for better maintainability**
   The com.zimbra.cs.account.ProvUtil class has been refactored and modularized to improve maintainability, testability, and overall structure, reducing its size from 6,237 lines.


**CO-1685: The tag management shifted mails**
   The tag management implementation has been moved from an external repository to Mails directly, providing a more integrated and efficient solution.


**CO-1687: Tag manament for Calendar module**
   he calendars module now locally implements tag management using refresh and notify events, providing a more integrated and efficient solution.


**CO-1691: Enhanced Integration of Contacts and Contact Groups**
   The contact input component has been simplified and improved, allowing users to easily select contact groups from an autocomplete list and automatically passing individual contacts to the external component.


**CO-1703: Portuguese Language Option Consolidation**
   The language selector now only displays Portuguese (pt), and translations will be provided in Brazilian Portuguese, consolidating the language options while maintaining accurate translations.


**CO-1748: Improve filter management logic**
   The filter management system has been improved to provide clearer user experience. When creating filters with the same condition, the actions are now merged into a single filter, eliminating confusion.


**CO-1756: Removal of "Free/Busy Interop" from admin panel**
   The "Free/Busy Interop" option has been removed from the COS/Advanced section in the admin panel. This change streamlines the administrative interface, ensuring a simplified and updated user experience.


**CO-1761: Fixed consul port configuration**
   The Consul definition now correctly uses port 8742 for HTTP, ensuring accurate health checks and configuration.


**CO-1763: Enhance email encryption S/MIME UI**
   Users can now manage email encryption certificates, sign and encrypt emails, and decrypt received emails using S/MIME, providing enhanced email security and privacy.


**CO-1766: Align user management to latest mailbox apis**
   The User Management service has been updated to align with the latest Mailbox APIs, resolving a critical issue where the User Management server failed to start due to API misalignment.


**CO-1771: Synchronous account deletion**
   Account deletion is now a synchronous process, where Mailbox makes an HTTP call to Files to delete associated data before completing the account deletion, ensuring a more streamlined and reliable process.


**CO-1785: Allow user to share single contact group**
   Users can now share a single contact group, and both contacts and groups are visible under the same folder, with options to filter and view only groups, contacts, or all.


**DOCS-204: Enhanced quota management for Files**
   The Carbonio File module now handles quota overages during file editing, displaying a warning message and switching to read-only mode when the quota is exceeded, preventing further data writes.


**FILES-666: Associate more mimetypes for messages**
   The latest update to the Carbonio Webmail File module ensures that email file icons are displayed correctly with the new mimetypes update, improving file recognition and user experience.


**FILES-716: Hide unnecessary search options**
   The search tab dropdown menu has been improved to only display relevant and functional options, enhancing user experience and reducing clutter.


**FILES-852: Increased public link length**
   The public link length has been increased from 32 to 50 characters, enhancing security and uniqueness.


**IN-791: Updated carbonio MLT package**
   A unified carbonio-mlt package is now provided, standardizing versioning across distributions and serving as a runtime dependency for carbonio-videorecorder.


**IN-845: Updated carbonio docs editor to latest version**
   The Carbonio-docs-editor has been updated to the latest version, 23.05.17, ensuring users have access to the most recent features and improvements.

IN-859: Fix postfix resource permissions
   This update corrects incorrect permissions on postfix-related
   resources, ensuring proper access and functionality.

**SHELL-274: Portuguese Language Option Consolidation**
   The language selector now only displays Portuguese (pt), and translations will be provided in Brazilian Portuguese, consolidating the language options while maintaining accurate translations.


**TSK-98: Accurate translation of task drop-down menu**
   The task drop-down menu and related applications in Carbonio Webmail are now accurately translated based on the user's selected language.


**WSC-1536: User can use one of the hardcoded backgrounds**
   Users can now select from a range of hardcoded virtual backgrounds, enhancing their video conferencing experience and providing more customization options.


**WSC-1573: Enhanced reaction emoji picker**
   Users can now select any reaction emoji from the picker, extending beyond the default five options, to express their emotions and reactions more flexibly.


**WSC-1580: Switch or remove message reactions**
   User can interact with the reaction list clicking on the chips to add his reaction, remove it or change it with another one


**WSC-1594: Add shimmer effect on video loading**
   A shimmer loading effect has been added inside the tile component, indicating that the video is loading when it's not immediately available.


**WSC-1679: Notify user of new message reactions**
   Users are now informed of new reactions to their messages through browser notifications, badges on conversation cards, and highlighted reaction chips within conversations.


**WSC-1704: Create virtual room from Calendar**
   Users can now create a new virtual room directly from the calendar while composing or editing an appointment.


**WSC-1752: Enhanced virtual room management features**
   Users can now directly add moderators during virtual room creation, streamlining collaboration and ensuring efficient meeting management from the start.


**WSC-1801: Edit virtual room information**
   Users are now enabled to modify the name and moderators of existing virtual rooms, providing greater flexibility and control over virtual room management.

*****

Bugfix List
-----------

**CO-1449: Display max message size in megabytes**
   The maximum size for mail messages is now displayed in megabytes (MB) instead of bytes, providing a more user-friendly and intuitive experience.


**CO-1483: Default font applied to whole content**
   The default font in Carbonio is functioning correctly. When the default font is applied through Carbonio settings, it is consistently used across the entire content of the email body. This ensures a uniform and cohesive appearance for all email communications.


**CO-1496: Fix search results update**
   The search results are now updated in real-time, reflecting changes such as email deletion, and automatically removing the email from the search results without requiring a manual refresh.


**CO-1559: Translate Legal Hold section**
   The "Legal Hold" section of the Admin Panel is now fully translated into all supported languages, ensuring that administrators can easily navigate and manage legal hold settings.


**CO-1560: Fixed Polish translation for attachment label count**
   The Polish translation for the "label.show_all_attachments" text has been added, and the attachment count is now correctly displayed in the mails feature.


**CO-1561: Delete confirmation translation improved**
   The confirmation popup for deleting a calendar event now displays the word “Delete” translated into the respective languages.


**CO-1574: Allow admin to delete accounts with public shares**
   Admins can now delete accounts that have publicly shared folders (e.g., Calendar) without requiring manual intervention. Previously, such accounts could not be deleted unless the public share was manually revoked.  


**CO-1578: Translate Default in signature settings**
   The "DEFAULT" label in the signature settings is now translated, providing a more localized experience for users.


**CO-1581: Remove Html code from mime parts**
   The issue with HTML code being displayed in the text alternative MIME part of sent emails has been resolved, ensuring that messages are displayed correctly without any unnecessary code.


**CO-1588: Junk folder accessible in mail filter**
   The Junk folder is now available in the "Move Into Folder" dropdown when browsing folder destinations in policy settings, making email filtering more convenient.


**CO-1596:  Fixed Html tags in message digest**
   The message digest now correctly renders email content without displaying html tags, providing a cleaner and more readable user experience.


**CO-1598: Fixed attachment name cropping**
   The issue of attachment names being cropped when printing an email has been resolved, ensuring that attachment names are displayed correctly.


**CO-1623: Shared appointment save permission fix**
   Users can now copy appointments from shared calendars and save them to their own calendar without encountering a PERM_DENIED error.


**CO-1624: Remove deprecated backup options**
   The carbonio backup doRestoreOnNewAccount command help display has been updated to remove deprecated options, specifically restore_chat_buddies and restore_datasource, ensuring that only supported options are displayed.


**CO-1638: Allow special characters in forwarding addresses**
   Users can now configure forwarding addresses with special characters before the "@" symbol in the calendar settings.


**CO-1692: Preserve existing equipment/meeting room**
   When adding new equipment or meeting rooms to an event, existing ones are now preserved and not cleared, ensuring accurate event planning.


**CO-1718: Hypertext links displaying correctly in mail body**
   The issue with incorrect link formatting in the Carbonio mail body has been resolved. Hypertext links are now displayed properly without any extra characters.


**CO-1736: Reply and read actions visible sending from drafts**
   The reply and read actions on a message now correctly appear on the recipient's inbox when sending an email from drafts. 


**CO-1746: Fixed delegated account conversation view**
   Carbonio now correctly groups email messages in the conversation view for delegated accounts, ensuring seamless email management and proper sending and receiving of messages within the delegated account's mailbox.


**CO-1747: Account description from Admin UI fixed**
   When creating a new account from the Admin UI, the description is now properly saved and associated with the account.


**CO-1758: Remove unused sending mail preference**
   The "Allow Sending From Any Address" preference has been removed from the Admin UI under COS > Default > Preferences > Sending Mails, as the corresponding attribute is not supported in Carbonio CE.


**CO-1760: Fixed bulk delete for centralized volume**
   The bulk delete operation now functions correctly for centralized volumes, ensuring that mass deletions are processed successfully without errors or performance degradation.


**CO-1777: Real time tag updates**
   Tag creations, edits, and deletions are now reflected in real time, eliminating the need for a page refresh to see changes.


**CO-1784: Fixed attachment size calculation with smartlink**
   The attachment size calculation now works correctly, allowing users to send emails with large attachments that have been flagged as smartlinks.


**CO-1788: Enhanced conversation list issues**
   The conversation list now correctly updates in real-time, ensuring that new emails are displayed  without requiring a page refresh or tab change.


**CO-1793: Fixed unwanted conversation grouping**
   Conversations are now correctly displayed without unwanted grouping, ensuring that each conversation is shown separately and messages are not duplicated.


**CO-1795: Fixed broken table formatting**
   The email client now correctly renders table formatting in email bodies, resolving the issue where tables were broken and not displayed correctly.


**CO-1798: Fixed conversation sort order persistence**
   The conversation and message list sort order now persists correctly, even after navigating away from and back to a folder, ensuring a consistent user experience.


**CO-1799: Fix "As New Mail Arrive" polling option**
   The "As new mail arrive" polling interval option is now correctly available for selection in the Admin Panel's Class of Service (COS) settings.


**CO-1801: Fix files quota setting**
   The issue preventing Files quota settings from being applied has been resolved, ensuring that administrators can successfully configure quota limits for Files.


**CO-1803: Email page layout functioning properly**
   The Email page layout is working as expected, with no issues found. All elements are displaying and functioning correctly.


**CO-1805: Fixed loadmore functionality**
   The "Load More" feature in Carbonio Webmail now correctly loads additional emails in both conversation and message views, providing a smooth user experience.


**CO-1812: Disable actions when user lacks rights**
   Actions like read/unread, flagging, and deleting emails in a shared folder are now correctly disabled when the user does not have the necessary permissions.


**CO-1813: Fixed missing email subject in search**
   The email subject is now correctly displayed in the search module, message view, resolving the regression issue that previously hid the subject.


**CO-1814: Delete permanently in Junk folder fixed**
   In conversation mode, deleting permanently from the junk folder now correctly calls the intended action, resolving the regression issue.


**CO-1817: Restore Local Configuration for Mailbox**
   The mailbox startup configuration now uses local settings, as it did before the jetty embedding, allowing for more flexibility and control over mailbox settings.


**CO-1818: Mailbox can manage https direct connections (port 8443)**
   Mailbox startup configuration is restored to allow HTTPS connections through TCP port 8443.  


**CO-1822: Free/busy http url fixed**
   Improved the Carbonio free/busy URL by adding X-Forwarded-Proto to the Nginx template.


**CO-1827: S/MIME CA Certificate Error Fixed for Smooth Upload**
   The issue with S/MIME CA certificate errors has been resolved. Now, certificate files can be uploaded without errors, and emails are properly signed and encrypted, ensuring secure communication.


**CO-1829: Fix Mail UI sync issue after network outage**
   The Mail UI now correctly syncs and updates after a network outage, ensuring that users can see the latest email status, unread counts, and other dynamic changes without requiring a manual refresh.


**CO-1830: Improve mail composer contact management**
   The mail composer now enables users to easily move contacts between the TO, CC, and BCC fields, providing a more intuitive and efficient email composition experience.


**CO-1832: Refine text Email URL detection**
   The URL detection regex in text email message previews has been refined to accurately identify links, preventing false positives and ensuring a better user experience.


**CO-1838: ua-parser-js vulnerability resolved**
   The ua-parser-js vulnerability detected in the ZAP security scan for Carbonio 25.3 has been successfully fixed. This update enhances security and ensures a more robust system against potential threats.


**CO-1839: Removed deprecated drive service**
   The deprecated Drive service has been removed from the list of services displayed by zmcontrol status, eliminating confusion and concerns about unmaintained and potentially vulnerable code.


**CO-1840: Mail composer enhanced with font size**
   A fix has been implemented in the Carbonio Mail composer to improve font size selection. Now, the selected font is applied correctly and exclusively to the email body, ensuring proper formatting and consistency.


**CO-1844: Fix CVE-2022-25927 Vulnerability**
   The security vulnerability CVE-2022-25927 (CVSS 7.5) has been addressed and fixed in Carbonio-Login-UI. This update enhances security by mitigating potential risks associated with the vulnerability.


**CO-1845: Force message view in delegated Trash folder**
   In conversation mode, when accessing a delegated or shared Trash folder, the view is now correctly forced to message view.


**CO-1852: Fix reply to single message in conversation**
   In conversation mode, replying to a single message now correctly converts the message to a conversation without removing it from the conversation list.


**CO-1859: Fix Conversation list participant display**
   Participants are now correctly displayed in the conversation list when replying to a single message conversation, improving the overall user experience.


**CO-1861: Enhanced reply in message mode**
   When replying to a new email in message view, the sender's display name is now correctly preserved, ensuring that the reply is properly addressed.


**CO-1864: Fixed Calendar headings alignment**
   The calendar headings are now correctly aligned with the schedules in the Day, Week, and Work Week views, even when displaying multiple calendars.


**CO-1865: Fixed empty email content issue in re-search**
   The email content is now correctly displayed when re-executing a search with a different word related to the same email in message view mode, resolving the issue of empty body content.


**CO-1866:  Fix Calendar Enable/Disable Issue**
   The issue with enabling/disabling calendars and calendar notifications has been resolved, ensuring that changes are reflected immediately without requiring a browser reload.


**CO-1867: Fix composer error in search view**
   The composer now correctly opens when replying to a new email in search view without preview, resolving the error that previously occurred in message view mode.


**CO-1869:  Enhanced message preview closure**
   Changing the read/unread status of a message from the message list no longer closes the message preview in message view mode, allowing users to continue viewing the message while updating its status.


**CO-1880: Restored popup notification feature**
   The popup notification feature for new emails has been restored, allowing users to receive notifications when a new email is received, as long as the "Show a popup notification" preference is enabled.


**CO-1896: Fixed random display name issue**
   The email client now correctly displays the sender's email address as the display name when no display name is available, instead of showing a random display name from other recipients.


**CO-1915: Shared contact groups visible**
   The contact groups from shared address books are now visible in the contact groups list, allowing users to access and manage shared contacts.


**FILES-227: Make version optional in preview API**
   The preview/thumbnail APIs have been updated to make the version attribute optional, allowing clients to retrieve the latest version of a file without specifying a version number.


**FILES-887: Added missing carbonio-files-start-watches.sh**
   The Jenkinsfile has been updated to build ubuntu and rhel flavours separately, ensuring the carbonio-files-start-watches.sh file is correctly installed and the carbonio-files-watches.service is active out of the box.


**FILES-894: Fixed drag and drop File movement**
   The drag and drop functionality for moving files has been improved, allowing users to successfully move files to folders with a clear blue background indicator.


**FILES-896: Fixed Postgresql collation issue**
   The software now correctly handles Postgresql collation, ensuring that orderby queries are executed accurately and files are not duplicated, even when using the C or C.UTF-8 locale.


**IN-838: Missing carbonio-search-ui package added**
   The carbonio-search-ui package is now included in the installation process, ensuring that the necessary components are installed correctly.


**SHELL-259: Soapfetch batchrequest error handling fixed**
   The SoapFetch batchRequest error handling has been enhanced to correctly process and return the entire response, including fault fields, ensuring more accurate error handling and reporting.


**WSC-1588: Fixed Pdf thumbnail output format**
   The getPdfThumbnailURL API now correctly includes the "output_format" parameter, ensuring that PDF thumbnail previews load properly in messages bubble.


**WSC-1766: Show author after message deletion in group**
   The author's name is now displayed for remaining messages after a previous message is deleted, improving clarity and user experience.

*****

End of changelog
