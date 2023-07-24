.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Changelog - Release 23.7.0
===================================

Release Date: July 24th, 2023

New Features List
-----------------

**SHELL-27: The board can resized more effectively**
   The board may now be resized more effectively.so that user may put message on board with varied sizes and different locations to move the full board in anywhere on the screen.

**PREV-114:  Preview enhanced while retrieving data from storage**
   The preview is improved while retrieving data from storage. When opening many files at a time, the retrieve data function is no longer awaited.

**PREV-22: GIF Preview and Thumbnail Functionality**
   This improvement implements the display of GIF files in the Carbonio Web Mail Files module. When a GIF is uploaded and later selected both the previews and thumbnails reflects the correct content of the file instead of a static image

**IRIS-4373: Creating a new calendar activates it  by default**
   When a user creates a new calendar, it is now enabled by default.

**IRIS-4333: Attendee availability in new appointments has improved**
   We can now simply grasp the availability of any guest in a new appointment by displaying notifications 
   ‘One or more attendees are not available at the selected time of the event’.

**IRIS-4213: Attachment indicator present on print mail**
   Now, when we print new messages or save them as PDFs, the presence of the attachment is indicated in the printed text.

**IRIS-3938: Move conversation functionality improved**
   The 'Move' feature now effectively allows for seamless conversation movement to any chosen destination folder, improving email data management in shared functional mailboxes.

**IN-595: The carbonio command launches a tty**
   The Carbonio command now spawns a tty and returns the command's value.

**IN-570: Clamav updated to version 1.0.1**
   Carbonio-clamav-1.0.1 is now the default antivirus version in the latest Carbonio release.

**FILES-675: Carbonio files supports GIF preview  thumbnail**
   The Carbonio files now support GIF previews and thumbnails.

**FILES-645: Clear red alert notication shown on upload fails**
   If an upload fails, a red alert indicator appears near the counter in the secondary bar's "uploads" entry.

**FILES-644: Improved behavior of Uploads's badge in file**
   The behaviour of the Uploads badge in files has improved, and it is now showing the appropriate badge.

**FILES-573: Files and Folders Count Feature**
   This improvement provides users with the count of selected files/folders in the Files tab. This functionality is supposed to aid users in managing and understanding the amount of data they are dealing with without the need for manual counting or estimation.

**COR-934: Delegation group initiation via CLI**
   In accordance with the rebuild role document, we've added a new CLI and API command called 'initDomainForDelegation' to the AdminUI. This command is intended to construct delegation groups, as described in the paper, allowing for more efficient role management.

**COR-914: Improved structure of Carbonio JAR files**
   The file organization within the Carbonio JAR package files has been enhanced. The new structure is systematically sorted based on module, service, and library, which streamlines the management and handling of these files.

**CO-782: Draft deletion in a shared mailbox enhanced**
   The backend has been adjusted to consistently delete drafts from the authenticated user's mailbox after sending, even when using shared mailboxes. This change resolves an issue where drafts were left undeleted when sent from a shared mailbox.

**CO-756: External request content security policy  improved**
   Now, for some external requests, such as docs editing, security threads are being updated. It is changed to break zimbraReverseProxyResponseHeaders into carbonioReverseProxyResponseCSPHeaders to retain a single CSP header.

**CO-727: Attachment can save to Files from shared account**
   The 'Save to Files' function now allows users to save attachments from shared mailboxes, which improves cross-account attachment management and increases user productivity.

**CO-694: Subscribe to distribution list attributes removed**
   Subscription/unsubscription attributes have been removed from the distribution list because they have been deprecated for a long time.

**CO-677: Carbonio-proxy's consul token path updated**
   The consul token path for carbonio-proxy has been modified to "/etc/carbonio/proxy/service-discover/token".

**AUTH-517: Enhanced authentication error messages**
   The authentication error message for unauthenticated operations has been improved.

**AC-723: Subscribe to distribution list removed**
   The deprecated attribute linked to the distribution list subscription has been deleted from the DL management.

**AC-693: The admins can manage carbonioAmavisDisableVirusCheck**
   Now, the administrator can control carbonioAmavisDisableVirusCheck from the administrative console.

**AC-649: Admin can change domain of the account**
   Admin can now modify the domain name of an existing account on another domain.

**AC-624: Feedback includes directions for forums and tickets**
   The feedback now includes instructions on how to write a forum post or an open ticket.

**AC-483: Admin allowd to request a LetsEncrypt certificate**
   The admin can now request a LetsEncrypt certificate from the admin console.

**AC-453: Account COS Inheritance management Enhanced**
   The inheritance behaviour now improved from the account on values received from the Class of Service.

**AC-308: Improved HSM Settings Admin UI**
   The Carbonio Web Admin UI Hierarchical Storage Management (HSM Settings) panel has been enhanced to allow admins to set an HSM operation manually and/or schedule. It also provides optional prompts for using the current policy or defining a custom one, deciding on post-task deduplication, and setting up notifications upon job completion.

**AC-165: Admin can configure 2FA and trusted network**
   Now the administrators can configure 2FA and trusted networks on global and domain levels, these values in multiple managers include pop, SMTP, IMAP, dal, and user interfaces.

*****

Bugfix List
-----------

**SHELL-115: Save Settings Modal Functionality**
   Improved the modal and UI behavior when changing Settings, the user must choose one of the available options: 'Cancel', 'Leave anyway', 'Save and leave' or to click outside the modal

**SHELL-101: Allow  '& < >' characters on out-of-office auto-response**
   Fixed an issue affecting "&", "<" and ">" characters in an out-of-office auto-reply which caused the auto-reply not to be sent to the sender. The problem occurred specifically when the characters were included in the out-of-office message.

**SHELL-70: The out-of-office portion is operational**
   The out of office section is now operational. while selecting from the drop-down list available in the external sender.

**SHELL-46: Search filters changes based on origin of the user**
   When the user navigates to the search module from another module, the search filters are now switched based on the module from which the user originates.

**SHELL-32: Search settings inside general settings improved**
   Search settings inside general settings are now properly stored.

**IRIS-4533: Enhanced folder list on selection**
   The folders list is now properly displayed after selecting the shared folder; previously, the selected folder was updated but was moved to the end of the list; this issue has now been rectified.

**IRIS-4467: Canceling an invitee's appointment became better**
   Users can now select to notify the organizer alone after cancelling an appointment to which they were invited.

**IRIS-4465: System folder name validation is deactivated**
   The name validation for system folders is now disabled, so users cannot rename them, but they can edit and alter their colors.

**IRIS-4456: Enhanced folder creation**
   When you perform the New folder action, the new folder is created as a child of the Inbox folder, even if you specify a different parent. This was caused by a glitch; the folder creation process has been rectified, and the new folder's position is now correct.

**IRIS-4447: Calendar settings loop fixed**
   Fixed a rendering loop in the calendar's settings which caused the browser to crash.

**IRIS-4441: Improved Conversation Deletion Feature**
   The "Delete" function has been enhanced for conversations. Rather than permanently deleting an entire conversation, users are now able to move conversations to the trash folder, providing the ability to restore or search these conversations if necessary. 

**IRIS-4440: Enhanced shared account draft and trash messages**
   Drafts and trash messages in shared accounts are now displayed as separate messages rather than as a conversation.

**IRIS-4403: Redirect button status enhanced**
   Redirect email button status improved by redirect status button of each message is disabled till the input email address is valid

**IRIS-4402: Error handling in redirect action**
   The mail redirect action is now improved by displaying the red snack bar when redirecting to an invalid email address or when the computer's network is disabled.

**IRIS-4390: Folder deletion in a shared account working**
   The folder deletion in a shared account is now operational.

**IRIS-4384: Moving folders for power users enhanced**
   Moving folders for power users with a high number of folders has been improved, and the interface's speed has been improved.

**IRIS-4375: User has ability to edit shared item name**
    The user can now edit the shared calendar "item name"  on the share notification email without a problem while accepting the share

**IRIS-4362: Messages are shown in shared with me folders**

All messages are now displayed in shared with me folders, even when the source mailbox is set as "view to conversation" and the target is "view to message".

**IRIS-4330: Error Feedback on Invalid Folder Creation**
   Improved the behaviour of the infinite scroll in search results, caused by the offset parameter not being passed to the search function. The users can now go through an infinite list of search results.

**IRIS-4315: The sharing of folders improved**
   The "send notification about this share" checkbox is now by default selected when a user shares a folder.

**IRIS-4265: Message move in search results enhanced**
   The behaviour of the move message in search results improved, the inactive "move" button now includes a tooltip telling the user that the selected folder is already a child of the folder.

**IRIS-4255: Show original option available in mail context menu**
   The "show original" option is now available in the mail context menu by right-clicking on a message item.

**IRIS-4236: Improved Infinite Scroll in Search Results**
   Improved the behavior of the infinite scroll in search results. This was due to the offset parameter not being transmitted to the search call. With this improvement, users will be able to smoothly scroll through an infinite list of search results without any hitches.

**DOCS-195: Carbonio-docs-editor service enabled onboot**
   Carbonio-docs-editor services are now enabled during system boot.

**DOCS-194:  Print functionality fixed**
   The print feature has been restored on the updated Carbonio docs core and editor.

**DOCS-193: Multi-instance clipboard functionality**
   This update enhances the clipboard's correct operation in a multi-instance environment. This involves ensuring that the right serviceId is used when performing copy-and-paste actions. 

**DOCS-192: Language modification for docs-editor functions**
   The user can now alter the language of the document. Carbonio-docs-editor appropriately updates when a user picks a language from the tools. menu.

**CO-781: After upgrading from 23.6 to 23.7 zmconfigd works**
   After updating from version 23.6 to 23.7, Zmconfigd is now functional. Zmconfigd stopped working due to a problem with the upgrading of Carbonio 23.7, which has since been fixed.

**AC-708: Domain and COS input dropdown fields focused**
   The COS and Domain input dropdown fields are now properly focused and working.

**AC-621: Email Retention Ensure Unit Measure**
   Improved the UI behavior of the "E-mail Retention Policy" regarding the "E-mail message lifetime" field, the "Time Range" dropdown now displays a unit of measure by default and not an empty field, the current default value for this parameter is in "Seconds". As a note "Minutes", "Hours" and "Days" units of measure are also available.

**AC-569: Admin can change compression threshold value**
   Admin can now modify the value of the storage compression threshold.
