.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Changelog - Release 23.12.0
====================================

Release Date: December 27th, 2023

NEW FEATURES LIST
-----------------

**AC-317: Done Operations Display in Carbonio Admin**
   The Carbonio Web Admin interface now features enhanced functionality for querying and managing completed operations within the Carbonio Advanced Module through the Operations Done. This update ensures administrators have a comprehensive view of all completed tasks.

.. 


**AC-508: Improved visibility for failed bucket check message**
   The visibility and content of failure messages during bucket creation have been enhanced in the Carbonio Admin Panel. Admins will now receive clearer and more informative messages about the reasons behind the failure and actionable steps to address the issues.

.. 


**AC-695: Quarantine management feature in admin UI**
   This is a new improvement in the Carbonio admin panel where the global admin can see a new feature of quarantine in the global menu of domains tab where the global admin can create a quarantine global quarantine account and their retention period of holding infected emails with the virus and the global admin can see the list of infected emails/messages as well as open such infected email and do the activity related to the particular message like remove the message, deliver a message, remove the attachment, show original and many more

.. 


**AC-733: Domain specific login/logout url Input field**
   Experience heightened control with our latest update! We've added a crucial input field to the admin interface, empowering users to customize login and logout experiences for a specific domain. This improvement seamlessly integrates with our white label feature, users can now define a redirect URL login/logout, enhancing the overall user and admin experience

.. 


**AC-771: Quarantine management feature update in admin panel**
   Explore the latest enhancement in the Carbonio admin panel, empowering global admins to efficiently manage quarantine accounts and activities. This update enables the creation of global quarantine accounts, setting retention periods for infected emails, and performing various actions on affected messages, offering enhanced control and security.
   
.. 


**AC-819: Error prevention dialog for unsaved account delegates**
   The Account Advanced Edit now triggers an error prevention dialog when attempting to exit without saving changes made to Account Delegates.
   
.. 


**AC-836: Mailbox quota table enhanced**
   An enhancement has been made to the Mailbox Quota table under the 'Mails' section. A new column (MB) has been added to provide improved visibility and management capabilities.
   
.. 


**AC-837: Enhanced CSV mailbox quota with flexible decimal rounding**
   Experience improved control over mailbox quotas in CSV format. Now, easily round to one digit or no digit after the decimal point in the Mails column for greater flexibility.
   
.. 


**AC-838: Enhanced mailbox quota table per domain selection**
   The mailbox quota table has been refined to display only the selected domain's content. Other domain mailboxes are no longer shown in the table, ensuring a more focused and accurate representation.
   
.. 


**AC-839: Enhanced input validation for Domain General Settings COS**
   In the Domain's General Settings COS section, input validation has been improved to allow only numbers and '-' (hyphen), ensuring a more reliable and accurate configuration.
   
.. 


**AC-840: Enhanced COS list visibility in COS tab**
   The COS lists in the COS tab are now visible. previously, the list was not displayed.
   
.. 


**AC-842: COS selection in domain creation**
   Administrators now have the option to select a Class of Service (COS) in the Domain creation panel. This enhancement enables direct assignment of COS during the creation of new domains, streamlining the setup process.
   
.. 


**AC-843: Default setting: Disabled 'User will change password'**
   Now, during new user creation, the 'User will change password on next login' feature is disabled by default for streamlined domain and account management.
   
.. 


**AC-849: Improved security for Carbonio admin console**
   Enhanced security features in the admin console now safeguard local browser cookies, ensuring secure handling of closed and reopened tabs with Gobel details, and preventing unauthorized access to URL details in the backend.
   
.. 


**AC-850: Enhanced control for adding new extensions in MTA**
   Improved the control for administrators to add blocked extensions in the Postfix (MTA) Inbound Flow & Security. The system now rejects incorrect inputs, such as punctuation marks (!@#$%^&*), ensuring a more secure configuration.
   
.. 


**AC-874: Visual enhancement for exceeded quota indicator**
   The Mailbox Quota table in Admin UI has undergone enhancements to visually highlight mailboxes that exceed their quota limits. This improvement includes displaying the quota percentage in red for easy identification when a mailbox surpasses the set limit.
   
.. 


**AC-877: Mailing Lists renamed to Distribution Lists**
   In the Carbonio Web Admin interface, the term 'Mailing Lists' under the Domain Management section has been changed to 'Distribution Lists', reflecting a more accurate description of its functionality.
   
.. 


**AC-884: Accurate Compression Status in Centralized Volume**
   Experience improved accuracy as the Centralized Volume in AdminUI now displays the correct compression status. Stay informed and efficiently manage your data with this enhancement.
   
.. 


**AC-891: MTA DNS Blacklist Threshold Enhancement**
   Improve MTA settings by transforming 'DNS Blacklist Threshold' from a selector to an input field for enhanced customization.
   
.. 


**AC-898: Minor adjustments in whitelabel settings**
   Customize login page background and favicon with image URLs. Login page image: JPG/PNG, min 1280x720, 16:9, <800KB. Favicon: ICO, 32x32 pixels.
   
.. 


**CO-851: Improved address management for functional accounts**
   Users can now save functional account addresses in the 'Emailed Contacts' book, with Autocomplete seamlessly incorporating local and shared contacts when 'Include Address in Shared Contacts' is selected.
   
.. 


**CO-870: Auth healthcheck API implementation**
   The Carbonio now features an enhanced Auth Healthcheck API, streamlining response times and eliminating the need for consensus checks on other nodes, This enhancement aims to reduce response times, particularly in scenarios where one or more nodes are down, and eliminates the necessity to increase timeout values
   
.. 


**CO-873: New consul token for carbonio-advanced**
   The software now deploys a new Consul token during the installation of Carbonio Advanced. This token is located at `/etc/carbonio/mailbox/service-discover/token` and used by the application.
   
.. 


**FILES-729: Creating public access links for folders**
   This feature allows the creation of public access links for folders. The functionality is designed to align with its intended purpose. For instance, the link is accessible when active but becomes invalid upon expiration or revocation. Additionally, only users with edit access have the capability to create the link, restricting this action for others.
   
.. 


**FILES-733: Public folder link access**
   In this version, a new feature has been introduced to facilitate access to public folders via links. Enabling the public folder link allows anyone with the link to access the folder's content. An error message will be displayed if the link expires, is revoked, or does not exist.
   
.. 


**FILES-736: Public folder view and interaction**
   Public folder view and interaction now seamlessly adhere to authorized permission policies. The current public folder link policy ensures that anyone with the public link can effortlessly view and download the folder's content. By default, a read-only permission policy is set, preventing any upload, edit, delete, or modification of the folder's content by individuals other than the folder owner
   
.. 


**IRIS-3508: Enhanced Calendar header button position**
   The calendar's header button positioning has been improved, ensuring adequate space between buttons. The Week's selection and Today's buttons no longer overlap, providing a better visual experience.
   
.. 


**IRIS-4450: Exploding distribution lists in email composition**
   Users can now recognize and expand distribution lists while composing emails, providing the ability to review and modify recipients before sending for improved clarity and control.
   
.. 


**IRIS-4537: Recognize and explode distribution lists in Calendar**
   Users now have the ability to seamlessly recognize and explode distribution lists within the calendars module, improving efficiency and user experience.
   
.. 


**IRIS-4763: User can select equipment in appointments**
   Users can now select equipment during appointment creation, ensuring proper display in the summary view, displayer, and editor during edit actions.
   
.. 


**IRIS-4766: Equipment selection in appointments**
   Users can now select equipment during appointment creation, ensuring proper display in summary view, displayer, and editor during edit actions.
   
.. 


**IRIS-4842: Run Filter on existing Email Folders**
   Users now have the ability to apply filters to emails within existing folders, providing enhanced control and organization of their mailbox content.
   
.. 


**IRIS-4889: Enhanced editor performance optimization**
   Now the editor's performance has improved by utilizing useMemo in editor hooks and reorganizing logic into sub-components. These changes minimize re-rendering, resulting in improved efficiency for the editor.
 
   
.. 


**IRIS-4894: Enhanced contact search in shared account address books**
   Experience enhanced contact search capabilities within shared account address books. In the mail editor, selecting a sender identity linked to a shared account now enables auto-complete in the to/cc/bcc fields, considering contacts within that shared account's address books.
   
.. 

*****

BUGFIX LIST
-----------


**AC-762: Admin console backup progress notifications**
   Upon initiating a backup using the Admin console backup button, the progress of the backup should now be displayed through both the dashboard notifications section and emails.
   
.. 


**AC-826: Dashboard notification table enhancement**
   The dashboard notification table now displays notifications for all servers in a multi-server environment, addressing the previous limitation of showing only the latest added server notifications.
   
.. 


**AC-830: Session management in account details**
   The account details section now supports filtering and ending of individual user sessions. This enhancement empowers administrators to more effectively manage user sessions by providing the ability to filter through sessions and end them as needed.
   
.. 


**AC-832: COS name visibility in Domain Settings**
   the Class of Service (COS) name is now visible in the Domain General Settings. 
   
.. 


**AC-856: Whitelabel settings  background image ratio enhanced**
   The white-label settings now honour the background image ratio.  Administrators can find the specifications in the Background for the Login Page section: "The image must possess a minimum resolution of 1280x720, a 16:9 ratio, and a size less than 800KB.
   
.. 


**AC-859: MTA Outbound flow configuration in admin UI**
   Admins gain enhanced control as text fields in the 'Outbound Flow' section are now editable, enabling easy customization of global settings, including the relay host.
   
.. 


**AC-871: Subdomain validation for distribution lists**
   The software has been updated to allow proper validation of subdomains containing dashes (-) when adding members to distribution lists. Admins can now enter members with subdomains in the format "subdomain.example-com.com" without encountering validation errors.
   
.. 


**AC-885: Corrected attribute update for antivirus**
   This fix ensures that adding, changing, and removing MTA 'Antivirus & Spam' configurations in the Carbonio Web Admin interface correctly updates the attributes. It addresses the previous issue where some updates were handled improperly.
   
.. 


**AC-894: Admin can add multiple virtualHosts**
   Admins can now easily add multiple VirtualHosts to the domain using the admin console for increased customization and flexibility.
   
.. 


**BCK-695: setBackupVolume cache fixed**
   Fixed a bug that caused the `setBackupVolume` command not to clean its cache causing a copy of the blobs to be still saved in the metadata path. Now the blobs are only saved in the proper volume.
   
.. 


**CO-860: Calendar Free/Busy fixed for MacOS**
   
esolved a bug that previously prevented the Free/Busy feature from working in the MacOS Calendar. Availability is now correctly shown when adding attendees to an appointment.
   
.. 


**CO-899: Upgrade Issue Fixed from Version 23.11 to 23.12**
   The upgrade error from version 23.11 to 23.12 has been fixed. The issue stemmed from a conflict between the carbonio-common-appserver-db and carbonio-appserver-db packages, requiring the removal of the former before installing the latter. Developers opted for the use of 'apt full-upgrade' and 'dnf distro-sync' for the upgrade process.
   
.. 


**CO-901: Enhanced virtual host response headers configuration**
   Improved the handling of virtual host response headers by updating the Proxy Generator "libexec/zmproxyconfgen" to fetch information from the Domain configuration instead of the Global configuration.
   
.. 


**CO-913: AppServer upgrade dependency error fixed**
   Resolved conflict between carbonio-common-appserver-db and carbonio-appserver-db during the upgrade from 23.11 to 23.12. Developers used apt full-upgrade and dnf distro-sync for a seamless resolution.
   
.. 


**CO-932: Backup on external storaged fixed**
   Added the `volumeRootPath` attribute in the server configuration which was missing. Now the backup on external storage works properly.
   
.. 


**COR-972: Delegated admin fine-tune the Public service settings**
   Delegated admins now have the authority to modify PublicServiceHostname, protocol, and port configurations.
   
.. 


**COR-1012: Enhanced max manageable accounts for a domain**
    fixed for the "Max Manageable Accounts for a Domain" setting, now allowing zero "0" for unlimited accounts.
   
.. 


**COR-1019: Corrected scope for notification sending**
   Previously, the notification emails were sent to the Global Admin instead of the Delegated Domain Admin when carbonioNotificationRecipients is set to delegate admin. This issue is now resolved, and notifications are correctly sent to the delegated admin as intended.
   
.. 


**IRIS-3420: Improved folder selection after interrupted drag**
   Users now can click on the target folder after cancelling a drag-and-drop operation with the ESC key.
   
.. 


**IRIS-3728: Calendar appointment description display fixed**
   This update ensures accurate display of all details for received appointments in the Calendar event
   
.. 


**IRIS-3733: Enhancement for 'Reply All' in shared accounts**
   The 'Reply All' function in a shared account has been updated to automatically populate the recipient list in the editor with the original email's sender and recipients, excluding the sender's own address. In the previous version, the 'Reply All' function did include the sender in the recipient list.
   
.. 


**IRIS-4682: Flexible signature editing in settings**
   This enhancement allows users to conveniently modify their email signatures from the 'Signatures' section in Settings. Users can now update existing signatures, add new ones, and easily revert back to previous signatures, providing a flexible and user-friendly experience.
   
.. 


**IRIS-4706: Fixed Radio component in custom modal**
   The Calendar's radio component in the Custom modal now correctly selects options, addressing the previous problem of erratic behaviour where selecting one radio affected another
   
.. 


**IRIS-4753: Improved custom recurring appointments checks**
   Enhanced Calendar radio component in Custom modal for smoother user experience.
   
.. 


**IRIS-4802: Mail editor format selection fixed**
   Previously, the mail editor was disregarding the selected text format and consistently used rich text. This issue has been fixed, and now the mail editor correctly adheres to the chosen text format.
   
.. 


**IRIS-4836: Enhanced Reply/Forward for undefined subject**
   This enhancement improves the system's behaviour, allowing users to reply to or forward emails even when the subject field is undefined or missing. The system will automatically assign a blank subject to such emails, preventing errors during these actions.
   
.. 


**IRIS-4838:  Modify appointments displays accurate dates**
    The modification of appointments now accurately displays start and end dates, particularly in the case of series with all-day events lasting more than one day. The editor correctly reflects the intended dates, addressing the previous issue where it erroneously showed the current time
   
.. 


**IRIS-4851: Email scrolling regression bug fixed**
   This update addresses an issue wherein scrolling through lengthy emails in the Mail module for about a minute would unexpectedly reset the view to the top, disrupting seamless and continuous reading.
   
.. 


**IRIS-4857: Improved folder selector includes Trash**
   The folder selector for the 'Move into folder' action in filters now includes the Trash folder. Easily choose the Trash folder.
   
.. 


**IRIS-4891: Ensuring event organizer configuration**
   Event organizer now configured accurately, enabling successful creation and editing of new appointments in both shared and personal calendars.
   
.. 


**IRIS-4927: Automatic removal of appointments for broken Calendars**
   Broken calendars, upon removal from the UI, trigger the automatic removal of all associated appointments. This ensures a seamless and accurate user experience in managing calendar data
   
.. 


**PS-467: HSM policy scheduling enhancement**
   HSM policies now function seamlessly according to the configured scheduler in Linux. Messages are successfully moving from one store to another store as per the scheduled cron job 'carbonio powerstore doMoveBlobs start'.
   
.. 


**PS-472: Unset Powerstore move scheduler improved**
   The powerstoreMoveScheduler has now been enhanced at the server level, and it reverts to the default value upon being unset.
   
.. 


**SHELL-173: Localized unsaved changes modal**
   The unsaved changes modal, including its title, buttons, and tooltip, now correctly translates based on the user's selected language in the UI settings.
   
.. 


**TEAMS-4124:  Recording functionality restored**
   The group meeting recording problem is now resolved by reinstalling the latest carbonio-videoserver and recorder packages. Now, recordings work seamlessly, saving correctly in Files.
   
.. 

*****

End of of changelog
