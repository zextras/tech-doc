
Release 25.6.0
=================

Release Date: June 17th, 2025

New Features List
-----------------

CDS-319: Align form section component
   The FormSection component is now aligned with the UI-kit/Figma design, with improved layout and styling.


CO-1287: Enhanced appointment visuals and Free/Busy
   Improved visibility of reply icons and status borders on appointment cards. Event summaries now show organizer and status details. The Free/Busy selector in the editor aligns with the selected calendar color and updates dynamically when calendar or color changes.


CO-1291: Multi-day events visual improvement
   Multi-day events now fill the entire date range in the calendar, preventing other appointments from being inserted during that time.


CO-1458: Multi-word token search enhancement
   The search function now allows users to specify multi-word tokens in the search bar, filtering results to show only emails that contain the exact phrase or multi-word token input in the search bar.


CO-1465: show placeholder when to field is empty
   When an email is sent without any recipient in the 'To' field, a placeholder label is now shown in the message list and message display view to indicate that the field is intentionally empty, instead of leaving it blank.


CO-1493: Carbonio Admin Panel Enhanced with Validated Phone Field in Account Profiles
   The Carbonio Admin panel has been updated to include a phone number field in account profiles. This field now supports input validation, allowing only valid characters to ensure data consistency and accuracy.


CO-1568: Update contact folder item count dynamically
   The item count in Contact folders is now dynamically updated as users load more contacts by scrolling.


CO-1767: removal of web.xml
   Web.xml not found in directory /opt, no impact found, services running smoothly


CO-1776: Polling interval value support improved
   The mail settings page now correctly handles and displays custom values for the polling interval, this preventing empty selections in the dropdown. when the value is not included in the predefined list.


CO-1833: Improved contact ui alignments and issues
   The Contacts module now has improved UI alignments and functionality, including correct display of contact and contact group details, tooltips, and scrollable content.


CO-1834: Align Contacts and Contact groups actions
   The quick actions for contacts and contact groups have been aligned, with a consistent order and disabled actions when there are no email addresses or insufficient rights.


CO-1835: Enhanced contact group management
   Contact Groups now support multi-select, trash, move, and restore functionality, with improved permission checks for shared folders.


CO-1837: Highlight selected address book
   The selected address book is now properly highlighted when viewing it, providing a clearer and more intuitive user experience.


CO-1920: Fix handling of partial data in notify
   The software now correctly handles partial data in notify modified messages and conversations by preserving existing values when specific data is not received in the notification.


CO-1942: OWASP library updated
   The OWASP library is now updated to version 20240325.1, fixing issues with rendering certain emails and improving security.


CO-1945: Improve auto-provisioning with timestamp-based polling
   Auto-provisioning now uses createTimestamp + 1s for LDAP searches, with optional support for modifyTimestamp and improved tracking of last LDAP poll.


CO-1949: "Send" Button Removed from Drop Folder Context Menu
   In the latest Carbonio Webmail update, the "Send" button has been removed from the contextual menu of email items in the drop folder. The send action is no longer available directly from the action button. Users must now first edit the message before it can be sent. This change improves message review and reduces the chance of accidental sending.


CO-1955: Remove default importance on reply email
   When replying, replying all, or forwarding an important email, the response is no longer marked as important by default.


CO-1973: Status Tooltips added to Appointment Cards
   The Calendar, improved with hovering the mouse over the left side border of an appointment card, you can now see tooltips indicating the status — Free, Busy, Tentative, or Out of Office


CO-1997: Update icons for calendar appointment replies
   New icons are now used for calendar appointment replies to avoid reusing icons that are already present elsewhere in the module, following the updated figma design.


CO-2000: New attributes introduces
   Introduced new user preference attributes in Carbonio, enabling settings like carbonioPrefDarkMode to be stored persistently. The carbonioPrefDarkMode attribute now supports a default value of "auto", allowing the interface to adapt to system theme settings automatically.


CO-2003: Enable S/MIME UI Setting Based on Global enableSmimeEncryption Attribute
   The S/MIME user interface setting is now conditionally available based on the global enableSmimeEncryption attribute. Carbonio administrators can centrally enable or disable S/MIME functionality across all users by configuring this global attribute, providing improved control over encryption features in the environment.


CO-2004: Tags Now Available in Mail and Contacts
   The tags are now available in mail as well as in contacts, making it more useful to search items by tags in the advanced filter

*****

Bugfix List
-----------

**CDS-327: Captions rendering issue in safari fixed**
   ChipInput captions are now rendered correctly in Safari browser, solving the issue where capital letters appeared trimmed or cut off visually.


**CO-1215:  keywords label pluralised in contacts filter**
   The label in the advanced filters of the Contacts search tab now uses the plural form “Keywords” to match the naming convention used elsewhere in the interface, ensuring consistency across modules.


**CO-1217: Renamed "Reset" Button to "Reset Filters" and Updated "Advanced Filter" Label for Clarity**
   The "Reset" button in Carbonio Contact has been renamed to "Reset Filters" to clearly indicate its functionality.


**CO-1221: Improved Search Functionality in Webmail**
   Enhanced the search module in  Webmail to allow repeated searches with the same query string. The search button now remains enabled after the initial search, enabling users to re-execute the same search to retrieve newly arrived emails without needing to modify the search term.


**CO-1230: User can remove date from advanced filters**
   Users can now successfully remove dates from the "Sent Before", "Sent After", and "Sent On" fields in the advanced filters section, improving the overall search experience.


**CO-1256: Fix drag and drop timezone issue**
   The drag and drop functionality for appointments with different timezones now correctly updates the dates.


**CO-1377: Attachment preview fixed in new tab**
   Users can now correctly preview attachments, including PDFs and nested EMLs, even when the email is opened in a new browser tab using the "open in new tab" feature.


**CO-1454: Improve performance for large emails**
   Carbonio Webmail now handles large emails with multiple conversations and embedded images more efficiently, reducing lag and improving responsiveness.


**CO-1487: Recovery process feedback improved**
   When the user initiates message recovery from backup, the UI now clearly indicates that the process has started, preventing multiple unintended restore attempts.


**CO-1505: Check availability for all-day events fixed**
   The availability check dropdown now correctly displays user availability for all-day appointments sent via distribution lists, resolving the issue where options appeared greyed out and unresponsive.


**CO-1544: Prevent uninitialized domains from delegation list**
   Domains that have not been initialized for delegated administration no longer appear in the domain selection list when assigning delegated admin rights to an account. The system now avoids promoting accounts to delegated admin if no valid rights are selected, and uninitialized domains are filtered out to prevent misconfiguration.


**CO-1572:  Fix polish translation for attachment**
   The "Attachment" filter option in Mails advanced search is now correctly translated into Polish.


**CO-1573: Fix translation for empty trash**
   The "Empty Trash" modal title now correctly uses the translation system for system folders, ensuring accurate translations for languages like Polish.


**CO-1594: Standardise email display in calendar**
   The Calendar app now displays the email address consistently with other applications, improving overall consistency.


**CO-1630: Domain quota threshold validation enhanced**
   The Domain Quota threshold setting now only allows numeric values (including decimals) and displays an error message for invalid input.


**CO-1754: Improved folder creation performance**
   Creating a new folder via the web UI in mailboxes with thousands of folders no longer causes the interface to freeze or become unresponsive; performance remains stable and input lag is eliminated.


**CO-1790:  Fix today highlighting in month view**
   The current date is now correctly highlighted in the month view, instead of highlighting the entire column.


**CO-1796: Shared folder unread counter updates in real-time**
   The unread message counter in shared folders now updates in real-time when messages are marked as read/unread or moved into the folder, eliminating the need for a manual refresh.


**CO-1800: Mail module supports opening emails in multiple tabs**
   Improved the mail module to allow users to open the same email in multiple browser tabs without errors. This update provides a smoother and more flexible experience when managing emails.


**CO-1815: Fix handling of outlook message headers**
   The mail module now correctly handles quoted messages with custom OutlookMessageHeader divs, allowing users to read email content.


**CO-1819: Improved image copy paste issue**
   Images copied from clipboard or inserted into emails in Carbonio Webmail are now correctly displayed in Gmail.


**CO-1831: Fix editor sticky toolbar**
   The editor toolbar now remains fixed at the top of the window when scrolling, resolving the issue where it would become misaligned when moving the editor board.


**CO-1841: Action buttons properly displayed with long sender names**
   Fixed an issue where long sender names, especially when using "on behalf of", caused action buttons like Reply, Forward, and Delete to disappear or misalign. The layout now correctly adjusts to long sender details, ensuring all action buttons remain visible and accessible.


**CO-1846: Enhanced concurrent public file downloads**
   The Carbonio File module now handles multiple simultaneous downloads of publicly shared files without service interruptions.


**CO-1847: Fix ssl certificate upload corruption**
   The SSL certificate upload process now correctly merges certificate files with a new line, ensuring valid certificates.


**CO-1848: Fix imap sql overload issue**
   The IMAP client implementation now efficiently handles UID range searches, preventing excessive SQL queries and potential mailstore unavailability.


**CO-1850: Improved account status display issue**
   The account is now correctly displayed for the current account in CarbonioAdmin, resolving the issue of displaying the previous account's status.


**CO-1860: Improved rabbitmq connection handling**
   mailbox now maintains a single RabbitMQ connection per service instead of opening a new connection for each user, improving memory and connection efficiency.


**CO-1862: Send delay feature enhanced**
   The Set send time option in email settings is now correctly set for new accounts, implementing a default 3-second delay before sending emails.


**CO-1868: HA data cleanup on AppServer deletion**
   A scheduled task has been implemented to remove orphaned replica relationships from the High Availability (HA) database upon the deletion of an AppServer from the infrastructure.


**CO-1876: Enhanced tag click behavior in calendar**
   Clicking on tags in the calendar now correctly performs a calendar search instead of a mail search.


**CO-1879: Fix domain list error on suspension**
   The AdminUI domain list now correctly displays domains after changing their status to suspended, resolving the error that previously occurred.


**CO-1881: Fixed contact checkbox click area**
   The contact checkbox is now fully clickable, resolving the issue where only half of the checkbox was active.


**CO-1883: fixed reversed admin panel strings**
   The delegate configuration windows in the Admin Panel now display the correct strings for "Switch to Simplified View" and "Switch to Advanced View".


**CO-1895: Move to folder modal rendering optimised**
   Rendering performance of the “move to folder” modal has been improved, especially for accounts with large folder trees and shared/delegated folders, significantly reducing load time and ensuring better responsiveness across browsers.


**CO-1899: Improved Account List Filters with Consistent Pagination**
   Account list filtering has been enhanced to maintain the applied filter across all pages. When navigating between pages, items now consistently reflect the filtered search criteria.


**CO-1901: Fixed out of office misspelling**
   The misspelling in the "out of office" settings has been corrected, changing "Invia ripose automatiche" to "Invia risposte automatiche".


**CO-1902: Italian Language Translation Fixed in Mail, Contacts, and Calendar Modules**
   The Italian language translations in Crabonio Webmail have been corrected and are now displaying properly across the Mail, Contacts, and Calendar modules. 


**CO-1903: Shard 'Inbox' Mount Point Now Successfully Created in Crabonio Webmail**
   The Carbonio mail module has improved now. The mount point for the 'Inbox' shard is now being created successfully


**CO-1910: Sender name capitalization fixed**
   The sender's name is now displayed consistently across the interface, with correct capitalization in both the left panel and right sidebar.


**CO-1912: Reply-to field correctly set and persisted**
    The reply-to email address can now be set based on the selected identity in the mail editor, is persisted across drafts, and is included in the sent mail headers. The "send" option in the drafts context menu has been removed to enforce proper email composition before sending.


**CO-1913: Fixed contact search result editing**
   Contacts found in search results can now be edited or deleted, providing a seamless user experience when managing contacts.


**CO-1914: Preserve send as account in reply**
   When replying to an email, the 'Send As' account is now correctly included in the 'CC' field, ensuring that all original recipients are preserved in the reply.


**CO-1916: Carbonio Webmail Tags Now Persist After Reply or Forward**
   The tag functionality in Carbonio Webmail has been improved. Tags assigned to mail items now remain intact even after replying to or forwarding a message. This ensures better organization and consistent tagging across all email actions.


**CO-1919: Backup restore request properly redirected**
   The doRestoreOnNewAccount request on admin UI is now correctly directed to the server where the account has its backup, preventing errors due to misdirected API calls.


**CO-1921: Enhanced Carbonio Attachment and File Module with Cyrillic and Non-Latin Filename Support**
   The Carbonio attachment and file modules have been enhanced to fully support Cyrillic and other non-Latin characters in filenames. Users can now attach files with non-Latin names, upload them to the file module, and pick or save them directly from the mail composer. File renaming within the mail writing board also preserves Cyrillic symbols accurately, ensuring seamless international character support across workflows.


**CO-1924: Consistent Date and Time Display for Appointments Across Views**
   Carbonio Calendar now ensures that appointments and their corresponding appointment cards display the same date and time, even around daylight saving time (DST) changes during summer/winter transitions. This update improves consistency and prevents confusion caused by DST offsets.


**CO-1925: Unwanted Orphan Bracket Resolved in Shared Inbox View of Carbonio Webmail**
   Resolved an interface issue in Carbonio Webmail where an extraneous closing bracket “)” was visible in the shared inbox folder view. The UI now renders cleanly without stray characters, improving visual consistency and user experience.


**CO-1926: Webmail UI Enhancement: Improved Visibility of Action Icons**
   In Webmail, the icons for Reply, Reply All, Forward, and Delete within individual emails have been improved in size and clarity. These enhancements make the icons easier to see and interact with, improving the overall user experience.


**CO-1932: Webmail mail module enhanced with attachment-based sorting**
   The Carbonio Webmail mail module has been enhanced to support sorting of email items based on attachment size. Users can now easily sort emails in both ascending and descending order according to the size of attachments, improving usability and helping manage storage more efficiently.


**CO-1933: Fix message list display issue**
   The message list now consistently displays the sender's name, ensuring uniformity across all folders.


**CO-1937: Fxed popup blocker issue in eml**
   Users now receive immediate feedback when opening nested .eml attachments in new tabs, resolving the popup blocker issue.


**CO-1938: improved performance when opening large conversations**
   Opening large conversations in a new tab no longer causes significant browser slowdown or crashes. The message list in the conversation is now loaded using only essential metadata (From, To, Subject, and body fragment) instead of downloading entire messages upfront, reducing memory usage and improving responsiveness.


**CO-1939: Mail Module handles Rapid Multi-Tab**
   The webmail mail module has been enhanced to support rapid, repeated openings of the same mail item in new browser tabs without errors. Previously, such actions could lead to null or blank content on the first tab, but the issue has now been resolved, ensuring a stable and consistent user experience across all tabs.


**CO-1940: Nested eml image rendering improved**
   When opening a nested EML file in a new tab using Firefox, the UI no longer renders oversized images that break the layout; instead, the content is now constrained within the correct boundaries for better usability.


**CO-1941: Fix recipient info in new tab**
   Recipient information is now correctly displayed when opening an email in a new tab using Firefox.


**CO-1943: Alphanumerical Sorting of Accounts in Carbonio Admin Restoration Menu**
   The Restoration menu in the Carbonio Admin Panel now displays the list of accounts sorted alphanumerically by email address. This improvement enhances usability by making it easier and faster to locate specific accounts during restoration processes.


**CO-1944: Handle non-existent accounts in powerstore**
   The Powerstore doVolumeToVolumeMove operation now skips non-existent accounts and logs the skipped accounts.


**CO-1954: localized date format in previews**
   Attachment previews now display dates in the user's locale format, using the lang_tag parameter to determine the correct format.


**CO-1965: Webmail editor enhanced with persistent gray background**
   The webmail editor has been improved to make it easier to write long emails. A consistent gray background is now shown across the whole writing area, helping keep the look uniform even during long compositions.


**CO-1969: Fix shared contact folder visibility**
   Contacts allows users to view shared contact folders. Shared users can now access and browse contact folders that have been shared with them, improving collaboration and contact management across teams.


**CO-1970: Remove zimbra wiki link from ssl notifications**
   SSL certificate expiration email notifications no longer include a link to the Zimbra Wiki.


**CO-1974:  Allow deletion of appointments without organizer**
   Appointments created without an organizer (e.g., via external clients like Thunderbird) can now be deleted directly from the Carbonio WebUI without raising errors related to missing attributes.


**CO-1975: Mail view reset after message deletion fixed**
   The mail view no longer resets after deleting a message from a shared mailbox folder.


**CO-1976: Moving event to shared calendar fixed**
    Editing a draft or saved event now allows moving it from the user's personal calendar to a shared delegate calendar, as long as the event does not have attendees and does not require a change of organiser.


**CO-1978: Webmail enhanced with improved mail view**
   The  Webmail interface has been upgraded for better email readability. Inline images are now displayed correctly within the message body, maintaining their intended order and context. This enhancement ensures a smoother and more accurate email viewing experience.


**CO-1979: Fix scroll to bottom issue on paste with Firefox**
   Pasting content or links into a message reply no longer scrolls to the bottom in Firefox.


**CO-1980: Fix imap synchronization issue**
   IMAP synchronization now correctly fetches emails without corruption, ensuring reliable email syncing for clients.


**CO-1981: Mailbox quota list view fixed**
   Admins can now successfully view the mailbox quota list after changing the number of items per page to 25, 50, or 100 in the Admin Console without any display issues.


**CO-1982: Request read receipt honoured by default**
   When the attribute `zimbraPrefMailRequestReadReceipts` is set to TRUE for a user, class of service, all newly composed messages now have the "Request Read Receipt" option automatically enabled in the Web UI, without requiring manual user action.


**CO-1985: Fix attachment loss on mail forward**
   Attachments are now preserved when forwarding emails, ensuring all files are included.


**CO-1986: Fix carriage return font in signature**
   Carriage returns in signatures now use the selected font, ensuring consistent formatting.


**CO-1992: Show details popup works in focus mode**
   The 'Show details' button now correctly opens the message details popup even when the EML is opened in a new tab using focus mode, resolving the modal context initialization issue.


**CO-1996: Fixed video call black screen issue**
   The video calls no longer turn black when clicking on new email browser notifications.


**CO-1998: "Search String" Reset Button Now Enabled in mail**
   The webmail search functionality has been improved. The "Reset" button for the search string is now dynamically enabled only when the search field contains input (i.e., is not empty). This enhances user experience by preventing unnecessary interactions and making the interface more intuitive.


**CO-2006: New "Clear All Search Results" Button Added to Carbonio Webmail**
   Carbonio Webmail has been enhanced with a new feature in the search module. A "Clear All Search Results" button is now available across all modules, allowing users to quickly clear search results from the screen, improving workflow efficiency and user experience.


**CO-2008: Fix calendar header misalignment issue**
   Calendar headings now correctly align with schedules, even with long daily appointment text.

*****

End of changelog
