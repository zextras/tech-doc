
Release 24.9.0
==============

Release Date: September 23rd, 2024

New Features List
-----------------

**CO-1042: New HikariCP Database Connector Introduced in Carbonio Advanced Modules**
   Introduction of HikariCP as the new database connector in the Carbonio advanced modules, replacing the old BGPool connector. This upgrade enhances performance, security, and reliability. Consequently, the BGPool connector will no longer be supported or available. 


**CO-1089: OTP Management Feature of the user to Control by Carbonio Admin**
   Carbonio administrators can now enable or disable the OTP Management feature for User and COS level. This new capability provides admins with greater control over security measures.


**CO-1133: Manage allowed/blocked addresses**
   Users can now manage their mailbox by adding/removing addresses from allowed and blocked lists, with validated addresses and real-time updates reflected in their inbox.


**CO-1135: Dynamic Signature Change in Carbonio Webmail**
   Carbonio Webmail users can now change their email signature while composing a message. This new feature enhances flexibility and allows users to tailor their signatures to suit different recipients and contexts, improving communication personalization.


**CO-1136: Real-Time signature update**
   Newly created signatures and updated signatures are now applied in real-time when composing new emails, without needing a page refresh.


**CO-1148: Enhanced Email Composition in Carbonio Webmail introduce post option in contextual Menu for Email Fields**
   Users can now copy-paste email addresses directly into the To, CC, and BCC fields while composing an email in Carbonio Webmail. Additionally, a small contextual menu appears when users right-click in the To, CC, or BCC fields.


**CO-1154: New Enhancement in Carbonio Mail Module: Date and Time Display for Emails**
   A new feature in the Carbonio Mail module now improves the visibility of email timestamps. Emails received on the current day will display only the time, while emails from previous days will show both the date and time. This enhancement offers a clearer and more intuitive way to track and manage email correspondence.


**CO-1178: Improved Read Receipt Management in Carbonio: New Discard Option and Persistent Pop-up**
   Carbonio Webmail introduces enhanced Read Receipt functionality with a new discard option in the pop-up board. If the user dismisses the pop-up, it will reappear the next time. However, if the user selects an action (either to notify or not notify), the pop-up will not be shown again, streamlining the email management process.


**CO-1182: Carbonio Webmail Introduces New Mail Preview Options: No split ( no preview ), Horizontal, and Vertical Split**
   Carbonio Webmail has rolled out new features for email previews, offering users enhanced flexibility in how they view their messages. The new options include "No split," which hides the email preview pane, and "Split Horizontal" and "Split Vertical" views, which allow users to customize the layout of their inbox with either a horizontal or vertical split for previews. These features work seamlessly, providing a more tailored and efficient email management experience.


**CO-1183: Email layout customization and resizing**
   Users can now resize the columns separating the email list from the preview and switch between vertical and horizontal layouts. The system will remember the user's preferences even after page refreshes or other interactions. The "change view" icon updates according to the selected layout, allowing for easy switching.


**CO-1200: Move unnecessary FATAL log entries to DEBUG level**
   Previously, restarting a mailbox with S3 store caused numerous FATAL log entries that were not true errors. These entries have now been moved to DEBUG level to avoid confusion and unnecessary alerts to administrators.


**CO-1209: Admin can restore deleted emails for legal-hold**
   This feature allows admins to restore deleted emails for an account under legal hold, based on specific criteria such as date range and deletion time. The restored emails will be placed in their original folders, and legal access can be granted to a specified consultant account.


**CO-1211: Enhanced Carbonio Mail Search Module with Advanced Features**
   The Carbonio mail search module has been enhanced with advanced features for improved functionality and user experience. Users can now perform advanced searches with greater precision, move mail items with the option to undo, and scroll through up to 500 mail items without encountering errors. Additionally, search results open in a new tab without any issues, making it easier to navigate and multitask efficiently.


**CO-1247: Carbonio Enhances Permanent Delete Functionality with User Confirmation Pop-Up**
   Carbonio has upgraded its permanent delete functionality by introducing a confirmation step to ensure contacts are deleted permanently. A pop-up window now appears on the screen, prompting users to confirm the permanent deletion of a contact, enhancing the safety and accuracy of contact management.


**CO-1258: Smartlink feature for exceeding attachment size**
   Users are now notified when their email attachments exceed the zimbraMTAMaxSize and are prompted to convert attachments to smartlinks. This feature ensures that large attachments can be handled without sending failures, giving users an option to convert and send the email successfully.


**CO-1283: Let admin-initiated account restoration with legal hold support**
   The admin can now restore an account, including all deleted emails, specifically for legal-hold activities. The restoration process allows the admin to specify a prefix, define a date range, and select a legal consultant account. The restoration can be limited to emails deleted after a specified date, or it can include all deleted emails if no date is provided. Restored emails are placed in their original folders, not in the trash. The admin can also enable legal access after the restoration process.


**CO-1294: Autocomplete Member Selection in 1-1 and Group Chats Limited to Users with carbonioFeatureChatsEnabled Attribute**
   In the member selection list for creating 1-1 or group chats, the autocomplete API now exclusively displays users who have the carbonioFeatureChatsEnabled attribute activated. This ensures that only users with chat functionality enabled are shown, making the process of selecting members for chats more efficient and accurate.


**CO-1343: New Scripts for LDAP Module Consistency in Carbonio Backup and Configuration Update Process**
   Carbonio has introduced new scripts designed to maintain the consistency and integrity of the LDAP module. These scripts are critical for ensuring the proper functioning of the LDAP module by managing backups and applying necessary configurations post-installation. To utilize these scripts, a module update is required. Once updated, the scripts automatically perform a backup of the existing LDAP configuration and apply the new configurations, ensuring a smooth and reliable upgrade process.


**CO-1350: Export HTTP connection pool metrics**
   This update introduces the export of HTTP connection pool statistics to Prometheus, allowing for enhanced monitoring of internal and external connection pools. Users can access these metrics via the endpoint: http://server:8080/service/metrics.


**CO-1378: Salesforce Integration for domain renewals**
   The Carbonio license renewal process now automatically sends the domain list and default domain to Salesforce upon renewal. This ensures that Salesforce is consistently updated with the latest domain information, improving accuracy for sales and support teams.


**CO-1410: Navigate between messages in preview**
   Users can now navigate between messages while in full preview mode, enhancing the user experience by allowing seamless movement through emails without returning to the main inbox.


**CO-1420: Apply Carbonio Design System v7**
   The Carbonio Admin Console UI has been successfully updated to incorporate Carbonio Design System v7. This integration ensures all menus and options function correctly, enhancing the overall user experience.


**CO-1421: Update to carbonio design system v7**
   The Carbonio admin panel has been successfully updated to Carbonio Design System version 7. The update appears to function smoothly, with no UI errors detected, ensuring a stable and enhanced user experience across the admin interface.


**CO-1425: Enhanced LDAP Migration Process for Carbonio Updates**
    The Carbonio LDAP update process has been improved with a pre-flight runner to handle miscellaneous LDAP migrations like updating module configurations and the PID file path. This ensures a more centralized, maintainable, and safe process during upgrades or fresh installs.


**DOCS-203: Handle over-quota error for document creation**
   When a new document, spreadsheet, or presentation creation fails due to exceeding the storage quota, the Files UI now displays a permanent snackbar with an appropriate error message informing the user of the storage limit and suggesting the deletion of items to free up space.


**DOCS-217: Move JAR to follow FHS standard**
   The carbonio-docs-connector JAR, previously located in /usr/bin/carbonio/docs-connector, will now be moved to /usr/share/carbonio to comply with the FHS standard. The service will invoke a bash script to execute the JAR, allowing sysadmins to adjust Java parameters and logging levels without needing a systemctl daemon-reload.


**DOCS-220: Seamless Operation of Carbonio Docs Editor Post WebSocket-Tre Removal in Consul Service Protocol**
   The Carbonio Docs Editor is functioning flawlessly following the removal of the WebSocket-Tre protocol from the Consul service file. This update streamlines the service architecture, reducing potential points of failure while maintaining optimal performance and reliability


**FILES-411: Grid layout implementation**
   The latest update to Carbonio File introduces a grid view layout, allowing users to browse files as thumbnails. This enhancement provides a more visually intuitive way to view documents, images, videos, and other file formats.


**FILES-762: File copy failure handling**
   The system now properly handles copy operations when the storage quota is reached. A permanent snackbar message informs the user: “Copy action failed. You have reached your storage limit. Delete some items to free up storage space and try again.” 


**FILES-763: Over quota handling on clone version**
   When cloning a version as current fails due to storage limit, users will see a permanent snackbar displaying the message: “Clone action failed. You have reached your storage limit. Delete some items to free up storage space and try again.” The error code for this issue is OVER_QUOTA_REACHED.


**FILES-765: Improved handling of over quota on "Upload Version"**
   Uploading a new version now displays a consistent over-quota error banner within the upload view when the quota limit is exceeded.


**FILES-795: Dropdown icon update for node type filter**
   The icon for the node type advanced filter now changes from ChevronDown to ChevronUp when the dropdown is opened and reverts back when closed.


**FILES-796: Increase dropdown width for owner filter**
    The dropdown width for the owner advanced filter in Files has been increased, ensuring all options are fully visible without the need for a horizontal scrollbar.


**FILES-824: Align preview API for correct image type**
   transparent PNG files now display correctly in previews and thumbnails without the black background. The preview/thumbnail API has been updated to request the same image type as the original file—PNG for PNGs to keep transparency, and JPEG for JPEGs.



**IN-700: Systemd support refinement on RHEL9**
   This update refines systemd integration for RHEL9, including adapting zmcontrol, zmsetup.pl, and ctl scripts to handle systemd. Documentation references have also been updated.



**IN-731: Swappiness set to 1 on all appservers**
   The swappiness setting has been adjusted from the default 60% to 1% on all mailbox/appserver nodes, aiming to enhance the performance of MySQL and Java-based applications.


**IN-734: CBPolicyd start/stop handling improvement**
   The start/stop operations for CBPolicyd are now correctly handled by zmcbpolicydctl, ensuring that the policyd PIDs are evaluated accurately.


**IN-735: Improved start/stop of zmmailboxdctl and zmmilterctl**
   The start/stop process for the zmmailboxdctl and zmmilterctl services has been improved. 


**IN-736: Improved Service stop/start logic for mailbox and milter**
   Enhanced the stop/start logic in the `zmmailboxdctl`, `zmmilterctl`, and `zmconfigdctl` scripts to ensure reliable termination of Mailbox and Milter services under various conditions, addressing issues where services may not stop correctly.


**IN-737: Update OpenJDK to 17.0.12+7**
   The OpenJDK version has been updated from 17.0.10 to 17.0.12+7, providing the latest security patches and performance improvements. This ensures the system runs on the most stable and secure version of OpenJDK available.


**IN-765: Serve JavaScript ES6 Modules as Correct MIME Type**
   JavaScript ES6 modules (.mjs files) are now served with the correct MIME type under the /static NGINX location. This fix ensures proper handling of ES6 modules.


**PREV-59: SVG Preview Support in Carbonio**
    Users can now preview SVG files in all Carbonio modules. The carbonio-preview feature automatically converts SVG files to PNG format for display. If a JPEG format is requested, the PNG will be re-converted to JPEG.


**PREV-135: Enhanced PDF preview with text and annotation layers**
   The PDF preview now includes both text and annotation layers, allowing users to select and copy text, as well as navigate annotated links such as external, section, or figure links.


**SHELL-200: Quota usage message adjustment**
   The quota usage message has been adjusted to display the used quota over the available quota, even when the user is over quota.


**SHELL-205: opt-in/Opt-out for data Collection**
   Added functionality allowing users to opt-in or opt-out of analytics data collection in Carbonio CE. The preference can be changed at any time via a new privacy section in the general settings.


**SHELL-207: Session expiration notification and redirection**
   Users are now notified of their session's upcoming expiration through snackbars, with progressive warnings and dynamic timers. This ensures users are aware of the session status and can save work before being logged out.


**SHELL-229: Removal of zimbraPrefTimeZoneId references**
   The zimbraPrefTimeZoneId setting has been removed from the settings. This update ensures that references to the timezone setting are completely removed, aligning the behavior with the latest changes.


**SHELL-232: Dynamic session expiration countdown in snackbar**
    A dynamic countdown timer is now shown in the snackbar 60 seconds before session expiration. The timer starts from 60 and counts down to 0, after which users will be redirected to the login page.


**SHELL-234: Kyrgyz Language Support**
   Added support for the Kyrgyz language in Carbonio. Users can now select Kyrgyz as their preferred language in the settings. Note that the composer and date-pickers will remain in English due to dependency limitations.


**SHELL-237: Remove "Application Version" from User Settings**
   The "Application Version" section has been removed from the user settings as it caused potential confusion and frustration for users. The version information is better managed by the admin through package version checks (apt/dnf), making it unnecessary in the user interface.


**UM-33: Move carbonio-user-management JAR to /usr/share**
   The Carbonio user management JAR file will now be installed in the /usr/share/carbonio/ directory to comply with the FHS standard. A bash script is introduced to execute the JAR, allowing sysadmins to update Java parameters and log levels without needing to run systemctl daemon-reload.

*****

Bugfix List
-----------

**CO-1139: Enhanced Mail Compose Board with Real-Time Signature Update**
   The new mail compose board now includes an enhanced feature that updates the default signature in real-time. Users will see their updated signature automatically appear in the compose board without needing to refresh the page.


**CO-1144: Inbox list refresh issue fixed**
   The inbox list now refreshes properly after a search, ensuring that no emails are buried and that the list is accurate without the need for a manual refresh.


**CO-1145: Delay Send: Prevent draft retention**
   When "delay send" is enabled, sending messages too quickly after editing will no longer leave a draft copy in the 'Drafts' folder. The system now correctly removes the draft once the message is sent.


**CO-1157: Compose message font settings synchronization**
   The composer now initializes with the font family, size, and colour settings from the "Composing Messages" section. This ensures the font settings match both in the composer and after sending the email.


**CO-1179: XML attachments download behavior update**
   XML files and other scriptable attachments are now dispatched with a content-disposition of attachment, ensuring they are downloaded even if requested as inline. This prevents direct preview and requires users to download the file to view its content.


**CO-1180: Enhanced Attachment Handling in Carbonio Mail**
   Improvement in Carbonio mail's attachment handling. The system now attaches .dat files as single files, resolving the issue where multiple files were previously created. This enhancement simplifies the attachment process,


**CO-1181:  Email preview clear on deletion**
   The system now clears the email preview panel when a draft email is deleted, ensuring a consistent user interface.


**CO-1199: Carbonio Webmail Introduces Enhanced Mail Preview Functionality**
   Carbonio Webmail has rolled out an upgraded mail preview feature, now allowing users to fully preview attached files, including lengthy EML files, directly within the platform. This improvement ensures that all content within an email, regardless of length, is fully displayed in the preview window, providing a seamless and comprehensive viewing experience.


**CO-1272: Fixed filter application error on large folders**
   When applying a filter to a folder containing more than 10,000 items, the filter now raises a specific error message: "invalid request: attempted to apply filter rules to x messages, which exceeded the limit of 10000".


**CO-1275: Fix for "Download All Attachments" with "#" in Subject in Carbonio Mail**
   The "Download All Attachments" option in Carbonio mail has been resolved. Previously, if the email subject contained a "#", the feature would open a new URL with the mail header instead of downloading the attachments. This update ensures that attachments are now downloaded correctly.


**CO-1315: Manage network failure requests**
   In case of network errors during getFolderRequest and getShareInfoRequest, a modal will now be presented to users. This modal provides options to either retry reloading the page or close it to navigate to other Carbonio modules, enhancing user experience and reducing frustration.


**CO-1348: Improved PreviewServlet resource handling**
   PreviewServlet now handles resources efficiently, preventing recursive wait loops and releasing resources correctly when previewing invalid attachment parts. The attachment is no longer retrieved over HTTP transport when the user is local, avoiding unnecessary looping.


**CO-1366: Removal of incorrect AdminUI options**
   The "Allow the user to change the minimum checking interval" toggle in the AdminUI incorrectly updates the local delivery preference `zimbraPrefMailLocalDeliveryDisabled`. the incorrect has been removed. Additionally, duplicate fields in the AdminUI were also eliminated to streamline the interface.


**CO-1367: Post-Purge credentials retention after mailbox move**
   After mailbox data is moved between mailstores and purged from the source, credentials such as EAS passwords, MobileApp QRs, and service credentials should remain intact in Postgres.


**CO-1374: Domain delegation initialization error fix**
   The `initDomainForDelegation` command in Carbonio Admin now correctly handles domain delegation without failing due to missing distribution lists. Previously, the command would throw an exception when these required groups were not present, leading to errors.


**CO-1376: Complete deletion of guest accounts**
   The process for deleting guest accounts has been enhanced to ensure that both the LDAP record and the mailbox data are fully removed. This prevents inconsistencies in user management across the Carbonio system.


**CO-1395: Enhanced invite updates while adding new attendees**
   The fix addresses the issue of losing the participant acceptance status when adding or removing attendees. It ensures that the organizer retains the response status of previously invited attendees, so their responses are not lost, and the event status remains accurate.


**CO-1396: Service discover server startup issue fixed**
   Upon upgrading Carbonio to version 24.9.0, the service-discover server was previously failing to start due to the missing "grpc_tls" attribute in the main.json configuration file. The `ports.grpc` listener configuration no longer supports TLS, requiring the use of `ports.grpc_tls` instead. This issue has been addressed and fixed.


**CO-1407: Handle 5xx for invalid tokens**
   The Carbonio Files Sidecar service remains stable, even with altered or invalid 'ZM_AUTH_TOKEN' cookies. However, expired tokens lead to 5xx errors from the user management system. This update will fix that, enhancing overall service stability.


**CO-1412: Fix missing web.xml.in causing mailboxd failure on upgrade**
   The issue with mailboxd not starting after upgrading from version 24.7.1 to 24.9.0 on RHEL8 has been resolved. The problem was due to a missing `web.xml.in` file in the `carbonio-appserver-conf` package, which is now correctly included.


**CO-1413: `prov` subcommand functionality enhancement in Carbonio CLI**
   The `prov` subcommand in Carbonio CLI is now intended to correctly perform provisioning tasks without errors. Previously, the command would fail to execute, preventing the completion of provisioning activities.


**CO-1414: Permanent contact deletion process correction**
   The label on the button for permanently deleting a contact has been updated from 'Delete Address Book' to 'Delete Permanently', providing a clearer indication of the action's finality.


**CO-1417: LDAP module config update on package upgrade**
   The LDAP module configuration file is now successfully updated during the package upgrade, ensuring that LDAP starts correctly without encountering the argon2 issue.


**CO-1427: Cache flush after COS Modification**
   The system now automatically flushes the cache after modifying COS settings, ensuring that changes take effect immediately.


**CO-1436: Improved error handling for password reset**
   The Carbonio login UI now correctly handles error 422 from the backend during password reset, displaying appropriate error messages instead of incorrect generic messages.


**CO-1437: Handle DoPurgeMailboxes execution**
   The system will now handle the execution of the DoPurgeMailboxes command more gracefully. If High Availability (HA) is not enabled, the command will not throw an exception in single server or non-HA multi-server environments when attempting to run for orphan accounts.


**CO-1438:  Fix delete conversation API call**
    When deleting multiple conversations in selection mode, the correct API (ConvActionRequest) is now called, resolving the error that occurred when using MsgActionRequest.


**CO-1441: ActiveSync working without 404 Error**
   The ActiveSync service now correctly responds to requests at the URL http://$(hostname -f):8080/Microsoft-Server-ActiveSync, resolving the previous 404 error encountered by users.


**CO-1442: Fix for carbonio command error messages**
   The Carbonio command on the mailbox server no longer prints erroneous status logger messages related to unrecognized format and conversion specifiers when executing commands such as `carbonio core getlicenseinfo`.


**CO-1443: Jetty access log location fixed**
   The issue of Jetty not writing the access log file has been resolved. Access logs are now correctly stored in the `/opt/zextras/log/` directory.


**CO-1444: Update REST API URLs for zmmailbox**
   The latest update to Carbonio Webmail introduces a reset API that optimizes the zmmailbox import process for ICS and CSV files, ensuring smoother imports. The outdated URLs causing 404 errors have been updated, restoring functionality for file imports. 


**CO-1445: Revert Calendar Endpoint to /dav Path**
   The calendar endpoint on the Carbonio mailbox server has been reverted from `/service/dav` to the previous `/dav` path. This change addresses issues with the new REST API URL and ensures continued functionality for calendar services via the old path: `http://mbox-server:8080/dav/test-user@demo.zextras.io/Calendar/`.


**CO-1446: Conversation View Displaying All Mail Threads in Shared Account via Advanced Search in Carbonio Webmail**
   In Carbonio Webmail, the conversation view now successfully displays all mail threads within a shared account when using the advanced search feature. This enhancement improves visibility and organization of email threads, making it easier to manage and track communications within shared accounts.


**CO-1448:  Remove Reply actions in new tab**
   When opening a single message in a new tab, the reply, reply all, and forward actions are now hidden, aligning with the expected behavior.


**CO-1453: Autocomplete Issue in Group Chats on WSC Fixed**
   Cabonio WSC where the autocomplete feature occasionally failed to complete account names when adding users to group chats. This problem has now been addressed and fixed, Now this is working as expected


**CO-1456: License info display after successful activation**
   After activating the Carbonio license through the AdminUI or command line, the subscription details now correctly appear in the AdminUI Subscription page. The activation completes without errors, and all relevant information is visible, ensuring a smooth user experience.


**CO-1462: Improved Carbonio Autoprovision with Automatic Timestamp Sync**
   Carbonio Autoprovision has been enhanced to automatically sync the zimbraAutoProvLastPolledTimestamp when it is empty, using the carbonioAutoProvTimestampFormat time format. This ensures accurate synchronization, allowing Active Directory accounts to be provisioned successfully on the Carbonio server without manual intervention.


**FILES-113: Automatic renaming on node move with name collision**
   When moving a file or folder into a directory that already contains a node with the same name, the system now automatically renames the moved item by appending "(n)" to the original name, ensuring a seamless move operation.


**FILES-790: Fix for "Clone as current" not restoring correct version**
   The issue with the "Clone as current" feature, where selecting an older version to restore as the current one results in duplicating the most recent version instead, has been resolved. Now, the correct version is restored as expected.


**FILES-843: Carbonio Files filenames escape fixed**
   Filenames are now properly escaped in Files.


**IN-758: Improved LDAP startup robustness**
   LDAP service startup is now more robust with improved handling of process checks, preventing unintended terminations during startup.


**IN-767: Carbonio command system fix for RHEL9**
   Resolved issues with Carbonio commands not functioning correctly on RHEL9 systems. This update ensures that all system commands related to "carbonio" now execute as expected, improving compatibility with the RHEL9 environment.


**PREV-20: Transparent PNG background fixed**
   PNG images with transparent backgrounds are now returned correctly with transparency preserved, instead of being filled with a black background.


**PREV-141: Fix MIME type for PDF preview**
   The MIME type for .mjs files is now correctly configured, allowing PDF previews to work in production without triggering MIME errors in the browser.


**SHELL-239: Fix for Polling Interval Issue in Carbonio Webmail**
   This update fixes an issue in Carbonio Webmail where the waitDisallowed field was misread, causing unnecessary polling loops. The fix ensures the field is correctly handled, adjusting the polling interval properly to reduce server load and improve performance.


**SHELL-241: Hide privacy and remove account tab**
   In Carbonio Advanced, the "Privacy" section is now hidden inside the general settings on the secondary bar. Additionally, the "Account" section has been removed from the general settings in both CE and Advanced versions.


**SHELL-242: Board icon color restoration**
   When a board is opened, its icon on the primary bar now appears with the correct colors, showing the blue icon on a transparent background instead of turning entirely blue.


**TEAMS-4145: Fixed virtual rooms**
   Resolved an issue where users were unable to enter virtual rooms in development builds due to a missing parameter in the build:dev scripts.


**TEAMS-4146: Space deletion functionality in chats improved**
   The space deletion functionality within the Chats tab now works correctly without any errors.

*****

End of changelog
