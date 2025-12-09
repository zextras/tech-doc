Release 25.12.0 RC 
===================



New Features and Enhancements (45)
----------------------------------

This section highlights the new features and the enanchements introduced in this release. Each feature is designed to enhance user experience and system functionality. New features and Enhancements are visible to end users, for example, a new module, a new button, or a new option in a dropdown.



Enable drag and drop file attachment from Files to email composer (CO-1905)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Implements full cross-module drag and drop functionality between Files and Mails modules. Users can now drag files from the Files module and drop them into the email composer to attach them, including shared files. When files exceed attachment size limits, the system offers to convert them to smartlinks instead of blocking the action.


 
Original tracking code:  CO-1905 ['ZIF-1352']
    

Improve UX during creation and edit of contact groups (CO-2098)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Streamlines contact group creation by removing the '+' button and allowing immediate addition of contacts when selected from the dropdown. Users can now add members directly without additional confirmation steps, and external email addresses are supported with real-time validation feedback.


 
Original tracking code:  CO-2098 ['CO-2708']
    

Add error tooltips for appointment save and send actions (CO-2120)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves user experience by displaying informative error tooltips when appointment save or send actions are disabled. Users are now clearly informed about missing required fields (title for save, title and participants for send) before attempting these actions.


 
Original tracking code:  CO-2120 ['CO-1959', 'CO-2210']
    

Enable 2FA support for Carbonio Mail mobile app enrollment (CO-2239)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables two-factor authentication (2FA) for enrolling Carbonio Mail on Android and iOS devices. Addresses security concerns with QR code enrollment and improves account switching experience by requiring OTP verification during enrollment.


Technical details: 2FA activation requires OTP code entry after username/password authentication. QR code enrollment without 2FA is not secure.

 
Original tracking code:  CO-2239 ['CO-1907']
    

Add day navigation arrows in planner (CO-2256)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds left and right arrow navigation in the planner to allow users to move between days more quickly and intuitively, replacing the need to manually select dates through the date picker.


 
Original tracking code:  CO-2256 ['—']
    

Return user to mail list after deleting email in no split layout (CO-2281)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves user experience by automatically returning to the email list after deleting an email in no split layout mode, reducing confusion and speeding up the workflow.


 
Original tracking code:  CO-2281 ['—']
    

Use different icons for recurrent appointments and snooze functionality (CO-2284)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves icon clarity in Calendars by using distinct icons for recurrent appointments and snooze/reschedule functions. Replaces the recurrent icon with a clock icon for snooze reminders, and the clock icon with a calendar icon for rescheduling missed appointments, reducing user confusion.


 
Original tracking code:  CO-2284 ['—']
    

Improve calendar sharing process (CO-2285)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enhances the calendar sharing process by converting the Share with public dropdown into a checkbox to prevent errors on repeated selections, adding proper user feedback for sharing actions, and eliminating duplicate calendar mounts when user roles change. Simplifies the sharing workflow by consolidating it into a single dedicated modal separate from the calendar edit modal.


 
Original tracking code:  CO-2285 ['—']
    

Autocomplete during email creation shows correct display names in ChipInput (CO-2298)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves autocomplete functionality in email creation to display contact display names instead of first name + last name combination. This enhances user experience for all Carbonio infrastructure users.


Technical details:  Updated label generation logic to prioritize display name over firstName/lastName combination. Enhanced contact mapping to preserve original email for display name extraction.

 
Original tracking code:  CO-2298 ['CO-2299', 'CO-2636']
    

Enhance distribution list autocomplete to show display names (CO-2299)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves autocomplete functionality by displaying distribution list display names instead of just email addresses. Users now see meaningful names when selecting distribution lists, matching the behavior already available for regular contacts.


 
Original tracking code:  CO-2299 ['CO-2298', 'CO-2636']
    

Enhance nginx templates to allow custom UI extensions with backends (CO-2301)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables custom UI extensions to include backend services by adding nginx configuration includes for extensions. Allows system packages to deploy upstream and backend configuration files without manual nginx template modifications.


Technical details: Added /opt/zextras/conf/nginx/extensions folder with include directives in nginx templates: include /opt/zextras/conf/nginx/extensions/backend-*.conf and include /opt/zextras/conf/nginx/extensions/upstream-*.conf. Custom packages can deploy upstream-myextension.conf and backend-myextension.conf files with proxy configurations.

 
Original tracking code:  CO-2301 ['ZIF-1130', 'CO-1583', 'CF-724']
    

Update external documentation links in Admin Panel (CO-2320)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Updates Help & Documentation links in the user menu to point to the correct Carbonio CE and Carbonio documentation based on the edition. Removes the redundant Help & Documentation button from the bottom right to simplify the UI and improve coherence.


 
Original tracking code:  CO-2320 ['CF-1214', 'CO-1824', 'CO-2575']
    

Add HTTP support on Carbonio proxies (CO-2324)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Restores HTTP and both modes for Carbonio proxies to support customers with load balancers performing SSL offloading. Enables deep packet inspection and accommodates infrastructure setups where HTTP traffic is received on proxies instead of HTTPS.


Technical details: Reintroduced both mode for zimbraReverseProxyMailMode attribute. Added HTTP nginx templates: nginx.conf.web.http.default.template and nginx.conf.web.http.template. Supports X-Forwarded-Proto header for proper redirect handling. zimbraReverseProxyMailMode now accepts: https, redirect, both. Templates located in conf/nginx/templates.

 
Original tracking code:  CO-2324 ['CO-551', 'CO-499', 'ZTD-1471']
    

Implement ESC key for closing modals across product (CO-2338)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables users to close all modals consistently by pressing the ESC key across all modules in Carbonio. This improves accessibility and user experience by providing a standard keyboard shortcut to dismiss modals without using the mouse.


Technical details: Affected modals include: Create Virtual Room (ws-collaboration), Create/Edit address book (contacts), Create/Edit calendar (calendar), Create folder (mails), and common modals across modules.

 
Original tracking code:  CO-2338 ['CO-2228', 'CO-1524']
    

Add Radio component in UIKit (CO-2343)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds the Radio component to UIKit with proper organization and arrangement. Includes handling for disabled radio tooltips.


 
Original tracking code:  CO-2343 ['CDS-57', 'CO-2725']
    

Enable Folder Download via Public Access Links (CO-2380)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables users to download entire folders as compressed ZIP files through Public Access Links instead of downloading individual items one at a time. The system enforces the carbonio-files/max-downloadable-size-in-mb limit across all downloads and displays generic error messages when size limits are exceeded.


Technical details: New API endpoints: GET /download/{nodeId}/check for single file validation, POST /download-multiple for batch downloads, POST /download-multiple/check for batch validation. Parameters include nodeId (UUID), node_link_id, and optional access_code. Responses: 204 for successful checks, 200 for downloads, 400/404/503 for errors.r

 
Original tracking code:  CO-2380 ['FILES-952']
    

Enhance Carbonio Files stability on large deployments (CO-2381)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves Carbonio Files stability in large deployments with 1000+ concurrent users. Resolves service instability issues where the service continuously goes up and down, and fixes connection pool validation errors.


Technical details: Configuration adjustments required: 1) /etc/carbonio/files/config.properties - add spring.datasource.hikari.maxLifeTime=600000 to resolve HikariPool connection validation errors. 2) /etc/zextras/service-discover/carbonio-files.hcl - update timeout to 60s and interval to 30s to resolve service discovery critical check warnings. Restart carbonio-files and carbonio-files-sidecar services after changes.

 
Original tracking code:  CO-2381 ['CO-2474']
    

Allow users to create folders when saving attachments to Files (CO-2386)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables users to create new folders on-the-fly when saving email attachments to Files, instead of being limited to pre-existing folders. Users can now create a folder directly from the save dialog before storing the attachment.


 
Original tracking code:  CO-2386 ['FILES-973', 'ZIF-1243', 'CF-300']
    

Correct typing indicator to show actual draft content instead of last sent message (CO-2409)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves typing indicators in Chats to display the actual draft content users were typing when switching between conversations, instead of showing a preview of the last sent message. This enhancement provides accurate real-time context awareness and eliminates confusion when users switch between multiple chats.


Technical details: Typing indicator behavior updated to display draft content preview with Edit2 icon when draft exists. System displays appropriate icons based on conditions: typing indicator (name/s is/are typing), draft message preview, or last message with ACK/file indicators. Typing indicator persists across app sessions until draft is sent or cleared.

 
Original tracking code:  CO-2409 ['CO-2580']
    

Reduce audio notification volume and frequency during video calls (CO-2412)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Addresses excessive and aggressive audio notifications during video calls that disrupt meetings. Reduces notification volume to 0.5 on a 0-1 scale and implements intelligent frequency throttling to prevent overwhelming users with repeated sounds for participant joins, hand raises, and screen sharing events.


Technical details: Audio volume attribute reduced to 0.5 (scale 0-1). Hand raise notifications limited to first 3 raised hands (threshold lowered from 20). Waiting room notifications limited to first 3 people in queue. Participant join notifications throttled to minimum 5-second intervals between notifications, with 15-person limit per batch. Participant leave notifications removed. Screen sharing stop notifications removed.

 
Original tracking code:  CO-2412 ['CO-2419']
    

Normalize audio stream during video calls (CO-2413)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves audio quality during video calls by normalizing volume levels, ensuring participants with loud voices and quiet voices are heard at consistent levels.


Technical details: Set autoGainControl: true in the getUserMedia constraints

 
Original tracking code:  CO-2413 ['—']
    

Add mobile push notifications for incoming meetings (CO-2418)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables users to receive mobile push notifications when someone initiates a 1:1 call or group meeting. Users are now notified of incoming calls on both Android and iOS devices.


Technical details: Mobile notification payload includes: title (Incoming call), message (caller name), senderId, roomId, meetingId, notificationType (new_meeting).

 
Original tracking code:  CO-2418 ['CO-2629']
    

Improve hand raise/lower audio feedback to reduce user confusion (CO-2419)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes sound notification when users lower their hand in video meetings while maintaining audio feedback for raising hand. This eliminates user confusion and annoyance from receiving identical audio cues for opposite actions, improving meeting experience and reducing audio fatigue.


 
Original tracking code:  CO-2419 ['CO-2412', 'GB-840']
    

Manage Enter key while swapping between KANA and kanji (CO-2424)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Prevents accidental message sending when using Asian keyboards (Chinese, Japanese, Vietnamese) to swap between KANA and kanji or create new lines. Users can still send messages via the send button.


 
Original tracking code:  CO-2424 ['WSC-1145', 'WSC-1292', 'ZIF-905', 'CO-2421']
    

Message search in conversations (CO-2428)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables users to search for specific messages within group chats and 1:1 conversations by keyword, with results ordered by date and highlighted for easy identification. Users can quickly navigate to relevant messages without manually scrolling through chat history.


Technical details: Search uses MAM (Message Archive Management) with full-text-search query. Handles up to 50 results initially. Error handling with snackbar message: Something went wrong with the search. Please try again. Search state resets when switching conversations.

 
Original tracking code:  CO-2428 ['CO-2645', 'ZTD-1472', 'CO-2740']
    

Improve Carbonio Chats Waiting Room for External Users (CO-2430)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Consolidates the guest landing page and waiting room into a unified, streamlined experience. External users now see a professional interface with clear meeting context, device configuration options, and improved visual hierarchy instead of navigating through two separate pages with confusing copy and misleading imagery.


 
Original tracking code:  CO-2430 ['—']
    

Enable AVDB Updater service to utilize HTTP proxy configuration (CO-2436)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables the AVDB Updater service to use HTTP proxy configuration for internet connectivity, allowing organizations to route antivirus database updates through corporate proxy servers.


Technical details: AVDB Updater service proxy configuration support

 
Original tracking code:  CO-2436 ['COR-916']
    

Optimize email filter/order height for small screens (CO-2552)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Addresses layout issues where the new email filter/order feature occupies excessive vertical space on small screens, reducing available mail list viewing area and impacting user experience in Carbonio Web UI.


 
Original tracking code:  CO-2552 ['CO-2807', 'CO-2556']
    

Improve sorting and filters header responsiveness (CO-2556)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves email filter/order header responsiveness on smaller screens and reduced window widths. Addresses layout issues caused by fixed height, minimum width constraints, and long button labels that break gracefully on narrow viewports.


 
Original tracking code:  CO-2556 ['CO-2552']
    

Print the advanced modules status (CO-2574)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables retrieval of advanced modules status in systemd infrastructure. Previously, zmcontrol status did not display module information in systemd environments, unlike the legacy init infrastructure.


Technical details: In systemd infrastructure, the command now displays advanced modules status alongside enabled systemd targets.

 
Original tracking code:  CO-2574 ['—']
    

Reorganize read receipt preferences in Admin Panel (CO-2579)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves read receipt user preferences to their correct locations in the Admin Panel. The 'Permit the user to ask for read receipt' preference is now in the Sending Mails panel, while 'Read Receipt settings' is in the Receiving Mails panel, aligning with their functional purpose.


 
Original tracking code:  CO-2579 ['CO-2848', 'CO-2845']
    

Fix recording modal messages about save location (CO-2601)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Corrects misleading messages in the recording modal that incorrectly stated recordings would be saved in the moderator's Files space. Recordings are now properly identified as being saved in the starter's Files space, with updated UI strings and API changes to ensure consistency between user actions and actual file destinations.


Technical details: API changes: Added folderId parameter to startMeetingRecording endpoint (API version 1.6.4). Updated strings: Recording Widget, Stop recording modal, Recording snackbar, and Recording settings. Removed folder name input field from stop recording modal. Modified /startMeetingRecording to use folder_id parameter; /stopMeetingRecording ignores both name and folder_id for forward compatibility. Updated DS with new readOnly prop on input component.

 
Original tracking code:  CO-2601 ['ZTD-1426']
    

Provide carbonio-openjdk build with Java 21 for carbonio-thirds (CO-2637)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Evaluates and enables migration of carbonio-openjdk to Java 21, providing updated build packages for testing and deployment.


 
Original tracking code:  CO-2637 ['—']
    

Allow primary color on autoFocus for Input component (CO-2645)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables the Input component to display primary color styling when the autoFocus property is set to true, improving visual consistency and user feedback.


 
Original tracking code:  CO-2645 ['CO-2428', 'IN-963']
    

Generic handling of ICS invitations with Yes/No/Maybe replies to Organizer (CO-2668)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables users to reply Yes/No/Maybe to calendar invitations in ICS format received via email, even if not listed as attendees. Replies are sent directly to the event organizer and automatically update the user's calendar.


Technical details: Handles .ics (iCalendar) format attachments in emails. Responses are sent to the ORGANIZER field from the ICS file rather than the email sender. Calendar updates are synchronized with the reply action.

 
Original tracking code:  CO-2668 ['CO-2290', 'CO-2681']
    

Implement Subscription Status Banners on Dashboard and Subscription Module (CO-2679)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds subscription status banners to the Admin Panel Dashboard and Subscription module to display maintenance states. Warning banners (yellow background) indicate non-critical warnings and can be temporarily dismissed by admin users until page reload.


Technical details: Banners display on Dashboard and Subscription module. Warning banner types: MAINTENANCE EXPIRING, MAINTENANCE EXPIRED. Visible only to Admin users with Subscription module access. Banners reappear after page reload when dismissed.

 
Original tracking code:  CO-2679 ['CO-2680']
    

Expose maintenance_status in GetLicenseInfo API for Admin Panel (CO-2680)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


The GetLicenseInfo API now returns maintenance_status for PERPETUAL licenses, enabling the Admin Panel to display appropriate maintenance status banners. This provides administrators with visibility into license maintenance periods and expiration warnings.


Technical details: New global attribute: maintenanceWarningThreshold (default: 30 days). Status values: active (within maintenance period), expiring (less than 30 days before maintenance_end_date), expired (current date greater than maintenance_end_date).

 
Original tracking code:  CO-2680 ['CO-2679']
    

Improve UX during creation and edit of Calendar Groups (CO-2708)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Streamlines calendar group creation by removing the confirmation button and automatically adding selected calendars to the group. Newly added calendars now appear at the top of the list for immediate visual feedback, making the workflow faster and more intuitive.


Technical details: Removes the '+' button from the calendar group creation/edit modal. When users select a calendar from the dropdown, it is immediately added to the group list. The input field clears and remains ready for adding more members. Implementation uses ChipInput component.

 
Original tracking code:  CO-2708 ['CO-2098']
    

Adjust video tile scaling for vertical mobile videos in meeting (CO-2711)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves video display in Chats meetings by intelligently detecting video source orientation. Landscape videos use cover-fit to fill the tile, while vertical mobile videos use contain-fit to display the entire stream without cropping, ensuring mobile users see their complete video.


Technical details: Implemented intelligent video scaling logic that detects video source orientation. Landscape videos (webcams) maintain cover-fit behavior for 16:9 tile area. Vertical videos (mobile devices) use contain-fit approach to display complete video stream without cropping.

 
Original tracking code:  CO-2711 ['—']
    

Reorganize and group toolbar options in Composer for better readability and usability (CO-2735)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves Mail Composer toolbar usability by reorganizing and grouping related controls into logical categories. The new layout follows a progressive, task-oriented flow that mirrors typical message composition patterns, making it easier for users to locate and access frequently used formatting tools.


Technical details: Toolbar reorganization groups controls by functionality: font/style (fontfamily, fontsize, styles, forecolor, backcolor), text formatting (bold, italic, underline, strikethrough, removeformat), alignment and direction (alignleft, aligncenter, alignright, alignjustify, ltr, rtl), lists (bullist, numlist, outdent, indent), insert elements (link, table, insertfile, image, imageSelector, emoticons), and view controls (visualblocks, code).

 
Original tracking code:  CO-2735 ['—']
    

Use browser language for External Guest (CO-2766)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables External Guest users to have their interface language automatically set based on their browser language settings instead of the shell language.


 
Original tracking code:  CO-2766 ['—']
    

Add device name parameter to token API endpoint (CO-2779)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enhances the /token API endpoint with a device_name parameter to enable server identification of tokens from the same physical device..


Technical details: When deviceName remains the same across requests from the same device, the database record is updated instead of creating duplicates.

 
Original tracking code:  CO-2779 ['—']
    

Add attachment size sorting option to Sort by menu (CO-2807)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds Attachment size as a sorting option in the Sort by menu, making it easier for users to sort emails by attachment size without needing to use the filter-then-sort workaround.


 
Original tracking code:  CO-2807 ['CO-2552', 'CO-2871']
    

Improve doPurgeMobileState output message clarity (CO-2814)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Makes the doPurgeMobileState command output message more meaningful by replacing the unclear record deletion counts with a clear summary of total sync records deleted.


Technical details: Output now displays: checkNonActiveAccountDays, deletedSyncRecordsOfActiveAccounts, deletedSyncRecordsOfNonActiveAccounts

 
Original tracking code:  CO-2814 ['CO-2309']
    

Reorganize read receipt settings in Admin Panel (CO-2845)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves read receipt settings from Sending Mails to Receiving Mails section in Admin Panel under COS Preferences. Adds toggle option to permit users to request read receipts in Sending Mails section.


 
Original tracking code:  CO-2845 ['CO-2579']
    


|


Bug Fixes (72)
--------------

This section lists the bugs that have been fixed in this release. Bug fixes address issues reported by users or identified by the development team, improving the overall functionality and user experience of the system. These fixes ensure that the software operates as intended and resolves any problems that may have affected users.



Fix system attempting to display deleted draft after sending (CO-1762)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where the system attempts to retrieve and display a draft message after it has been sent and deleted, resulting in an undefined message error. This prevents unnecessary backend queries and console errors when working with sent drafts.


 
Original tracking code:  CO-1762 ['CO-2738']
    

Remove feedback form from Admin Panel (CO-1824)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes the feedback form from the Admin Panel which was broken due to disabled Sentry integration.


 
Original tracking code:  CO-1824 ['CO-2320']
    

Fix multiple duplicate draft editors opening on repeated clicks (CO-1964)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes the bug where clicking the edit draft action multiple times would open duplicate editor windows for the same draft mail. Now only one editor window opens per draft, preventing user confusion from multiple simultaneous editing windows.


 
Original tracking code:  CO-1964 ['CF-520', 'IRIS-4560', 'AC-730']
    

Fix email regexp validation in Admin Panel (CO-2079)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes incorrect regex validation for email address checking in the Admin Panel. Ensures email addresses are properly validated according to standards.


 
Original tracking code:  CO-2079 ['—']
    

Fix carbonio config set allowing edits at wrong configuration level (CO-2146)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes carbonio config set command incorrectly allowing attributes to be edited at configuration levels where they should not be modifiable. For example, usageDataCalculatorCronString is a global-level attribute but was incorrectly settable at account level.


Technical details: Command: carbonio config set

 
Original tracking code:  CO-2146 ['—']
    

Fix Send and Save buttons remaining active despite validation errors in Calendar editor (CO-2210)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where the Calendar editor's Send and Save buttons remained enabled despite invalid input such as malformed or duplicated resources, attendees, or missing required fields. Buttons are now properly disabled until all validation errors are resolved, with tooltips explaining the reason.


Technical details: Save button disabled if: no title OR invalid/duplicate resources. Send button disabled if: no title OR no recipients OR invalid/duplicate resources. Added resource validation for meeting rooms and equipment.

 
Original tracking code:  CO-2210 ['CO-2199', 'CO-2120', 'GB-858']
    

Fix expanded conversation closing when scrolling out of view (CO-2279)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes issue where expanded conversations in the email list would automatically close when scrolled out of view. Users now have full control to keep conversations expanded until they manually close them.


 
Original tracking code:  CO-2279 ['—']
    

Fix HTML content not displayed in calendar appointments (CO-2291)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes calendar appointments where HTML content is not displayed in webmail when calendar invites are created by faulty email clients missing the DESCRIPTION property. Implements a fallback mechanism to extract description content from email message parts structure, ensuring users can view important information in calendar appointments.


 
Original tracking code:  CO-2291 ['CO-2292', 'CO-2290']
    

Fix calendar appointment forwarding losing text content (CO-2292)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where forwarding a calendar appointment loses the original appointment text content. The forwarded appointment now maintains the original invite message including HTML and text formatting.


Technical details: Enhanced SOAP request to include multipart message content when forwarding appointments. Added message parts extraction from appointment invite data. 

 
Original tracking code:  CO-2292 ['CO-2291', 'CO-2290']
    

Fix accepting shared folders by using owner name in mount point (CO-2294)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes failure when accepting shared folders (Calendar, Contacts, Inbox, Sent, Drafts, Junk, Trash) due to mount point name conflicts. The system now appends the owner's name to the shared folder name to avoid duplicates with existing system folders.


Technical details: mount point name changed from source folder name to format 'folder name of owner name'. Affected system folders: /Calendar, /Contacts, /Drafts, /Emailed Contacts, /Inbox, /Junk, /Sent, /Trash.'

 
Original tracking code:  CO-2294 ['CO-1491', 'CO-1903']
    

Fix inability to delete inline images in emails (CO-2297)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where inline images added to emails could not be deleted and would incorrectly appear as attachments when the email was sent or saved as draft. This affected over 200 users at Comune Mirano.


 
Original tracking code:  CO-2297 ['CO-2506', 'CO-2870']
    

Fix iOS Carbonio mail app virtual room redirect to Apple Store (CO-2307)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where tapping the virtual room selector while creating or editing an event in the iOS Carbonio Mail app incorrectly redirected users to the Apple Store instead of allowing room selection.


Technical details: Affected device: Apple iPhone 14 Pro. iOS version: 18.6. Carbonio Mail version: 1.2.12.

 
Original tracking code:  CO-2307 ['CF-1447']
    

Fix Excel tables pasting incorrectly in mail composer (CO-2310)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where tables copied from Excel or LibreCalc were pasting incorrectly in the mail composer, appearing as if pasted twice. The problem occurred after upgrading to Carbonio 25.6.0 and affected users who previously had working functionality in version 25.3.1.


 
Original tracking code:  CO-2310 ['CF-1459']
    

Prevent accidental closure of Admin Panel settings when highlighting outside boundaries (CO-2311)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes windows in Admin Panel and web-client closing unexpectedly when users highlight text and release the mouse button outside window boundaries. This prevents loss of unsaved data when administrators manage accounts and domains.


 
Original tracking code:  CO-2311 ['CF-1298', 'ZIF-1182', 'CO-1634']
    

Fix sent items displaying only first name of contacts (CO-2312)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where sent items displayed only the first name of contacts instead of their full name. When a contact was saved in the Contacts list and an email was sent from webmail, only the first name appeared in the recipients field. The fix ensures full names are properly displayed by using the correct fallback chain: fullName if available, then firstName + lastName combination, then firstName as final fallback.


Technical details: fallback chain: fullName > firstName + lastName > firstName. This prevents the composer from sending incomplete participant data to SavedraftRequest, ensuring APIs return complete participant information with full names.

 
Original tracking code:  CO-2312 ['CO-2636']
    

Fix style loss when replying to or forwarding emails (CO-2313)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes HTML email formatting where CSS styles from the head tag were lost when replying to or forwarding emails. Styles are now preserved and inlined into HTML elements, maintaining proper email layout and structure across different email clients.


Technical details: Implements CSS inlining functionality using juice dependency. Inline styles are maintained when forwarding/replying with graceful fallback if inlining fails.

 
Original tracking code:  CO-2313 ['CF-1218']
    

Fix Admin Panel MaxMessageSize setting accepting zero value (CO-2314)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes the Max message size setting in the MTA section of Admin Panel that incorrectly interprets zero (0) as a literal value instead of 'no limit', causing email functionality to stop working.


 
Original tracking code:  CO-2314 ['CF-1202']
    

Fix filter showing variable name instead of message count (CO-2316)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where applying a filter displayed the variable name {{involvedMessagesCount}} instead of the actual number of messages to be processed. This affected all UI languages and occurred in versions 25.3.1 and 25.6.0.


 
Original tracking code:  CO-2316 ['CF-1249']
    

Fix getDeviceInfo command routing on different mailbox nodes (CO-2317)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes getDeviceInfo command failing with WrongHostException when executed on a mailbox node different from where the account is hosted. The command now properly redirects requests to the correct mailbox server.


 
Original tracking code:  CO-2317 ['CF-1181']
    

Fix forgotten password recovery when password has expired (CO-2322)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes password recovery procedure that failed when user account password had expired. Users can now successfully reset their password via the forgotten password link and log in to their mailbox.


 
Original tracking code:  CO-2322 ['—']
    

Fix draft email editing permissions in shared mailboxes (CO-2326)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where draft emails moved to a delegated mailbox could not be edited by the original creator, only by the mailbox owner. Both the original creator and mailbox owner can now edit drafts in shared mailboxes, consistent with delegation rights.


 
Original tracking code:  CO-2326 ['CF-1137', 'HIT-84']
    

Fix incomplete file upload cleanup when EndOfDecoder error occurs (CO-2370)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where file uploads in Carbonio Files fail during the EndOfDecoder process, leaving orphaned database rows in PostgreSQL while blob data is not saved. This causes users to see fake uploaded files in their home folder with no actual data stored, while the upload appears successful in the web UI.


Technical details: Issue occurs in Carbonio Files upload process during EndOfDecoder call. When upload fails, blobs are removed from local primary volume or S3, but corresponding PostgreSQL rows in carbonio-files-db remain. Affects local file system uploads.

 
Original tracking code:  CO-2370 ['ZIF-880', 'CO-2373', 'FILES-977', 'HIT-88', 'CF-832']
    

Fix incomplete blob upload when disk space is less than file size (CO-2373)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a critical issue where users could upload files larger than available disk space in Carbonio Files, resulting in incomplete blob uploads without error notification. The system now validates available space before upload and prevents partial file storage.


Technical details: Issue occurs with local filesystem storage at /opt/zextras/store/blobs. It involves creating a dedicated temp folder at /opt/zextras/file_tmp_upload, validating disk space before upload (POST file size vs local disk space), and moving blob from temp to primary storage with error handling and database cleanup on failure.

 
Original tracking code:  CO-2373 ['ZIF-880', 'CO-2370']
    

Fix external guest accounts cluttering accounts list in Admin Panel (CO-2389)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves issue where external guest accounts created for Chats meetings were not being deleted after meetings ended, cluttering the accounts list. Also fixes error when moving accounts to defaultExternal COS.


Technical details: External guest accounts (e.g., guest-2d302fce-fe44-41f1-adae-b332710b850e) were persisting for 24 hours instead of being deleted immediately. Error occurred when accessing guest accounts in Admin Panel and when moving accounts to defaultExternal COS with error message: zimbraCOSId must be a valid id.

 
Original tracking code:  CO-2389 ['CO-1376']
    

Fix incorrect encoding of non-Latin characters in video file names in Chats (CO-2393)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes encoding issue where non-Latin characters (Cyrillic, Chinese, etc.) in chat room names or manually added to video file names during saving appeared as gibberish. Video files now correctly display non-Latin characters in their file names.


 
Original tracking code:  CO-2393 ['CO-1921']
    

Fix ActiveSync displaying folder IDs instead of UnknownFolder (CO-2496)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes ActiveSync sync operation incorrectly displaying folder IDs instead of UnknownFolder labels when folders are marked for deletion. This improves clarity in sync logs for administrators monitoring folder synchronization.


 
Original tracking code:  CO-2496 ['—']
    

Fix carbonio-advanced file upload broken due to Netty lifecycle issues (CO-2502)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes file upload failures in carbonio-advanced caused by incorrect Netty lifecycle method ordering. The channelInactive method was being called before or during channelRead operations, causing premature resource deallocation and preventing uploads from completing.


Technical details: Issue: Netty channelInactive lifecycle method called before channelRead completion, causing resource deallocation conflicts. Affected component: UploadBlobHandler (com.zextras.modules.powerstore.http). Error: java.lang.RuntimeException: Unavailable request decoder at UploadBlobHandler.handleMessage and java.lang.NullPointerException in isFileUploadFinished. Root cause: channelInactive performs cleanup operations that deallocate resources still needed by channelRead, causing memory leaks and temporary file leaks.

 
Original tracking code:  CO-2502 ['GB-796']
    

Fix preview request sending wrong userId in multi-mailbox environments (CO-2503)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where users in the same chat room on different mailbox stores could not see attachment previews and thumbnails. The preview service now uses the attachment owner's userId instead of the requesting user's userId to correctly retrieve previews.


Technical details: Use attachment owner userUUID instead of requesting user userUUID for preview requests.

 
Original tracking code:  CO-2503 ['—']
    

Fix missing space between event title and invite label in Calendar (CO-2504)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes Calendar display where event title and invite label appear without spacing between them, improving readability of event information.


 
Original tracking code:  CO-2504 ['—']
    

Fix Consul configuration errors after upgrade to 1.32.x (CO-2519)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves Consul configuration failures following upgrade to version 1.32.x, including invalid protocol values in service-defaults configurations, missing proxy-defaults configuration entry, and deprecated TLS configuration fields. Ensures proper service operation and eliminates configuration errors and warnings.


Technical details: Affected files: carbonio-mailbox/packages/appserver-service/carbonio-mailbox-admin-service-protocol.json, carbonio-mailbox/packages/appserver-service/carbonio-mailbox-nslookup-service-protocol.json. Issues: Invalid protocol value 'https' in service-defaults (valid values: tcp, http, http2, grpc). Missing proxy-defaults/global config entry. Deprecated fields requiring migration: ca_file, cert_file, key_file, verify_incoming, verify_outgoing, verify_server_hostname to tls.defaults.* and tls.internal_rpc.* equivalents.

 
Original tracking code:  CO-2519 ['CO-2525']
    

Fix UI crash when component selector is used (CO-2537)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves UI crashes that occurred in specific scenarios including displaying folder content in message-mode, expanding conversations in conversation-mode, and during search operations. The issue was related to React.StrictMode in development builds.


Technical details: Affected operations: folder content display in message-mode, conversation expansion in conversation-mode, search functionality.

 
Original tracking code:  CO-2537 ['—']
    

Fix avatar picture not rendering after migration to emotion (CO-2565)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves avatar pictures failing to render after migration to emotion. Users will now see their avatar images displayed correctly.


 
Original tracking code:  CO-2565 ['—']
    

Fix password change failure when Carbonio is behind reverse proxy with multiple X-Forwarded-For IPs (CO-2569)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes password change failures in webmail when Carbonio is behind a reverse proxy and the X-Forwarded-For header contains multiple comma-separated IP addresses. Users were unable to change their password due to authentication errors, even with correct credentials.


Technical details: Issue: X-Forwarded-For header with multiple IPs (e.g., 82.66.104.181, 10.253.4.183) caused AuthorizationError during ChangePasswordRequest. Error message: Could not parse [IP1, IP2]. Affected operations: ListCredentialsRequest and ChangePasswordRequest in webmail parameters/authentication section.

 
Original tracking code:  CO-2569 ['HIT-219']
    

Remove CSS template literal inside background-image to render the image (CO-2570)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue in Files where CSS template literals inside background-image properties were preventing images from rendering correctly.


 
Original tracking code:  CO-2570 ['—']
    

Fix bulk delete failing for items after account migration (CO-2573)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where the runBulkDelete command fails to delete items after moving an account between volumes, resulting in NoSuchKey errors when attempting to remove blobs from S3 storage. The fix corrects S3 bucket URL definitions to use the standard endpoint format instead of bucket-name-prefixed URLs.


Technical details: Command: carbonio powerstore runBulkDelete. Issue: S3 bucket URL definitions in version 25.9.0 incorrectly included bucket name in URL (https://{bucketname}.s3.{region}.amazonaws.com), causing bulk delete failures with error 'The specified key does not exist'. Fix changes URL format to https://s3.{region}.amazonaws.com. Note: Old URL definitions will not be migrated;

 
Original tracking code:  CO-2573 ['GB-796']
    

Fix CarbonioStoragesService unable to read previously created bucket information (CO-2577)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where CarbonioStoragesService failed to read previously created bucket information, causing download operations to fail with a null host error. This fix ensures proper bucket configuration retrieval and prevents SdkClientException errors during file and chat blob downloads.


Technical details: Error: software.amazon.awssdk.core.exception.SdkClientException: Unable to marshall request to JSON: host must not be null. Affected component: DownloadServiceClient, DownloadBlobHandler. Endpoint: /zx/powerstore/v1/download/

 
Original tracking code:  CO-2577 ['CO-1452', 'GB-796']
    

Fix ESC key breaking mail-ui module in search preview (CO-2589)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where pressing ESC while viewing an attachment preview in the search module causes the Mail-UI to become blank, requiring a page reload to restore functionality.


 
Original tracking code:  CO-2589 ['CO-2828']
    

Fix blank video streams when toggling webcam in 1:1 calls (CO-2597)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where toggling video on/off in a 1:1 meeting call incorrectly blanked the other user's video stream. Ensures smooth video performance during calls.


Technical details: SUBSCRIBED and UPDATED events from Videoserver to Chats for VIDEO_IN, VIDEO_OUT and SCREEN types. Clients now filter to process only VIDEO_IN events.

 
Original tracking code:  CO-2597 ['GB-840']
    

Fix Carbonio tasks thread leak causing system crash (CO-2603)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves a thread leak in the Carbonio tasks service that causes OutOfMemoryError and potential system crashes on servers with high task usage. Tasks processes were not properly released, consuming all machine resources over time (1 day to 1 month).


Technical details: Error: java.lang.OutOfMemoryError: unable to create native thread. Affected component: carbonio-tasks JVM. Workaround: frequent service restart. Affects versions 25.3 and 25.6.

 
Original tracking code:  CO-2603 ['CF-1341', 'HIT-157']
    

Fix drag and drop attachment bypassing smart link and email size validation (CO-2643)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a critical issue where dragging and dropping files into the email composer bypassed smart link conversion and attachment size validation, allowing users to accidentally send emails with oversized attachments that could fill the primary Carbonio disk.


 
Original tracking code:  CO-2643 ['—']
    

Fix notification options being swapped in appointment settings (CO-2659)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where notification options in calendar appointments were inverted. Selecting 'never' would apply 'at the moment' and vice versa, preventing users from setting correct notification preferences.


 
Original tracking code:  CO-2659 ['GB-767']
    

Remove non-moderator participants from Chats on abrupt leave (CO-2661)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes non-moderator participants remaining in Virtual Meeting Rooms after closing the browser tab or experiencing a crash. When a non-moderator leaves a meeting (via tab close, browser crash, or network disconnection), they are now automatically removed from the room's participants list.


 
Original tracking code:  CO-2661 ['—']
    

Fix zmconfigdctl stop command incorrectly reporting failed status (CO-2665)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes zmconfigdctl stop command incorrectly reporting 'failed' even though the zmconfigd service has been successfully terminated. The issue was caused by the return code variable being overwritten inside the check_running() function, preventing proper status reporting during service shutdown.


 
Original tracking code:  CO-2665 ['ZCT-1392', 'IN-794', 'GB-797', 'CF-1501']
    

Replace hardcoded domain in Calendar Settings with dynamic text (CO-2667)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes hardcoded zextras.com domain reference in Calendar Settings General section. The domain is now dynamically retrieved based on system configuration or uses generic text.


Technical details: Calendar Settings → General section. Previous text: Users below must be on this e-mail system (zextras.com). You may use the full e-mail address or just the username.

 
Original tracking code:  CO-2667 ['CF-1506']
    

Fix 'Not a valid e-mail' error when removing Calendar forward invites address (CO-2669)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an error that prevented users from removing a forwarding email address in Calendar Settings. Previously, saving with an empty field would trigger a validation error, making it impossible to clear a configured forwarding address.


Technical details: Issue occurs in Calendar Settings → Forward Invites when attempting to save with an empty email field.

 
Original tracking code:  CO-2669 ['CF-1508']
    

Fix Chats unread message badge showing incorrect count on first login (CO-2689)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes Chats displaying an unread message badge showing 1 instead of the actual count of unread messages in conversations on first login. The issue occurred because the XMPP inbox request included fastening messages in the count.


Technical details: XMPP inbox request returns unread message count including fastening messages. Solution: fetch all messages and recount excluding fastenings to display accurate unread message count.

 
Original tracking code:  CO-2689 ['—']
    

Fix inline attachments incorrectly kept in all replies (CO-2692)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where all inline attachments (not only images) were incorrectly kept in replies and forwards even when not referenced in the message body. Users can now properly manage inline attachments without confusion.


Technical details: Updated cleanUpCi function to use regex-based bracket removal instead of substring extraction for proper content-ID handling. This allows correct mapping of content-disposition during message normalization, ensuring inline images receive inline disposition instead of attachment disposition.

 
Original tracking code:  CO-2692 ['CO-2784']
    

Fix file upload failing with HTTP 424 status (CO-2693)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves file upload failures in Carbonio Files that returned HTTP 424 (Failed Dependency) status. Users can now successfully upload files through the Files UI without encountering unhandled status errors.


Technical details: Endpoint: POST /services/files/upload. Error: HTTP 424 Failed Dependency with XML parsing error. Affected: image uploads (.jpg) and file creation. Environment: Carbonio 25.12 on RHEL9.

 
Original tracking code:  CO-2693 ['GB-797', 'CO-2841']
    

Fix incorrect icons for calendar groups (CO-2707)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes incorrect icons displayed for calendar groups in the secondary bar. Calendar groups now show the correct icons: GroupCalendarOutline for deselected groups and GroupCalendar for selected groups.


Technical details: Icons: GroupCalendarOutline (deselected state), GroupCalendar (selected state). Component: secondary bar calendar groups display.

 
Original tracking code:  CO-2707 ['—']
    

Fix date localization in calendar search results (CO-2717)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes calendar search results displaying dates in English instead of respecting the user's locale settings. Dates now properly localize based on the webmail language preference.


Technical details: Refactored search list item component from JSX to TypeScript. Updated date formatting logic to properly localize dates in search results based on user locale settings.

 
Original tracking code:  CO-2717 ['HIT-227']
    

Fix guest users stuck in infinite loading after session termination (CO-2723)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where guest users became stuck in an infinite loading state when session cookies were not properly deleted due to unexpected interruptions like computer shutdown or page reload. The fix enables the carbonioFeatureWscEnabled attribute for guest accounts, allowing the Shell to properly load Chats and other applications.


Technical details: Set carbonioFeatureWscEnabled to TRUE when creating guest accounts. This allows the Shell to load Chats code even when guest user attributes are set to FALSE.

 
Original tracking code:  CO-2723 ['—']
    

Fix browser making failed network requests to CID URLs in email rendering (CO-2724)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes the Mails UI causing the browser to make failed network requests to invalid CID (Content-ID) URLs when previewing emails. The getOriginalHtmlContent function was triggering automatic image loading during HTML parsing, resulting in console errors and unnecessary network overhead.


Technical details: Replaced document.createElement('div') with DOMParser.parseFromString() to prevent automatic resource loading during HTML parsing. Improved script removal logic by using a separate processedText variable instead of modifying text in-place. Affected component: HtmlMessageRenderer in Mails UI email message rendering.

 
Original tracking code:  CO-2724 ['—']
    

Fix attachment dropzone interfering with text drag-and-drop in editor (CO-2736)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where the attachment dropzone was blocking text drag-and-drop operations within the editor, preventing users from repositioning text or dropping text from external sources. The dropzone now only activates for file attachments, not text content.


Technical details: Modified drag-over logic to distinguish between file attachments and text content. Increased dropzone z-index to ensure proper layering. Added test coverage for text drag-and-drop behavior.

 
Original tracking code:  CO-2736 ['—']
    

Fix version mismatch preventing guests from joining virtual meetings (CO-2742)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where guests could not join virtual meetings when Chats version did not match the server version, displaying a false 'Meeting does not exist' error. The versioning system now handles version mismatches across all API calls, not just the initial authentication, ensuring external users can successfully access meetings.


Technical details: .

 
Original tracking code:  CO-2742 ['WSC-1947']
    

Fix incorrect COS naming in Admin Panel (CO-2744)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes incorrect naming of COS (Class of Service) displayed in the Admin Panel COS tab, ensuring proper identification and management of service classes.


 
Original tracking code:  CO-2744 ['GB-838', 'CO-2754', 'GB-798']
    

Fix LDAP listening on multiple interfaces with systemd (CO-2746)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes LDAP server unable to listen on multiple interfaces (e.g., 389 and 636) when systemd is enabled. The systemd-envscript was not reading the ldap_bind_url configuration, causing only the first URL to be used instead of all configured URLs.


Technical details: File: /opt/zextras/bin/systemd-envscript. The script now checks ldap_bind_url configuration variable and uses it if set. Service file: /usr/lib/systemd/system/carbonio-directory-server.target.wants/carbonio-openldap.service with ExecStart parameter -h ${bind_url}

 
Original tracking code:  CO-2746 ['—']
    

Fix help button display when deleting COS (CO-2757)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes display issue where a truncated HE... button appeared instead of the HELP button when deleting Class of Service. The help button has been removed as there was no documentation linked to it.


 
Original tracking code:  CO-2757 ['GB-843']
    

Fix COS name conversion to lowercase (CO-2758)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes issue where Class of Service (COS) names with capital letters were being converted to lowercase. Now enforces lowercase-only naming with user guidance.


Technical details: COS name field now only accepts lowercase letters. Information string added to indicate that only lowercase names are accepted.

 
Original tracking code:  CO-2758 ['GB-842']
    

Fix spacing and alignment issues in Chats InfoPanel details (CO-2777)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves layout inconsistencies in the InfoPanel where dropdowns misalign in groups with descriptions, excessive spacing appears in 1:1 conversations, and long last seen text causes unwanted white space.


 
Original tracking code:  CO-2777 ['—']
    

Fix change password workflow (CO-2803)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where the change password workflow was not functioning after recent changes, preventing users from changing their passwords.


 
Original tracking code:  CO-2803 ['—']
    

Fix Certbot AttributeError with josepy ComparableX509 module (CO-2815)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an AttributeError preventing carbonio-certbot utility from running. The josepy module was missing the ComparableX509 attribute, causing certbot commands to fail with a traceback error.


Technical details: Error: AttributeError: module 'josepy' has no attribute 'ComparableX509' in /opt/zextras/common/certbot/lib/python3.10/dist-packages/certbot/crypto_util.py at line 485. Affected command: /opt/zextras/common/certbot/bin/carbonio-certbot. Verify with: certbot --version, certbot certificates, certbot renew. Expected certbot version: 2.11.1

 
Original tracking code:  CO-2815 ['CO-2748', 'CO-2802']
    

Disable keyboard shortcuts when file preview is open (CO-2828)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes unexpected behavior when pressing Esc key during file preview in messages or conversations. The Esc key now closes only the file preview while keeping the message/conversation displayer open, instead of closing the message displayer underneath.


Technical details: Affected views: message view, conversation view, and search view.

 
Original tracking code:  CO-2828 ['CO-2589']
    

Fix calendar groups API failures due to missing metadata (CO-2836)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves issue where calendar groups fail to load and API calls return null values due to missing calendarIds in database metadata. The API is now more resilient and returns data even when optional fields are missing from the database.


Technical details: Issue: java.lang.NullPointerException when accessing custom metadata. Root cause: Contact Groups (Folders with metadata view 17) missing calendarIds field. Database query to identify affected records: SELECT * FROM mail_item WHERE metadata LIKE '%17:%' and mailbox_id = '<mailbox_id>'. Users can verify with GetFolderRequest API targeting root with view: calendar_group parameter, then delete affected groups using DeleteCalendarGroupRequest.

 
Original tracking code:  CO-2836 ['—']
    

Fix HTTP 424 error during file upload and document creation in Files (CO-2841)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves HTTP 424 Failed Dependency errors that prevented users from uploading files or creating documents in Carbonio Files. Users can now successfully upload files without encountering unhandled status 424 errors.


Technical details: Endpoint: POST /services/files/upload. Error: HTTP 424 with XML parsing error at response. Affects file uploads (tested with .jpg images) in Carbonio Files UI.

 
Original tracking code:  CO-2841 ['GB-797', 'CO-2693']
    

Fix carbonio-catalog startup: quarkus-run.jar path correction (CO-2844)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves carbonio-catalog service startup failure caused by incorrect jar file path. The service was looking for quarkus-run.jar in the wrong directory, preventing the catalog service from starting.


Technical details: The quarkus-run.jar file is located at /usr/share/carbonio/carbonio-catalog/quarkus-app/quarkus-run.jar instead of /usr/share/carbonio/carbonio-catalog/quarkus-run.jar. Error: Unable to access jarfile /usr/share/carbonio/carbonio-catalog/quarkus-run.jar

 
Original tracking code:  CO-2844 ['GB-797']
    

Fix email marked as read when applying label in message visualization mode (CO-2849)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes regression where emails were temporarily marked as read when applying a label in message visualization mode. The read/unread state now persists correctly without requiring a folder refresh.


Technical details: Issue affects frontend visualization only. Regression introduced in version 25.9 (worked correctly in 25.6). Occurs when Visualization by Message mode is enabled and labels are applied to unread emails.

 
Original tracking code:  CO-2849 ['—']
    

Fix inline image deletion/paste showing old images in composer (CO-2870)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes an issue where deleting an inline image in the email composer and adding a new image would display the old image instead of the new one. This ensures users can properly replace inline images without stale content persisting.


Technical details: Fetch freshly uploaded file via downloadServiceUrl and create ObjectURL as img src to avoid collisions with previous attachments. Improved cleanup function for removed attachments triggered before savedraft.

 
Original tracking code:  CO-2870 ['CO-2297']
    

Fix task creation in Tasks Tab (CO-2872)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue preventing users from creating tasks in the Tasks Tab. Users can now successfully create new tasks without encountering errors.


 
Original tracking code:  CO-2872 ['GB-797']
    

Fix UI list of contacts and distribution lists (CO-2889)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes broken UI list display for contacts and distribution lists, restoring proper functionality for managing contact and distribution list views.


 
Original tracking code:  CO-2889 ['CO-2114']
    

Fix successful authentication logged as ERROR in audit.log (CO-2900)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes successful authentication events being incorrectly logged with ERROR severity instead of INFO in audit.log. This resolves false failure detection in automated test pipelines and prevents administrators from misinterpreting normal login activity as security incidents.


Technical details: Log file: /opt/zextras/log/audit.log. Affected module: ZxAuth. Endpoint: /zx/auth/v2/login. Environment: Carbonio 25.12 on RHEL 8.10. Successful authentication entries were logged with ERROR severity instead of INFO/DEBUG.

 
Original tracking code:  CO-2900 ['GB-851', 'GB-798']
    

Fix Login UI mocks intercepting plain HTTP calls (CO-2901)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where the Login UI built with MSW mocks was intercepting plain HTTP calls and returning mocked/stubbed data instead of actual responses. This ensures proper HTTP communication during login operations.


Technical details: Login UI built with MSW (Mock Service Worker) was intercepting plain http calls. Issue affected HTTP request handling in the login interface.

 
Original tracking code:  CO-2901 ['GB-852', 'GB-798']
    

Fix S3 connection URL not properly stored in PostgreSQL (CO-2909)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where S3 connection URLs were not being properly stored in the PostgreSQL database for carbonio-storages. This ensures storage configuration is correctly persisted.


Technical details: Component: carbonio-storages

 
Original tracking code:  CO-2909 ['—']
    


|


Improvements (38)
-----------------

This section covers technical improvements that enhance the performance, stability, and maintainability of the system. These improvements may include backend optimizations, code refactoring, and infrastructure upgrades. While these changes may not be directly visible to end users, they contribute to a better overall experience by improving system reliability and efficiency.



Refactor Calendars sidebar (CO-1586)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Rewrites the sidebar component to be specific to the Calendar module, eliminating dependency on the common component from the Commons submodule. This improves maintainability and allows for module-specific features without unnecessary shared component constraints.


 
Original tracking code:  CO-1586 ['—']
    

Eliminate redundant read marking via MsgAction and ConvAction requests (CO-2101)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Reduces redundant API calls when opening unread mail messages or conversations by consolidating mark-as-read operations into single GetMsgRequest and SearchConvRequest calls. This improves server load, network latency, and UI response times.


Technical details: Introduced useMarkAsReadOnClick hook to centralize mark-as-read logic. Respects zimbraPrefMarkMsgRead setting across all modes. Reduces API calls by up to 50% when opening unread items.

 
Original tracking code:  CO-2101 ['—']
    

Unify error reporting component in calendar editor (CO-2214)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Consolidates error reporting in the calendar editor by merging separate error components into a single unified approach. Improves user experience by displaying all validation errors and availability warnings in one consistent location.


 
Original tracking code:  CO-2214 ['CO-2199']
    

Replace shell-ui with admin-ui in carbonio-console-ui (CO-2248)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes misleading package.json dependency declaration in carbonio-console-ui. The component actually uses carbonio-admin-ui at runtime, not carbonio-shell-ui, which is now corrected to reflect actual dependencies.


 
Original tracking code:  CO-2248 ['CO-2249', 'CO-2538']
    

Upgrade SDK projects to Java 17 (CO-2394)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Migrates SDK projects from Java 11 to Java 17 and updates all dependent projects (Mailbox, Files, Advanced, etc) to use the latest SDK library versions.


 
Original tracking code:  CO-2394 ['—']
    

Full migration from Styled-Components to Emotion across UI modules (CO-2457)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Completed the full deprecation and removal of the styled-components library across the entire Carbonio UI ecosystem, replacing it with Emotion. The migration improves long-term maintainability, reduces bundle size, enhances build performance, and aligns all UI modules with a modern and actively maintained CSS-in-JS solution. All residual support for styled-components has been removed.


 
Original tracking code:  CO-2457 ['CO-2132', 'CO-2128', 'CO-2127', 'CO-2341', 'CO-2136', 'CO-2348', 'CO-2347', 'CO-2346', 'PREV-158', 'CO-2357', 'CO-2355', 'CO-2364', 'CO-2359', 'CO-2353', 'TEAMS-4176', 'CO-2376', 'CO-2374', 'FILES-969', 'EI-8', 'CO-2543']
    

Remove duplicate token validation checks (CO-2464)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Eliminates unnecessary double authentication token validation in UserManagement calls. Services were validating tokens twice - once explicitly via validateUserToken and again within getUserInfo - causing redundant round trips.


Technical details: Issue identified in CookieAuthenticationFilter.java in carbonio-docs-connector.

 
Original tracking code:  CO-2464 ['—']
    

Optimize AuthenticationDBCleaner cron job to prevent PostgreSQL performance degradation (CO-2473)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves severe PostgreSQL performance degradation caused by AuthenticationDBCleaner cron job running simultaneously across all mailbox servers in multi-mailbox infrastructure. The cleanup process was consuming excessive database resources, causing all queries to slow down to 20+ seconds and creating 500MB WAL files that locked WAL synchronization to secondary PostgreSQL replicas.


Technical details: AuthenticationDBCleaner runs at 00:27 and 12:17 UTC on all mailbox servers simultaneously. Issue manifests in environments with 50k+ users and extensive 2FA/token usage.

 
Original tracking code:  CO-2473 ['CO-2657']
    

Standardize Hikari connection pool configuration across Carbonio components (CO-2474)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Addresses inconsistent Hikari database connection pool configurations across Carbonio components that could cause thread deadlocks and service failures during database connection loss or high-load scenarios. Standardizes connection pool parameters to prevent stalled threads and JVM lockups.


Technical details: Hikari configuration parameters: MaxLifetime (600000ms), LeakDetectionThreshold (5000ms), IdleTimeout (10000ms). Affected components: carbonio-files, carbonio-task, carbonio-license-sdk, carbonio-push-connector, carbonio-docs-connector, carbonio-notification-push, carbonio-advanced-lib, carbonio-ws-collaboration. Note: Hikari lacks auto-reconnect after failure and relies on OS socket cleanup. Configuration can be managed via Consul k/v store for infrastructure-specific tuning.

 
Original tracking code:  CO-2474 ['CO-2657', 'CO-2381']
    

Fix click event propagation in message preview actions (CO-2495)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes click event propagation in mail message preview actions to prevent unintended behavior when users interact with action buttons. Users can now reliably click Reply, Forward, and other actions without triggering unintended preview toggling.


 
Original tracking code:  CO-2495 ['—']
    

Prevent DDoS attack when admin-ui-bootstrapper API calls fail (CO-2497)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a vulnerability where failed SOAP calls in admin-ui-bootstrapper would continuously retry the API, potentially causing an in-house denial of service attack. Implements proper error handling to prevent repeated API calls on failure.


 
Original tracking code:  CO-2497 ['—']
    

Use carbonio-ui-text-composer instead of shell integration (CO-2506)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Replaces shell integration with carbonio-ui-text-composer for mail composition, improving integration and maintainability of the composer component.


 
Original tracking code:  CO-2506 ['CO-2297', 'CO-2612']
    

Fix Carbonio catalog sidecar proxy systemd unit dependencies (CO-2511)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Corrects the systemd unit configuration for Carbonio Catalog sidecar proxy. The PartOf directive now includes all required targets (carbonio-appserver, carbonio-directory-server, carbonio-mta, and carbonio-proxy) instead of only carbonio-mta.target, ensuring proper service dependency management for user and admin login functionality.


Technical details: Updated systemd unit file: Changed PartOf from carbonio-mta.target to PartOf=carbonio-appserver.target carbonio-directory-server.target carbonio-mta.target carbonio-proxy.target. Component: Carbonio Catalog sidecar proxy.

 
Original tracking code:  CO-2511 ['IN-881', 'CO-2778']
    

Upgrade envoyproxy, service-discover-template and Consul to latest LTS minor (CO-2525)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Updates envoyproxy, service-discover-template and Consul to their latest LTS minor versions to ensure system stability and security with current dependencies.


Technical details: Update envoy to 1.32.x . Update Consul to 1.21.4.

 
Original tracking code:  CO-2525 ['CO-2519', 'GB-860']
    

Replace :first-child with :first-of-type for server-side rendering safety (CO-2532)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Addresses potential unsafe behavior of the :first-child pseudo-class during server-side rendering. Replaces :first-child with :first-of-type to ensure safer CSS selector behavior across Carbonio components.


 
Original tracking code:  CO-2532 ['—']
    

Link exported types to implementations in admin-ui-bootstrapper (CO-2539)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves type safety in the Admin Panel by linking type definitions to their corresponding function implementations in the bootstrapper, reducing type mismatches and increasing code reliability.


 
Original tracking code:  CO-2539 ['—']
    

Remove carbonio-admin-ui repository (CO-2542)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes the separate carbonio-admin-ui repository as it has been consolidated into admin-monorepo. This eliminates confusion from maintaining duplicate repositories and removes the package from npm.


Technical details: Consolidated into: admin-monorepo

 
Original tracking code:  CO-2542 ['—']
    

Use local storage entry to conditionally enable StrictMode in development (CO-2544)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes StrictMode as default behavior in development environment. Administrators can enable it conditionally using the enable_strict_mode localStorage key set to true.


Technical details: localStorage key: enable_strict_mode (set to true to enable). Applies when process.env.NODE_ENV is 'development'.

 
Original tracking code:  CO-2544 ['—']
    

Use encrypted properties file for advanced_count storage (CO-2554)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves reliability of usage information storage by migrating from custom file format to encrypted properties file format. Adds error logging for write/read operations on the advanced_count file.


Technical details: File: /opt/zextras/data/tmp/advanced_count. Migrates from custom format to encrypted properties file with error logging for write/read operations.

 
Original tracking code:  CO-2554 ['CF-1475']
    

Use carbonio-ui-text-composer instead of shell integration in Calendars (CO-2563)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Replaces shell composer integration with carbonio-ui-text-composer component in Calendars, improving text composition handling and consistency across the application.


 
Original tracking code:  CO-2563 ['CO-2612']
    

Rewrite LdapClient to eliminate singleton allocation (CO-2581)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Refactored LdapClient to remove singleton allocation patterns.


 
Original tracking code:  CO-2581 ['CO-2609']
    

Isolate COS module from Admin Panel (CO-2596)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Isolates the COS module from the Admin Panel to improve application structure and enable future refactoring of admin modules.


 
Original tracking code:  CO-2596 ['—']
    

Rewire startup/shutdown of mailbox code (CO-2609)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Decouples mailbox startup/shutdown from servlet initialization by moving Zimbra startup/shutdown to the main process startup. This enables controlled dependency management in tests and eliminates tight coupling between SoapServlet and environment setup.


Technical details: Moved startup and shutdown from SoapServlet init/destroy to main() process startup. Initialization sequence changed from: main() → Jetty#start → FirstServlet init (socket) → SoapServlet init → startup, to: main() → init sockets → startup → Jetty#start. Verification logs: Starting mailbox server, Mailbox server started, Shutting down mailbox server, Mailbox server shut down.

 
Original tracking code:  CO-2609 ['CO-2581']
    

Allow Chats service to run with different public key for license based on environment (CO-2633)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves license request failures (500 Internal Server Error) on the Chats service endpoint. Enables proper license validation across test and production environments by supporting environment-specific public keys.


Technical details: License endpoint: /services/chats/license. Issue affects license validation even when license is properly installed with valid dates and renewal status.

 
Original tracking code:  CO-2633 ['GB-797']
    

Move zm-native to standalone GitHub repository (CO-2640)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Extracted zm-native module from the mailbox Maven multi-module project into a standalone GitHub repository. This library compiles Java classes and C .so files for low-level IO tasks and can now be maintained independently.


Technical details: zm-native produces the mailbox-native package. Verify new jar location at /opt/zextras/mailbox/jars/mailbox-native.jar

 
Original tracking code:  CO-2640 ['—']
    

Improve WSC versioning (CO-2660)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves REST versioning to use the minimum version when versioning header is missing. Enhances WebSocket versioning with better error handling for failed version negotiation scenarios.


 
Original tracking code:  CO-2660 ['—']
    

Improve video streams quality on Chats meetings (CO-2663)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables administrators to tune video stream quality (webcam and screen-share) for Chats meetings through configurable parameters. Admins can now adjust bitrate settings globally based on infrastructure and client requirements.


Technical details: New consul k/v store configurations added: bitrate and bitrate-cap parameters in the meeting folder of carbonio-ws-collaboration. Administrators can set these values to control video quality at the global level.

 
Original tracking code:  CO-2663 ['—']
    

Create single artifact for Admin Panel (CO-2687)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Consolidates Admin Panel into a single artifact to streamline the installation pipeline and reduce setup complexity. This addresses disruption caused by the microfrontend architecture shift and improves deployment consistency for QA and installation teams.


 
Original tracking code:  CO-2687 ['ZCT-1488']
    

ActiveSyncDbUpdaterService creates index asynchronously (CO-2694)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Improves database initialization by creating indexes asynchronously during install or upgrade when table data is minimal. This ensures only one server creates indexes at a time, preventing conflicts and improving startup performance.


Technical details: ActiveSyncDbUpdaterService defines async index creation. Indexes are created on startup if tables contain less data. Single-server index creation enforcement prevents concurrent operations.

 
Original tracking code:  CO-2694 ['CO-2309', 'CO-2315']
    

Migrate javax.rs to jakarta.rs (CO-2696)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves IncompatibleClassChangeError caused by javax.ws.rs to jakarta.ws.rs migration. Ensures compatibility with modern Java versions and CXF implementations.


Technical details: Migrates from javax.ws.rs.core.Link$Builder to jakarta.ws.rs.core.Link$Builder. Resolves ClassLoader conflict in org.apache.cxf.jaxrs.impl.LinkBuilderImpl.

 
Original tracking code:  CO-2696 ['—']
    

Remove deprecated Postfix attributes and update configuration (CO-2713)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves Postfix deprecation warnings by updating configuration parameters to their modern equivalents. Removes deprecated attributes (smtpd_tls_eecdh_grade, smtpd_use_tls, disable_dns_lookups) that will be removed in future Postfix versions, ensuring compatibility with Postfix 3.10.3 and later.


Technical details: Deprecated parameters to replace: smtpd_tls_eecdh_grade (use default instead), smtpd_use_tls (use smtpd_tls_security_level), disable_dns_lookups (use smtp_dns_support_level). Configuration files: /opt/zextras/common/conf/main.cf, /opt/zextras/common/conf/master.cf. Postfix version: 3.10.3. Reference: https://www.postfix.org/DEPRECATION_README.html

 
Original tracking code:  CO-2713 ['GB-796', 'CF-1510']
    

Reduce resource consumption for argon2 password encryption (CO-2718)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Optimizes default argon2 parameters on the directory server to reduce resource consumption during password encryption. Default settings are automatically updated during upgrade.


Technical details: File: /opt/zextras/data/ldap/config/cn=config/cn=module{0}.ldif. Updated parameter: olcModuleLoad: {8}argon2 m=16384 t=2. Applied automatically by carbonio-directory-server package during migration.

 
Original tracking code:  CO-2718 ['ZCT-1406']
    

Refactor attachment normalization and computation (CO-2727)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Centralizes attachment and inline attachment handling logic in message normalization and preview to eliminate duplication and improve consistency. Reduces error-prone code by consolidating multiple implementations into standardized utilities.


Technical details: Introduced centralized Content-ID utility functions: areContentIdsEqual, extractContentIdsFromHtml, removeAngleBrackets. Refactored getAttachmentExtension to accept contentType and filename parameters with comprehensive MIME type mappings. Enhanced HTML entity decoding in CID extraction to handle encoded characters like &#64; for @. Fixes inconsistent CID extraction, HTML entity encoding bugs (@, ', &), and varying inline/attachment behavior.

 
Original tracking code:  CO-2727 ['—']
    

Prioritize pending-setups scripts to resolve dependency ordering (CO-2745)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes installation failures on single-server deployments where pending-setups scripts execute in incorrect order, causing database bootstrap tasks to fail due to missing dependencies. Ensures database initialization completes before dependent components are configured.


 
Original tracking code:  CO-2745 ['ZCT-1266', 'ZCT-1268', 'ZCT-1279', 'ZCT-1264', 'ZCT-1114']
    

Consolidate admin panel translation repositories into single project (CO-2754)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Merges two separate translation repositories (carbonio-admin-manage-ui and carbonio-admin-ui) into a single Weblate project. Simplifies translation management and installs translations under /opt/zextras/admin/iris.


Technical details: Merged carbonio-admin-ui-i18n repository with consolidated keys from both previous components. Removed admin-manage-ui from Weblate and archived on GitHub. Cleaned up leftover references in carbonio-webui-i18n package.

 
Original tracking code:  CO-2754 ['CO-2744']
    

Update RenewLicenseJob schedule to random start time within 03:00-03:59 AM (CO-2768)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Distributes the workload and reduces peak load by randomizing the RenewLicenseJob execution time within the 3 AM hour instead of running at a fixed 03:45 AM. This improves system performance during license renewal


 
Original tracking code:  CO-2768 ['CO-2831']
    

Update MariaDB to 10.11.15 (CO-2822)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Updates MariaDB database to version 10.11.15, ensuring access to latest security patches, performance improvements, and bug fixes.


 
Original tracking code:  CO-2822 ['—']
    

Fix composer editing area auto-expansion in rich text and plain text modes (CO-2842)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves an issue where the composer editing area was not expanding properly to accommodate content in both rich text and plain text edit modes. The editor now dynamically grows with parent component to utilize available vertical space.


Technical details: Changed container height from height={'fit'} (CSS height: fit-content) to height={'100%'} in EditView (edit-view.tsx) and PlainTextEditorContainer (plain-text-editor-container.tsx). Removed outline on focus for PlainTextEditorContainer for UI alignment. Added test coverage in edit-view.test.tsx and plain-text-editor-container.test.tsx to verify containers render with height: 100% and respect user font settings.

 
Original tracking code:  CO-2842 ['—']
    


|


Third-parties update, CVE and Security fixes (11)
-------------------------------------------------

This section includes updates to third-party libraries, CVE patches, and other security-related fixes. These updates are crucial for maintaining the security and integrity of the system, protecting against vulnerabilities, and ensuring compliance with security standards. Security fixes may not be directly visible to end users but are essential for safeguarding data and system operations.



Fix IDOR/BAC vulnerability allowing unauthorized TOTP list access (CO-2303)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a broken access control vulnerability that allowed delegated administrators with User Management rights to view TOTP information for users outside their delegated domain. Now only administrators can access TOTP lists for users within their authorized domains.


Technical details: Vulnerability in POST /service/admin/soap/zextras method. Affected endpoint: list_totp_command action in ZxAuth module. Issue: UserManagementAdmin role could access TOTP data across domain boundaries. Fix: Restrict TOTP list access to UserManagementAdmin and higher-level admin groups for users in delegated domains only.

 
Original tracking code:  CO-2303 ['ZCT-1125', 'CO-1089']
    

Upgrade dependencies with critical CVE in Mails and Contacts UI (CO-2328)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves critical and high-severity security vulnerabilities in carbonio-mails-ui and carbonio-contacts-ui dependencies. Upgrades packages including form-data, axios, tar-fs, and others to patch SSRF, credential leakage, and arbitrary code execution risks.


Technical details: Updated packages: tar-fs (2.1.2 to 2.1.3), @babel/runtime (7.26.7 to 7.28.3), axios (1.7.9 to 1.11.0), form-data (4.0.1 to 4.0.4), brace-expansion (1.1.11 to 1.1.12). Vulnerabilities fixed: GHSA-fjxv-7rqg-78g4 (form-data critical), GHSA-jr5f-v2jv-69x6 (axios high), GHSA-8cj5-5rvv-wf4v (tar-fs high), GHSA-968p-4wvh-cqc8 (Babel moderate), GHSA-v6h2-p8h4-qcjw (brace-expansion). Remaining: TinyMCE XSS vulnerability (GHSA-5359-pvf2-pw78) requires update in carbonio-shell-ui. CVE-2022-26305,CVE-2021-32810, CVE-2022-24765, CVE-2023-34533

 
Original tracking code:  CO-2328 ['CO-2490', 'CO-2491']
    

Upgrade dependencies with critical CVE (CO-2334)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves critical CVE vulnerabilities in ZAL dependencies, primarily from the Jackson library. Dependencies are upgraded and aligned with versions used in Mailbox to address security risks.


Technical details: Jackson upgraded to 2.15.4, AWS SDK upgraded to 1.12.777. CVE-2022-41853,CVE-2018-7489,CVE-2019-12814,CVE-2018-14721,CVE-2019-14439,CVE-2020-8840,CVE-2018-19362,CVE-2020-36188,CVE-2020-36181,CVE-2018-12023,CVE-2018-14719,CVE-2018-12022

 
Original tracking code:  CO-2334 ['—']
    

Upgrade dependencies with critical CVE (CO-2335)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves critical security vulnerabilities in service-discover by upgrading dependencies. Improves system security posture by addressing known CVEs.


Technical details: Component: service-discover. CVE-2024-45337, CVE-2024-41110, CVE-2025-22869, CVE-2025-8556, CVE-2024-40635, CVE-2025-54410

 
Original tracking code:  CO-2335 ['CO-2480']
    

Upgrade dependencies with critical CVE (CO-2336)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Resolves critical and high-level CVE vulnerabilities in carbonio-storages-ce dependencies. Upgrades affected packages to eliminate security risks and improve overall project security posture.


Technical details: Project: carbonio-storages-ce. CVE-2025-7783, CVE-2025-24033, CVE-2024-21538, CVE-2025-5889

 
Original tracking code:  CO-2336 ['—']
    

Upgrade push notification dependencies to resolve critical CVE vulnerabilities (CO-2395)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Upgrades dependencies in carbonio-notification-push and carbonio-push-connector to remove critical security vulnerabilities. This ensures the push notification system is protected against known CVE exploits.


Technical details: Components updated: carbonio-notification-push, carbonio-push-connector. CVE-2024-1597, CVE-2024-8184

 
Original tracking code:  CO-2395 ['WSC-2106']
    

Review security issues and dependencies of mailbox (CO-2553)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Addresses security vulnerabilities in mailbox dependencies by updating critical libraries to their latest versions, improving overall security posture.


Technical details: Updated dependencies: jackson, jersey, unboundid (LDAP client), commons-fileupload.

 
Original tracking code:  CO-2553 ['—']
    

Add rate-limit to create guest API to prevent DoS attacks (CO-2678)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Implements rate-limiting on the create guest API to prevent potential abuse and DoS attacks from external users. The API now rejects requests with 429 status code after 250 calls within a time window, protecting the system from excessive guest account creation attempts.


Technical details: API endpoint: POST /guests with rate-limit enforcement on Chats backend instead of mailbox side. Rate-limit triggers 429 status after 250 calls; resets after 1 minute. Frontend now calls Chats API instead of advanced API for guest account creation.

 
Original tracking code:  CO-2678 ['—']
    

Prevent guest accounts from uploading files and creating tasks (CO-2705)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a security issue where guest accounts used for meeting participation in Chats could upload files and create tasks despite not being logged-in users. Guest accounts now properly restricted from accessing Files and Tasks services.


Technical details: Check user type (Internal or Guest) on auth call in Files and Tasks backend. User Management already returns account type information which is now used for filtering requests from guest accounts.

 
Original tracking code:  CO-2705 ['CO-2706']
    

Enforce feature access control on backend services (CO-2706)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a security issue where users with disabled features could still call backend services (Files, Tasks, Docs, Chats). Now feature flags are properly forwarded from Mailbox through User Management and validated by each service to reject unauthorized requests.


Technical details: Forward carbonio* attributes (e.g., carbonioWscFeatureEnabled) from Mailbox in UserMyself object. Auth handlers on Files, Tasks, Wsc, Docs backends check related attributes and reject requests when features are disabled. Exception: guest accounts in Chats have wscFeatureEnabled set to false and are allowed.

 
Original tracking code:  CO-2706 ['CO-2705']
    

Fix SAML authentication cookie expiration set to 10 days (CO-2804)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes a security vulnerability where SAML authentication creates persistent cookies with 10-day expiration instead of session-only cookies. This allows users to remain logged in after closing the browser, creating security risks in shared workstations or unlocked terminals.


Technical details: Modified ServletUtils.java to set cookie as session-only. Cookie properties: HttpOnly, Secure, Path=/

 
Original tracking code:  CO-2804 ['—']
    


|


Translation Updates (1)
-----------------------

This section includes updates to translations and localization efforts. These updates ensure that the software is accessible to users in different languages and regions, enhancing usability and user satisfaction across diverse user bases.



Fix missing translations in Admin Panel (CO-2523)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fixes missing translations for Create button, Logout, and Help & Documentation in the Admin Panel. Ensures UI consistency in English and Italian, with translations managed by the development team.


 
Original tracking code:  CO-2523 ['GB-836']
    


|



