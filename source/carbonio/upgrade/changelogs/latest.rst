
Release 25.6.0
=================

Release Date: June 17th, 2025

New Features List
-----------------

Bugfix List
-----------

WSC-1992: Fix pending setups for video services
   The pending setups for carbonio-videoserver and carbonio-videorecorder now run in the correct order, ensuring a successful installation.


WSC-1962: Polish translation for copy virtual room link
   The string "Copy Virtual Room's link" in the Chats module is now correctly translated into Polish when using the User UI.


WSC-1958:  Translation for virtual room field added
   The virtual room field in event creation now displays the correct translation.


WSC-1910: Fix Clearing Issue on Group Deletion
   Users can now expect their chat to be accurately updated when a group is deleted, with no lingering conversations or messages remaining due to database inconsistencies.


WSC-1901: Fix conversation loading issue
   After deleting conversations, the latest messages of the remaining conversations are now correctly loaded and displayed.


WSC-1883: Enhanced screen share autopin
   When a meeting participant starts sharing their screen, their screen is now automatically pinned for other participants, improving the meeting experience.


WSC-1882: Fix sender name in browser notification
   Browser notifications now display the sender's name correctly.


WSC-1874: Fixed last conversation message "Read by" dropdown
   The "Read by" dropdown in the last conversation message now functions correctly, remaining open after clicking on the "read" icon and displaying the list of people who have read the message.


WSC-1872: Remove async operations with CompletableFuture
   Meeting operations now use synchronous operations, improving stability and readability.


WSC-1840: Improve tile shimmering effect
   The tile shimmering effect, indicating video loading, is now properly hidden behind screen share tiles and its speed has been adjusted for a better user experience


WSC-1831: fix long room name display issue
   The starting meeting page now correctly wraps long room names while maintaining center alignment.


WSC-1204: None
   None


UM-41: None
   None


TSK-105: Tasks feature activation managed by new attribute
   The activation and deactivation of the Tasks module can now be controlled using the new `carbonioFeatureTasksEnabled` attribute, Admin UI toggle now updates the new attribute accordingly.


TEAMS-4174: None
   None


TEAMS-4173: Fix video recording layout issue
   The video recording feature now correctly positions video and screen streams in the final layout, resolving issues with half-videos.


SHELL-281: Fix board background shift in focus mode
   The dark background overlay now correctly covers the entire screen in focus mode.


SHELL-78: Enhanced shell top bar layout issues
   The top bar layout is now responsive and maintains its structure even on mobile screen sizes.


PREV-151: fix csp violations with css var
   The software now correctly handles CSS variables, resolving CSP violations and improving security.


PREV-149: Date Format fix in file module
   The Files module has been enhanced to support consistent date formatting in documents, CSV files, and XLS files when the interface language changes.


IN-875: log permission error on startup fixed
   The carbonio-message-dispatcher service no longer reports permission denied errors when attempting to access log files during startup, ensuring a clean and reliable initialization process.


IN-865: kyrgyz language added to admin ui
   The Kyrgyz language is now correctly displayed in the Admin UI, providing sysadmins with more comprehensive language support.


IN-863: fix ldap node support in script
   The script /opt/zextras/libexec/zmaltermimeconfig now supports multiple LDAP nodes via the ldap_master_url setting in localconfig.


IN-862: service-discover added  to zimbraservicesinstalled
   The service-discover service is now correctly added to the zimbraservicesinstalled LDAP attribute.


IN-855: CLI commands adapted to support systemd
   The CLI commands in the libexec folder have been adapted to support systemd units and targets.


IN-816: fix incorrect permissions on docs folder
   The zmfixperms script has been updated to exclude the /opt/zextras/docs directory from its recursive chown operations, preventing unintended permission changes that disrupt the carbonio-docs-editor functionality.


FILES-933: Reset button disabled when no filters
   The reset button in the advanced filters modal is now disabled when no filters are selected or applied, preventing users from triggering a no-op action.


FILES-931: None
   None


FILES-922: None
   None


FILES-919: None
   None


FILES-916: None
   None


FILES-912: None
   None


FILES-911: None
   None


FILES-910: Revoke public links on file delete
   Public links are now revoked when the associated file is deleted, ensuring that deleted files are no longer accessible.


FILES-907: None
   None


FILES-231: None
   None


DOCS-229: None
   None


DOCS-215: Support password-protected ods files
   The Carbonio File module now supports opening password-protected ODS (OpenDocument Spreadsheet) files, enhancing accessibility and workflow efficiency.


DOCS-188: None
   None


CO-2122: Fix delegate account issue in wizard
   None


CO-2090: Fix inline image preview issue
   The software now correctly previews inline images in the editor, resolving issues with multiple image uploads.


CO-2089: Fix infinite loop in admin ui
   The Admin UI no longer sends infinite NoOp requests, reducing CPU/RAM usage and preventing mailbox DDOS.


CO-2087: Fix content loss in large emails
   The software now fully loads email bodies larger than 250KB when editing, preventing content truncation.


CO-2085: Standardise email display in contacts
   The Contacts module now displays the Account Name instead of the email address, ensuring consistency with the Mail and Calendar modules. If the Account Name is not available, the email address is shown as a fallback, aligning the display logic across all modules.


CO-2084: Standardise display name in mail
   Display names are now consistently shown across Mail, Contacts, and Calendar modules, with email address used when display name is not set.


CO-2083: Fix browser context menu for links
   The browser context menu now works correctly for HTML links in message content.


CO-2082: Fix contacts folder panel error
   The Contacts module now correctly displays the folder panel without errors, resolving the "e is undefined" issue.


CO-2081: None
   None


CO-2080: Fix account data retention in edit mode
   Editing multiple accounts in User Management no longer retains previous account's data.


CO-2078: Make disclaimer comply with rfc 5322
   The disclaimer feature now ensures compliance with RFC 5322, preventing message corruption.


CO-2077: Fix create account page layout
   The Create Account page now displays all options without content cutoff, improving visibility and usability.


CO-2076: None
   None


CO-2075: Fix delegate acl removal in bulk
   Removing all ACL/Rights on Delegate Account Settings now works correctly for large infrastructures, resolving the 5xx or 422 error issue by regrouping SOAP calls into batch requests.


CO-2074: Fix delegate account issue in wizard
   The simplified wizard mode now allows adding and listing delegate accounts in the final step.


CO-2073: Fix delegate account creation in bulk
   The Carbonio Admin panel now supports efficient adding and removing of more than 20 delegate rights, even in large organizations with up to 10,000 accounts. This improvement ensures smooth and scalable delegate management for enterprise environments.


CO-2072: Rename account and change password enhanced
   Admins can now safely rename an account and change its password, including setting "Must change password", without causing conflicts. The operations are executed sequentially in the correct order to avoid failures or inconsistent user states.


CO-2071: Delegate Search Filter Optimized for Large Account Volumes
   The search filter for adding delegates in the Carbonio Admin account management interface has been optimized to handle large volumes of accounts efficiently. It now performs smoothly even with datasets of 5,000 to 10,000 accounts, enhancing scalability and admin productivity.


CO-2070: Fix bucket list change issue
   Admins can now change bucket list settings under Storage menu without requiring sendAnalytics to be enabled.


CO-2069: Carbonio Webmail Advanced Filter Enhanced
   The advanced filtering feature in Carbonio Webmail has been improved. Filters using conditions like "Answered by Me," "Sent by Me," and "Not Flagged" now function correctly, ensuring more accurate and efficient email sorting and management.


CO-2066: None
   None


CO-2065: Search support for multi-word tags
   Users can now search appointments using tags with multiple words by typing the full tag name (e.g., `tag:meeting notes`) or clicking the tag in appointments, ensuring results appear in the search tab.


CO-2064: Carbonio Calendar Invitation Notification Improvement
   Enhanced the Carbonio Calendar to include a longer description for events. Invitation notification emails now correctly render and appear properly in the mail list.


CO-2063: Fix calendar view ui breaking issue
   The calendar view UI is now stable and no longer breaks after navigating to settings and back.


CO-2062: Carbonio webmail Draft Save Functionality Improved
   The Carbonio Webmail interface has been updated to enhance the draft-saving experience. The "Save" and "Save as Draft" buttons now function as expected, ensuring that email content is properly saved before the mail composition modal is closed. This update improves reliability and prevents accidental data loss during email drafting.


CO-2059: Improved OTP Notification Display in Carbonio Webmail
   The Carbonio webmail interface now correctly displays One-Time Password (OTP) notification messages in both Russian and English. Notification content is no longer trimmed, ensuring complete and clear messaging for users in both languages.


CO-2058: Carbonio HTML Preview/Print Updated with Improved Sanitization and Emoji Support
   The HTML preview and print functionality in Carbonio Webmail has been updated. With zimbra_use_owasp_html_sanitizer enabled, inline images and emojis now render correctly in both the preview and compose editor. This ensures accurate visual formatting and improved compatibility when viewing or printing rich content emails.


CO-2057: None
   None


CO-2056: Appointment mail content rendering improved
   Appointment invitation emails now correctly display their content without excessive empty scroll and ensure visibility of all response buttons, even when appearance settings are set to large or extra-large in Chromium-based browsers.


CO-2055: Carbonnio Calendar inmproved with  "Show Declined Meetings" Option Now Working as Expected
   In Carbonnio Calendar, when the "Show declined meetings" setting is unchecked, declined meeting cards are no longer shown in the calendar view. This behavior is now functioning as expected, ensuring that only accepted or tentative meetings are visible unless the setting is enabled.


CO-2050:  Contact tags search fixed
   Contact tag filters are now correctly preserved after closing the search modal and are effectively applied during the contact search operation.


CO-2043: Fix translation issue for smime password section
   The S/MIME certificates password section is now correctly translated in Polish.


CO-2042: Polish Translation Fix & Enhanced Mail Module Actions
   Enhances the Carbonio webmail platform by fixing issues with the Polish translation and introducing improved action capabilities in the mail module, 


CO-2041: Fix polish translation for clear search
   the "CLEAR SEARCH" label was not translated to Polish in the Calendar, Contacts, and Files modules. This label is now correctly localized based on existing translations available on the translation portal.


CO-2040: Carbonio Cantact translation fixed
   Now Carbonio contacts are translating into the selected language "Polish" with all fields in the  new contact creation,


CO-2039: Polish translations for folders and byte fixed
   System folders in the mails module are now properly translated in the polish interface when editing them, and the unit for size now displays as "B" instead of the untranslated "byte".


CO-2038: Improved Carbonio Tags with Color Names Now Translated
   Carbonio's tag system has been enhanced to support localization. Tag color names are now translated according to the user's selected language, providing a more consistent and user-friendly experience across different locales.


CO-2037: Tab Title Set When Opening a Message in a New Tab
   When opening an email message in a new tab, the browser tab now correctly displays the message subject as the tab title. This enhancement improves usability and makes it easier to navigate between multiple open messages.


CO-2033: Preserve signature CSS in message composition
   Composing message settings no longer override signature CSS styles, ensuring consistent formatting.


CO-2027: None
   None


CO-2013: Fixed Backup Restoration Date Issue in Admin Panel
   Resolved an issue in the admin panel where the backup restoration date did not reflect the selected parameter. The date now displays correctly based on the user's selection.


CO-2008: Fix calendar header misalignment issue
   Calendar headings now correctly align with schedules, even with long daily appointment text.


CO-2006: New "Clear All Search Results" Button Added to Carbonio Webmail
   Carbonio Webmail has been enhanced with a new feature in the search module. A "Clear All Search Results" button is now available across all modules, allowing users to quickly clear search results from the screen, improving workflow efficiency and user experience.


CO-1998: "Search String" Reset Button Now Enabled in Carbonio
   The Carbonio webmail search functionality has been improved. The "Reset" button for the search string is now dynamically enabled only when the search field contains input (i.e., is not empty). This enhances user experience by preventing unnecessary interactions and making the interface more intuitive.


CO-1996: Fixed video call black screen issue
   The video calls no longer turn black when clicking on new email browser notifications.


CO-1992: Show details popup works in focus mode
   The 'Show details' button now correctly opens the message details popup even when the EML is opened in a new tab using focus mode, resolving the modal context initialization issue.


CO-1986: Fix carriage return font in signature
   Carriage returns in signatures now use the selected font, ensuring consistent formatting.


CO-1985: Fix attachment loss on mail forward
   Attachments are now preserved when forwarding emails, ensuring all files are included.


CO-1982: Request read receipt honoured by default
   When the attribute `zimbraPrefMailRequestReadReceipts` is set to TRUE for a user, class of service, all newly composed messages now have the "Request Read Receipt" option automatically enabled in the Web UI, without requiring manual user action.


CO-1981: Mailbox quota list view fixed
   Admins can now successfully view the mailbox quota list after changing the number of items per page to 25, 50, or 100 in the Admin Console without any display issues.


CO-1980: Fix imap synchronization issue
   IMAP synchronization now correctly fetches emails without corruption, ensuring reliable email syncing for clients.


CO-1979: Fix scroll to bottom issue on paste with Firefox
   Pasting content or links into a message reply no longer scrolls to the bottom in Firefox.


CO-1978: Carbonio Webmail Enhanced with Improved Mail View
   The Carbonio Webmail interface has been upgraded for better email readability. Inline images are now displayed correctly within the message body, maintaining their intended order and context. This enhancement ensures a smoother and more accurate email viewing experience.


CO-1976: Moving event to shared calendar fixed
    Editing a draft or saved event now allows moving it from the user's personal calendar to a shared delegate calendar, as long as the event does not have attendees and does not require a change of organiser.


CO-1975: Mail view reset after message deletion fixed
   The mail view no longer resets after deleting a message from a shared mailbox folder.


CO-1974:  Allow deletion of appointments without organizer
   Appointments created without an organizer (e.g., via external clients like Thunderbird) can now be deleted directly from the Carbonio WebUI without raising errors related to missing attributes.


CO-1970: Remove zimbra wiki link from ssl notifications
   SSL certificate expiration email notifications no longer include a link to the Zimbra Wiki.


CO-1969: Shared Contact Folders Now Visible to Shared Users
   Carbonio Contacts allows users to view shared contact folders. Shared users can now access and browse contact folders that have been shared with them, improving collaboration and contact management across teams.


CO-1965: Carbonio Webmail Editor Enhanced with Persistent Gray Background
   The Carbonio Webmail editor has been improved for better usability during long email composition. A consistent gray background is now applied throughout the entire content area, ensuring visual uniformity even when writing lengthy messages.


CO-1954: Attachment Date Remains Intact When Switching Languages in Carbonio
   In Carbonio Webmail, the attachment date now remains consistent and unaffected when users switch between different languages in the settings. This improvement ensures accurate metadata display across all supported languages.


CO-1952: None
   None

*****

End of changelog
