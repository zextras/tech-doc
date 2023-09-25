.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Changelog - Release 23.9.0
===================================

Release Date: September 25th, 2023

New Features List
-----------------

**TEAMS-4100: Enhanced Room input behavior on appointment board**
   This update encompasses numerous improvements on the Appointment board, specifically targeting the behavior of inputting rooms. The enhancements aim to refine user interaction and streamline the process of selecting and managing rooms.

.. 


**TEAMS-4020: Videoserver's token Doesn't change during update and the videoserver and Meetings are working fine.**
   Videoserver's token Doesn't change during update and the videoserver is correctly online and Meetings are also working fine.

.. 


**SHELL-140: The feedback removed from the user interface**
   To avoid feedback via this user interface, feedback is now removed from the user interface.

.. 


**SHELL-128: Optimized Rights Request in Account Settings**
   The Carbonio Web Mail interface has been optimized to reduce unnecessary requests. Previously, every time a user navigated to the account settings, a `getRightsRequest` was made. Now, this request is made only once, thereby improving performance and reducing redundant data fetches.

.. 


**SHELL-121: logout URL supports custom URL**
   Carbonio's logout URL now allows for custom URLs.

.. 


**SHELL-120: Feature control for admins in setting module**
   Admin can now enable or disable specific features within the setting module for any user. This can be achieved using the parameter 'zimbraFeatureOptionsEnabled', allowing for fine-grained control over which settings are visible or hidden in the webmail interface.

.. 


**PREV-69: Print Option in Document Preview**
   Users can now directly print a document when previewing it in the application. The software interacts with browser preferences to either download the PDF or open it for direct printing.

.. 


**IRIS-4669: Shared accounts synchronized conversation mode**
   now conversation mode in shared accounts now functions seamlessly. When performing actions like sending or deleting emails in a conversation, both the owner and delegate user are synchronized, ensuring that activities are mirrored accurately across both interfaces

.. 


**IRIS-4605: Enhanced Draft Saving Notifications**
   Users can now receive timely notifications if an error occurs during the saving process of a draft. This ensures a smoother and more reliable experience when working on important projects.

.. 


**IRIS-4602:  Pre-Send attention for missing subject and attachment**
   New pre-send attention popups now warn users if they try to send an email without a subject or attachment, ensuring important details aren't missed.

.. 


**IRIS-4601: Saved draft alert user when editor is closed**
   When the user closes the editor, it will now warn them of the potential of deleting the draft.

.. 


**IRIS-4597: Group expansion in attendee invites**
   When scheduling an appointment in Carbonio Web Mail, users can now directly invite a group of contacts. Upon entering the group name in the 'Attendees' or 'Optionals' field, the system will suggest the contact group. Selecting the group will automatically expand it, displaying all individual contact chips that make up the group.

.. 


**IRIS-4556: Instant group expansion in Email**
   Users can now effortlessly send emails to a group of contacts in the Carbonio Web Mail. When a user begins typing the name of a contact group in fields like To, Cc, or Bcc, the autocomplete feature suggests the group. Selecting the suggested group will immediately expand or "explode" the group, displaying each member of the group as individual recipients.

.. 


**IRIS-4509: Enhanced attachment upload experience for User feedback**
    When selecting a file for upload in the mail composition modal, a progress indicator along with an animated GIF will now provide visual feedback, indicating that the attachment is being processed. This improvement ensures users are aware of the ongoing upload process, enhancing the overall user experience.

.. 


**IRIS-4263: HTML link removal from calendar sharing**
   This change concerns the "HTML Link" option that existed under the "Calendar's access share" menu in Carbonio. As this functionality is not yet available, the development team has decided to remove it from the user interface to prevent any potential confusion or erroneous usage.

.. 


**IRIS-3847: Enhanced attachment upload feedback**
   Users are now provided with real-time feedback during the attachment upload process in Carbonio Web Mail. This enhancement ensures clarity regarding the upload status, preventing confusion or unnecessary waiting, especially for large attachments which could take a significant amount of time.

.. 


**IRIS-3456: Refactored the inline attachments**
   the inline attachments implementation is refactored now

.. 


**IRIS-2342:  Enhanced attachment button in Email composition**
   The Design System's updated attachment button style now allows for seamless use of the multi-button feature, reducing potential usability issues during email composition

.. 


**FILES-708: The user can simply access file previews**
   The user can now quickly get PDF preview/download of odt/ppt/docs/xls and other docs-managed files.

.. 


**FILES-428: Display File Extension in New File Dialog**
   The dialog for creating a new document, spreadsheet, or presentation in the Carbonio Files module has been updated. It now includes a non-editable file extension next to the input field. This ensures users are aware of the type of document they're creating and informs them that the system will automatically append the correct file extension.

.. 


**DOCS-191: Language Synchronization: Docs Editor and carbonio Configuration**
   Set language in Carbonio webmail setting and open or create a new docs file now edit it, Menu option of docs editor will shown in current configured language

.. 


**COR-958: Port 8743 Open and Accessible - No System Blockage**
   Mailbox server's port 8743 is now open and accessible.

.. 


**COR-947: JVM Upgrade to 17.0.7**
   The JVM has been updated to carbonio-openjdk 17.0.7, enhancing performance, security, and ensuring compatibility with the latest Java features.

.. 


**COR-942: updated carbonio core getLicenseInfo**
   The output of the getLicenseInfo CLI tool is now consistent with the subscription model.

.. 


**CO-792: Redirect Fix in PreAuth Servlet**
   The PreAuth servlet now properly redirects users to the intended `/carbonio` URL instead of the non-existent `/mail` URL. 

.. 


**AC-755: COS - Server Pools behaviour improved**
   COS - Server Pools behaviour improved now the admin can disable the sever pool

.. 


**AC-748: MTA section accessible in admin UI**
   Now the Mail Transfer Agent section is accessible in the Admin UI. This enhancement streamlines email management, providing administrators with easy access to configure and monitor email services.

.. 


**AC-737: Admin can change the Read Receipt behaviour**
   The admin can now change the Read Receipt behaviour of the account from the admin console.

.. 


**AC-724: Renamed ACL to Security Groups**
   The label previously known as 'ACL (Access Control List)' within the Carbonio Admin has been renamed to 'Security Groups' to offer clarity and streamline terminology.

.. 


**AC-716: The admin can list all domains**
   Now the admin can list of all domains on the server.

.. 


**AC-702: Copy button added to chips**
   A "copy" button has been added to chips in the Carbonio Admin interface.

.. 


**AC-686: Custom logout URL support in admin**
   Admins can now set a custom logout redirection URL within the WhiteLabel settings. This URL will be used by both User and Admin UIs to redirect users post-logout.

.. 


**AC-630: Admin can manage custom HSM policy**
   Now, the admin can define custom HSM policies and run them at the specified time in the scheduler. They can also create for the future or bypass the creation process entirely.

.. 


**AC-571: External LDAP/AD Warning Enhancement**
   A warning has been introduced when working with user credentials within domains that use external LDAP/AD, especially when local fallback is disabled, ensuring the admins do not attempt configurations that won't be effective.

.. 


**AC-570: domain/delegated admin cannot remove system accounts**
   now delegated admin cannot delete system account like galsync etc. while accounts shown in list and global admin can delete system account but it's showing primary warning message before delete.

.. 

*****


Bugfix List
-----------

**SHELL-152: Primary bar module display**
   A race condition issue has been identified and resolved in the loading process of modules

.. 


**SHELL-126: Improved Persona Counter Calculation**
   The persona counter calculation logic has been enhanced to ensure identity name collisions are avoided, especially in scenarios involving unsaved modifications or deletions of identities.

.. 


**SHELL-123: UI improved quota percentage is displayed correctly**
   When the quota percentage exceeds 100%, the UI now properly displays it.

.. 


**SHELL-109: Refactor "Delegates" functionality**
   The zimbraPrefDelegatedSendSaveTarget value in the radio group is modified correctly when users alter values and save them from the user interface.

.. 


**SHELL-87: Improved translation of searchbar strings**
   The search bar strings are now correctly translated.

.. 


**SHELL-81: Settings breadcrumb improved**
   Deactivated the clickable function of the breadcrumbs in Settings and improved user navigation.

.. 


**SHELL-49: UI fixed for Extremely Long Search Keywords**
   UI improved for extremely long search keywords; before, inputting an exceptionally long query in the search field caused the UI to move awkwardly to the left.

.. 


**IRIS-4702: Flexible inline image placement in email Compose**
   composing new emails allows for the seamless insertion of images anywhere within the email body, be it the first line, last line, or anywhere in between.

.. 


**IRIS-4688: Resolved interaction issue: getMsg request and SaveDraftRequest**
   Now when editing a draft message, "getMsg Request" no longer appears alongside "SaveDraftRequest" in the "Network" window. This implies that the "getMsg" function is not necessary and does not activate when the content in the body or subject is changed.

.. 


**IRIS-4687: Safeguard delegated shared folder deletion**
   Deletion of a local shared mounted folder is now protected and can be restored. The software has been updated to prevent the loss of the original folder when the shared counterpart is deleted or renamed.

.. 


**IRIS-4683: Enhanced recipient search with advanced filter in mail**
   Users can now efficiently search for emails using the advanced filter by recipient in both the TO and FROM fields. This enhancement includes email ID autocomplete and populated from chips, providing a more user-friendly and convenient way to search for emails by recipients.

.. 


**IRIS-4679: Persona address selection enables send action**
   Upon selecting a persona address for mail delivery, the system now accurately displays the complete name associated with the persona and enables the send option appropriately.

.. 


**IRIS-4678: Seamless message saving while composing email**
   While We're writing new messages in the mail editor, writing some text, and saving them I am not getting any deletation of previous text while using the save button again.

.. 


**IRIS-4671: Double click on drafts improved**
   Now, a double click on the drafts returns the editor to its usual state, with no errors.

.. 


**IRIS-4667: Seamless Reply Functionality from Message List**
   Now users can reply directly from the message list without encountering any errors. This enhancement streamlines the communication process, providing a seamless experience for users

.. 


**IRIS-4662: Enhanced advanced search filters for shared accounts**
   Enhanced search functionality within shared account inboxes using the advanced filter. Now, when applying advanced filters in shared accounts, search results exclusively display shared account data/chips in the search result bar, ensuring private data remains confidential and secure.

.. 


**IRIS-4661: Shared account mail duplication fixed**
   Now duplicate emails in shared accounts are fixed. Previously, when sending a mail to a shared account and receiving a reply, duplicate emails were observed. With this fix, the system now correctly manages these emails.

.. 


**IRIS-4659: Missing CC contacts in "Reply All" is fixed**
    the missing CC contacts when using the "Reply All" button are now fixed. Previously, some contacts were not included in the CC list when using this feature.

.. 


**IRIS-4658: The Identity description improved**
   After technological advancement, the identity description in the editor is showing now correct size 

.. 


**IRIS-4657: Distribution lists selectable as valid addresses**
   Now the distribution lists are selectable as valid addresses while sending an email.

.. 


**IRIS-4655: "no send delay" fixed**
   "no send delay" feature is fixed now. Previously, selecting "no send delay" would initiate a countdown that never concluded.

.. 


**IRIS-4621: EAS inline images display in Carbonio**
   Images inserted inline inside the body of an email in the Outlook client are now appropriately shown when the email is read within the Carbonio user interface.

.. 


**IRIS-4617: UI Update for Recurrent Event Exception Invites**
   UI Now Updates Properly When Sending Recurrent Event Exception Invites, a red icon now indicates when an appointment has not been sent.

.. 


**IRIS-4603: Send on behalf of Identity name fix**
   A solution has been implemented to capture and display the correct sender's name when using the "send on behalf of" identity. The underlying issue causing the "no name" problem has been identified and resolved.

.. 


**IRIS-4598:  Enhanced Printing Layout in Carbonio Web UI**
   Enhanced printing layout when generating normal mails from the Carbonio web UI. In previous versions, some lines were truncated or extended beyond the page.  This update fixes these problems, allowing for a more smooth printing experience.

.. 


**IRIS-4570: Attendees on a shared calendar no longer vanish**
   While modifying a shared calendar, the attendees no longer vanish.

.. 


**IRIS-4550: Shared Calendar appointment update capability**
   Users who have been granted access and rights to specific calendars can now effectively update appointments such as date changes or modifications to attendees

.. 


**IRIS-4539: Email Integration Inside Appointment Displayer Operational**
   The integration for sending emails within the appointment displayer is now operational.

.. 


**IRIS-4425: Seamless signature updates in Carbonio settings**
    Users now have the ability to effortlessly edit or add a new signature. Any changes made will be instantly visible when a user creates a new email, completely eliminating the need to reload the page.

.. 


**IRIS-4399: Calendar modal content overflow fix**
   Resolved an issue in the Carbonio Calendars UI where the content of the "Edit Calendar" modal was overflowing. Now, when sharing a calendar with multiple accounts, the content is contained inside the modal with a scrollbar for easy navigation, ensuring user-friendly interactions.

.. 


**IRIS-4387: Attachment is present when email is forwarded**
   The attachment is now present when email is forwarded.

.. 


**IRIS-4152: Non-Notification deletion of saved/draft appointments**
   Now the users can delete saved appointments without triggering a cancellation notification to the attendees. With the help of this improvement, users will have more control over how they manage their calendars without receiving pointless messages.

.. 


**IRIS-4026: Enhanced Signature Functionality in Carbonio Setting**
   Users can now easily change or add a new signature. The modifications will be implemented dynamically when a user creates a new email, avoiding the requirement for a page reload. 

.. 


**IRIS-3970: Add public link from Files works**
   Add public links from Files is now working properly on the email board when using the email attachment options.

.. 


**IRIS-3960: Enhanced image display in received emails**
   The mail system now assures appropriate image formatting in the received mail body, particularly when originating from external sources. This enhancement ensures a more dependable and visually appealing email experience.

.. 


**IRIS-3958: Image preservation on email forwarding**
   A fix has been introduced to ensure that when users forward an email containing an inline image using Carbonio UI, the image remains intact and is not lost during the forwarding process.

.. 


**IRIS-3939: Inline Image Upload in Emails**
   The software has been enhanced to ensure that adding inline images while composing an email remains stable in the email composition interface.

.. 


**IRIS-3929: No more Duplicate Messages in Draft Folder**
   Enhancement to the draft folder functionality. Users will no longer experience duplicate messages while composing an email, especially when a subject is added and the draft is saved promptly. This enhancement ensures a seamless and efficient drafting experience.

.. 


**IRIS-3844: Draft email inline image integrity**
   With recent updates, when users edit a previously saved draft or a scheduled e-mail containing inline images, the integrity of these images is preserved, preventing any broken image links or undisplayed images.

.. 


**IRIS-3751: Inline image retention in email replies**
   Carbonio Web Mail now ensures that inline images, originating from both internal and external email providers, are retained when replying or forwarding.

.. 


**IRIS-3730: The attachment menu is no longer floating**
   the menu for attachment is enhanced, now the attachment option now closes appropriately. when user collapse or enlarge the board.

.. 


**IRIS-3712: Mail forwarding no longer loss attachments**
   Inline attachments are no longer lost when email is forwarded.

.. 


**IRIS-3692: Instant default signature update feature**
   Users can now set their signature as default instantly after createing/changing it. This enhancement ensures that the updated signature preference takes effect immediately without the need to manually reload the page. 

.. 


**IRIS-3626: Enhanced Appointment Cancellation Logic**
   Appointment cancellation has been enhanced; appointments may no longer be cancelled for all users who are not designated as the organizer, and he can only send notifications to the organizer.

.. 


**IRIS-3625: Mail composition switching mode enchanced**
   Users can now switch between the Rich Text Editor and normal text modes without losing any mail body data. This enhancement ensures a smooth transition in mail composition, allowing for uninterrupted workflow.

.. 


**IRIS-3616: Automatic popup closure upon file attachment in email**
   In the latest update, attaching a file to an email has been optimized for user convenience. Now, when selecting a file, the source pop-up window (local disk, files...) will automatically close once the attachment is successfully added to the mail. 

.. 


**IRIS-2933: Email send button get disabled automatically when attachment is in progress**
   Now when we start composing any new mail and fill all the details and wants to try sending mail while attachment is in progress (uploading) then send button automatically disable or block to send mail

.. 


**FILES-713: File versioning enchanced for download**
   After the refactor of carbonio-files routes, a regression was rectified allowing users to download a specific version of a file and open a specific version of a document with docs.

.. 


**FILES-705: Improved error handling in folder UI for children response**
   The folder UI now handles errors in children's responses seamlessly, if a revision data "node_id" is deleted from the database, the respective file will no longer be visible. The list will now display only the remaining files, providing a more streamlined and error-tolerant user experience.

.. 


**FILES-689: Uploaded items are visuble on all module**
   Uploaded items are shown when the upload is made from a different module

.. 


**FILES-528: Clickable "Upload" Icon for Seamless File Upload Experience**
   Now during file uploads, users can click on the "Upload GIF" option, which seamlessly navigates them to the upload tab, displaying the ongoing file upload process

.. 


**COR-990: `getServer` API fixed**
   A bug has been fixed, and now `getServer` API replies correctly to the requests.

.. 


**CO-839: Appointment modification fixed in CalDAV**
   Fixed a bug that caused an error while creating, modifying or deleting an appointment from the calendar via CalDAV. Now the appointments can be created, modified and deleted successfully.

.. 


**CO-797: Service status of carbonio-bootstrap improved**
   When we execute carbonio bootstrap during installation, we may enable/disable services. After setup, we obtain service status as it was configured during installation.

.. 


**AC-770: Admin can manage PublicServiceHostname**
   Now the admin can manage the PublicServiceHostname from Admin UI

.. 


**AC-767: Enhanced Mailing List Behavior**
   With the most recent version, you can now create or change mailing lists directly from the admin panel. When you make changes to the "Who can send mails TO this list?" setting, save them, then dismiss the modal window, the changes will be saved. When you revisit the same configuration, it will be exactly how you configured it to be.

.. 


**AC-751: Account Mailbox Quota Updates properly**
   The value of a user's mailbox quota now adjusts according to your preferences and remains steady. This implies that it will no longer revert to "0" on its own.

.. 


**AC-745: Carbonio Admin Panel Login Error corrected**
   Fixed the login error messages in the Carbonio Admin Panel. When the Mailbox node or service is offline, the admin login page now shows appropriate error messages.
   Following this upgrade, the error message will be more descriptive, stating "Error 502: Service Unreachable - Retry Later."

.. 


**AC-744: Login UI Error Handling for Passwords with Personal Information**
   When a user attempts to set a password using his personal account information on the first login, now the valid error message "Invalid password Password contains username or other personal data" appears.

.. 


**AC-743: Error Handling for mailbox service enchanced**
   When the mailbox service is stopped and a user attempts to log in to Carbonio CE/Advanced, a user-friendly error message is displayed instead of a JSON error. The system now correctly recognizes and presents a "Service Unreachable" error to the user.

.. 


**AC-721: Enhanced HSM Settings schedule Hint**
   HSM settings now enhanced configuration saving capabilities. Additionally, a helpful scheduling hint, "0 2 \* \* \*", has been added. These improvements ensure a more secure and streamlined experience

.. 


**AC-717: Cross-Domain Account Delegation Enhancement**
   Administrators are now able to delegate accounts beyond the specific domain an account belongs to. This enhances flexibility and administrative control by allowing, for example, an admin from domain1.com to delegate rights to admin@domain2.com.

.. 


**AC-703:  "Prevent user from changing password" is removed from the General Tab**
   Now the "Prevent user from changing password" is removed from the General Tab in edit mode, as it is managing from the security tab

.. 


**AC-700: powersStoreMoveScheduler bugfix**
   Fixed a bug that caused the admin console to always show the default value of `powerstoreMoveScheduler`. Now the value is shown properly.

.. 


**AC-681: Distribution list edit issue resolved**
   In the Carbonio Web Admin interface, we've addressed a previously reported behavior with the modification of distribution lists. After creating a distribution list, users can now seamlessly edit and save changes without any hindrance. Changes to the "Members," "Owners’ Settings," and "Who can send mails TO this list?" fields are now effectively saved and accurately reflected upon revisiting.

.. 

*****

End of of changelog
