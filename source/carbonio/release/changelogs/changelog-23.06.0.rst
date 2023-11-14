.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Changelog 23.6.0
================

Release Date: Jun 26th, 2023

New Features List
-----------------

**SHELL-75: Behavior  of tabs within the board Improved**
   The behaviour of tabs within the sideboard improved to be more comfortable.
   Technical Improvement
 


**IRIS-4318: Appointment's form avoid closing if not saved**
   If a problem occurs while saving an appointment, the form is no more closed until it's saved correctly.
   Technical Improvement
 


**IRIS-4142: Mail list refactoring**
   The list component in UI has been completely refactored to improve performance and fix a couple of bugs.
   Epic
 


**IRIS-3837: GetShareInfoRequest works for shared mailboxes**
   GetShareInfoRequest are working correctly for both  mail and calender, everything works with different grant types.
   Technical Improvement
 


**IRIS-3388: Restore option in trash folder**
   It is now possible to restore items to a selected folder by clicking on the restore option in the trash folder.
   Story
 


**FILES-646: Recent and flagged items improved**
   Files has been improved so that users may see recent and flagged items without having to extend the filter.
   Story
 


**AUTH-417: Carbonio Auth as Consul service**
   The Proxy and Video recorder service are now able to reach the auth service via Consul.
   Story
 


**AC-641: White QR code in dark mode**
   Auth QR code in Dark mode is now white so it's easier to scan.
   Task
 


**AC-623: Confirmation on empty password**
   When admin try to empty a password a confirmation is required and password is just empty after that.
   Story
 


**AC-576: Polish language available for Carbonio adminUI**
   The Polish language is now available in Carbonio AdminUI.
   Task
 


**AC-530: Administrators can manage contact information**
   The administrator can now manage account contact information.
   Story
 


**AC-514: Banner for closed domain**
   Now you will get a banner for closed domains in all sections under Domain ( for GAL , Authentication , Accounts , Mailing list etc ).
   Story
 


**AC-477: Global Admin MTA Antivirus & Antispam control**
   This improvement ensures that the Global Admin has the appropriate access rights and functionality to manage the MTA AntiVirus and AntiSpam general settings.
   Story
 

*****


Bugfix List
-----------

**TSK-40: Hover bar actions improved In dark mode**
   In dark mode, the hover bar actions are now visible.
   Bug
 


**SHELL-112: Feedback board improved**
   The board for leaving feedback should be shown in webmail.
   Bug
 


**SHELL-79: Message writing module visible in board**
   Now message is not moving from main board to draft, while browser windows restore/shrink from mobile view to desktop view. it is improved
   Bug
 


**PREV-113: Corrected myme-type from Thumbnail API**
   The Thumbnail API has been fixed so that it now returns the appropriate mime-type for the images.
   Bug
 


**IRIS-4354: Move action in link folder message fixed**
   Fixed a bug that caused the Carbonio apps to crash when moving a message from the linked folder.
   Bug
 


**IRIS-4323: Message move modal enhanced**
   The single message move modal is now improved, and moving the single message modal title shows correctly, that is "Move Message".
   Bug
 


**IRIS-4320: Filter the folders inside the modal Move**
   Now when moving a message/conversation you can easily filter the folders inside the modal ‘Move’
   Bug
 


**IRIS-4305: The labels inside the folder selection fixed**
   The list of folders within the folder picker now displays the right labels for the nested folders. The last element of the folder path is no longer repeated.
   Bug
 


**IRIS-4270: The search message in nested folder improved**
   There is no longer any error while searching for messages in nested folders and the visualisation of the messages is adjusted by message.
   Bug
 


**IRIS-4267:  Shared folder's email list enhanced**
   After clicking an email, the mail list in the shared folder no longer disappears.
   Bug
 


**IRIS-4261: Unread conversations shows the correct number**
   Now the correct number of unread conversions is shown in shared folders.
   Bug
 


**IRIS-4254: Undo button fixed**
   Now Undo button is working properly. When composing a new message, if you click it the mail is not sent.
   Bug
 


**IRIS-4218: Calendar user name avatar string**
   In Calendar, the initials of the name are now used to generate the avatar when an image is not provided.
   Bug
 


**IRIS-4207: Calendar’s access share for main calendar**
   Added feature for copy main calendar links.
   Bug
 


**IRIS-4183: Badges language in message and conversation are translated**
   The badges in the messages and conversation lists are now translated.
   Bug
 


**IRIS-4177: Improved calendar sharin**
   This is an improvement for calendar sharing; share the calendar and then click edit properties; make no changes and then click OK; calendar sharing will not be interrupted
   Bug
 


**IRIS-4064: Read/unread in custom and shared folders**
   It is now possible to mark as read/unread the emails in custom folders and shared folders.
   Bug
 


**IRIS-4058: Trash and revoked shared calendars not listed while creating new appointment**
   Now Trash and revoked shared calendars are not showing in drop down list while creating new appointment.
   Bug
 


**IRIS-4050: Email in the Junk folder can be deleted permanently**
   Now, emails in the "Junk" folder can be deleted or permanently deleted, with both options available.
   Bug
 


**IRIS-3972: Read messages from search results**
   The read new messages from search results function is now operational.
   Bug
 


**IRIS-3928: Delete draft and save draft model popup**
   While replying to a search message and closing it without taking any action, now a model "delete draft" and "save draft" popup shows on the board.
   Bug
 


**IRIS-3893: Improved actions menu for multiple selection**
   The actions menu for multiple selections has been improved, and there are no longer any missing actions for folders when using multiple selections.
   Bug
 


**IRIS-3721: Empty trash in Calendar functional**
   Now on clicking on Trash in Calendar and selecting empty trash then the Trash folder get empty and the popup is closed.
   Bug
 


**IRIS-3639: Calendar's icon and description**
   Now when the Calendar's menu is collapsed, the calendar's icon and its info/description are shown when the cursor is over the icon.
   Bug
 


**IRIS-3469: Email conversation threads ordered**
   The email conversation threads are now ordered with the most current email at the top.
   Bug
 


**IRIS-3306: Hovering over the message should display icons correctly**
   While hovering over a message,  the three icons of a message (‘mark as read’, ‘flag’ and ‘delete’) are now shown.
When the message is selected and opened in the displayer, it now shows additional icons (‘reply’, ‘reply all’ and ‘forward’). When another list is selected, on hovering over the previous message the icons 'mark as read’, ‘flag’ and ‘delete’ are shown.
   Bug
 


**FILES-671: Large files upload**
   Fixed a bug that caused the upload of files larger than 200Mb to fail.
   Bug
 


**FILES-514: Unselected files cleaned in dark mode**
   Removed the question mark from the unselected files in Files.
   Bug
 


**DOCS-186: Files and Docs multi instances bugfix**
   Fixed a bug which caused problems when multiple users contemporarily modify a Docs document in an multi server environment with more than one instance of `carbonio-files`, `carbonio-docs-editor` and `carbonio-docs-connector`.
   Bug
 


**COR-893: Subscription removed after revoke token**
   Fixed a bug that caused the getLicenseInfo to return a valid subscription even after the admin revoked the token.
   Bug
 


**CO-693: Rewrite errors removed on restart**
   Removed misleading errors from the Carbonio logs on services restart.
   Bug
 


**CO-690: Shared mailbox  enhanced**
   When sending from shared mailboxes, sent emails are now marked as read.
   Bug
 


**CO-686: Carbonio-bootstrap fix for service-discover service**
   Service-discover service is no longer removed when the `carbonio-bootstrap` command is run multiple times.
   Bug
 


**CO-655: Unattended carbonio-bootstrap fixed**
   The carbonio-bootstrap has been refatored to avoid creating multiple HAM/SPAM/VIRUS accounts and setting them in the global config when running unattended.
   Bug
 


**AC-690: Bucket creation modal fixed**
   The bucket creation modal has been fixed in the admin console.
   Bug
 


**AC-578: Quota Value inherited from COS**
   Now the quota value in the account settings reflects the one configured at the COS level.
   Bug
 


**AC-568:  Creating a local volume enhanced**
   Creating a local volume at the second stage of the wizard no longer allows the admin to change the volume name.
   Bug
 


**AC-554: Description filed removed from mailing list creation**
   Now description field is removed from mailing list creation so you will not get a blank description filed when creating a mailing list.
   Bug
 


**AC-509: Signature format fixed**
   Now the signature shows the correct format as updated from the account settings in the admin panel.
   Bug
 


**AC-434: Execute rights in public folder removed**
   Execution rights have been removed from the public folder in path `/opt/zextras/web/login/assets` to avoid any admin files being executed from this location.
   Bug

