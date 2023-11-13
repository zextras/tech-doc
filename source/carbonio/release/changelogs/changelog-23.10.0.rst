
Carbonio Changelog - Release 23.10.0
====================================

Release Date: October 16th, 2023

New Features List
-----------------

**SHELL-170: Enhanced initial configuration for tinyMCE**
   This update enhances the initial configuration of TinyMCE for a smoother user experience. It includes checks for browser spellcheck, newline behavior in blocks, and bulleted/numbered lists.


**SHELL-168: Seamless web UI structure across screen sizes**
   With this enhancement, the Crabonio web UI maintains its structural integrity even when the screen size is reduced. Users will now notice a horizontal scrollbar at the bottom, allowing for a smooth experience without any disruption to the UI layout.


**SHELL-149: Streamlining logout process with '/logout' endpoint**
   This update ensures that when a user clicks the logout button, the system now directly calls the '/logout' endpoint instead of the previous '/?loginOp=logout', improving the logout process efficiency.



**IRIS-4720: Enhanced browser spellcheck validation**
   This update focuses on validating the browser spellcheck functionality in TinyMCE. The steps involve creating a new email, ensuring rich text mode is active, and verifying that the browser correctly highlights misspelled words. This enhancement aims to ensure accurate spellchecking within the editor.


**IRIS-4607: Folder movement at root level**
   Users are now enabled to move a folder directly to the account's root level, offering enhanced organization options within the Mails module.


**IRIS-4585: Enhanced UX for Bullet Lists**
   This enhancement focuses on improving the user experience when working with bullet lists. It introduces a more intuitive functionality where pressing the 'Enter' key moves to the next bullet point, while using 'Shift' + 'Enter' allows for seamless continuation of text within the current bullet paragraph. This adjustment aligns the behaviour with widely adopted email composition practices, resulting in a significantly enhanced user experience


**IRIS-3507: Floating toolbar in TinyMCE**
   Users composing lengthy emails in the editor will now have access to a floating toolbar. This dynamic toolbar improves usability by removing the need to scroll up for accessing editor functionalities.


**COR-977: Admin can manage ISP billing data**
   With the newly added CLI functionality, administrators now have the capability to manage ISP billing data efficiently. Using the commands 'getUsageData' and 'deleteUsageData'.


**CO-824: Added default value to MailTrustedIP**
   A default value was added to zimbraMailTrustedIP, this helps to preserve the original IP (OIP) in authentication and logs in connections between proxy and auth using Carbonio and Consul.


**CO-821: Enhanced SOAP API documentation**
   Expanded SOAP API documentation now covers previously missing fields


**CO-813: Added /logout endpoint for nginx template consistency**
   A new logout endpoint has been introduced to streamline user logout. This change ensures a consistent logout process across Admin UI and Web UI. Additionally, the old query parameter-based logout method (loginOp=logout) will be deprecated in the next Carbonio version, with a notice included in the template for user awareness. This update aims to enhance logout handling and standardization.


**AC-802: Subscription features labeling in admin panel enhanced**
   In the admin panel of our subscription service, we've made significant improvements to the labeling of features. This means a more intuitive and organized presentation of software bundles, with features now sorted in a clear descending order. Additionally, we've introduced new labels for multiple features, enhancing the overall user experience
   


**AC-784: Subscription labeling system enhanced**
   The subscription label now updates from the emission date to the end date for improved tracking and clarity.
   


**AC-773: Enhanced attribute management for admins**
   Admins can now view and ustomize Notes (zimbraNotes) and Description (description) attributes for distribution lists, domains, accounts, security groups, and COS general information, enhancing administrative control and efficiency.


**AC-740: API return Error if "Storages HSM" License not activated**
   This update ensures that when the Carbonio License is not activated or the "Storages HSM" feature is not enabled in the bundle, any attempt by an administrator to create a new policy in Storage-HSM will result in an API error message providing clear information about the license status.


**AC-728: Admin can manage the MTA Queue**
   Administrators may now monitor the current MTA queue status and request a cache flush from the admin panel.


**AC-718: Web admin navigation icon alignment update**
   While accessing Carbonio Web Admin module, icons are realigned into landscape mode and optimized for consistency when length x width ratio conditions are satisfied.


**AC-696: User control for settings module improved**
   The admin now has the ability to enable or disable the "settings module" for users in the Carbonio web UI. This functionality grants administrators greater control over user permissions related to settings access, thereby enhancing overall user security.


**AC-537: Name and surname fields swapped in account creation**
   The account creation sequence has been changed to "Surname, Middle Name, and Name," resulting in an inversion of both "Name" and "Surname" fields for both new and existing accounts.
   


**AC-480: Admins Can restore accounts across different domains**
   Admins with multi-domain privileges can now seamlessly specify the target domain for account restoration. This enhancement allows admins to choose from the granted domain or domain aliases during the account restoration process, ensuring efficient and precise management.


**AC-473: Improved admin panel for account view**
   The Carbonio admin panel now offers an improved user experience with a new feature. we have introduced a customizable "Items per Page" option in the account viewing section. This enhancement provides a more insightful perspective on the total number of items displayed per page, enhancing your admin experience.

Bugfix List
-----------

**PREV-124: Enhanced image preview navigation in file module**
   With this enhancement, the image preview functionality in the file module now seamlessly displays previous and forward navigation buttons even when the browser screen size is reduced, making it easier to navigate between images during preview.


**MOB-415: Thunderbird external cyrillic attachment EAS encoding**
   Addressed the issue that caused broken encoding for Cyrillic attachment names when sent from Thunderbird via external providers to Zextras Suite and Carbonio accounts synchronized via EAS. This ensures attachments with Cyrillic names retain their original format, including their file extensions.


**IRIS-4734: Enhanced draft editing no longer losing past changes**
   When a user makes multiple edits to a draft, any changes from earlier interactions are now retained. This feature safeguards user work, leading to a smoother and more efficient drafting experience.


**IRIS-4733: Improved calendar editor functionality for deletions**
   Users can now seamlessly open the editor to modify the cancellation message without any interruptions. This update guarantees a stable editor performance when editing the deletion of a calendar appointment.


**IRIS-4728: Edit appointments directly from search results**
   Users can now easily modify appointments from search results. This improvement streamlines the appointment management process, giving better efficiency and convenience. Users may now simply make essential changes to their appointments after doing a search without the need for additional steps.


**IRIS-4567: Enhanced contact address editing in email composition**
   Users can now edit email addresses directly while composing a new email. When entering addresses in the TO, CC, or BCC fields, two options are available: 'Edit Address' and 'Delete Address.' This enhancement streamlines the user experience by enabling easier editing and management of email addresses during email composition.


**IRIS-4559: Multiple messages movement to folders**
   Improved the behavior when users drag & drop emails into multiple folders sequentially, ensuring the emails are being moved to and from their intended folders.


**IRIS-4461: Precise badge counts for shared folder conversations**
   We have resolved the issue with badge counts in shared folders, ensuring that they now accurately reflect the number of items in conversations.


**IRIS-4357: Improved  'Send an Email' icon for participants**
   This update ensures the 'Send an Email' button for participants functions correctly. Following the sending of an appointment, the email is now properly saved in the user's sent folder, confirming its successful transmission. This improvement leads to a more seamless user experience.


**IRIS-4297: Enhanced Calendar description preservation**
   Following the acceptance of a proposed new time for a calendar appointment, the original description is now seamlessly preserved and correctly displayed for both web and mobile users, ensuring a smoother scheduling experience.


**IRIS-4108: Calendar color update confirmation displays correctly**
   Now, when you change the color of the calendar, both the icon and title update accordingly. This improvement ensures a more accurate representation of the selected color.


**IRIS-3959: Instant Calendar model updates with revoked sharing access**
   Revoking access to shared calendars is now in real time, the latest update ensures that when a user removes permission from a shared calendar, the changes are immediately reflected in the modal view, making permission management quicker and more efficient.


**IRIS-3952:  Enhanced 'From' persona mail setting**
    This update rectifies the 'From' persona mail setting, allowing users to customize their display name in Account settings. This ensures that recipients see the preferred name instead of the UID field when receiving emails.


**IRIS-3890: Accurate timezone information for appointments**
   Users can now view the accurately set timezone within the appointment details. Our latest update guarantees precise timezone information for appointments. When accessing old appointments created in various local system timezones, the displayed timezone information now aligns accurately with the original creation timezone.


**IRIS-3335: Share list refreshes after right revocation**
   Previously, the shares list failed to refresh when a grantee's right was revoked. This issue has been resolved, and now, when a grantee is removed, the shares list will refresh to reflect the changes.


**FILES-728: Corrected shared file user ID**
   When a user uploads a new version of a shared file or a new file on a shared folder the Files module now correctly passes the owner's user-id to the Store instead of the uploader's user-id.


**FILES-515: Automatic update of shared content in folders**
   When sharing a folder, the system now ensures that any changes to its content, including subfolders, are promptly updated. This ensures that the shared content is always current and reflects any additions or modifications made within the folder structure.


**COR-999: Automatic start of carbonio-avdb-updater post fresh installation**
   This update ensures that the carbonio-avdb-updater initiates automatically after a fresh installation, streamlining the setup process for enhanced functionality.


**COR-995: Seamless license activation**
   The activation of the license now runs smoothly, with the 'Cannot store subscription in Consul KV-store' error resolved. This ensures a successful activation process. The 'activate-license' function now operates seamlessly in the console.


**CO-819: Timezone setting in carbonio-bootstrap**
   With this update, admin can able to set the timezone settings during the execution of carbonio-bootstrap, providing greater flexibility and accuracy in system configuration.


**CO-277: Public service hostname configure on Proxy node bootstrap**
   In a multiserver setup, the Public Service Hostname is now configured during the Proxy node bootstrap process. Previously, it was set during domain creation on the directory server. Due to the domain being created before the proxy, situations arose where the serviceHostname was configured with the Directory Server hostname, leading to errors. This issue has now been successfully resolved.


**AC-793: Domain delegates interface enhancement**
   The update involves concealing the "Remove" and "Remove All" buttons in the Domain Delegates section for a cleaner interface. Additionally, the Add input fields and button have also been hidden to streamline the user experience.

*****

End of of changelog
