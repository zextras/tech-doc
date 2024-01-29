.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Changelog - Release 24.1.0
===================================

Release Date: January 30th, 2024

New Features List
-----------------

**AC-533: Admin can manage domain disclaimer**
   Now the admin can manage a Domain Disclaimer, the option to have different disclaimers for internal and external recipients.

**AC-795: Revealed Distribution List Owner Settings in Admin UI**
   Now the mailing list owner setting is visible in the Distribution List field within the admin panel.

**AC-809: Admin can customize items per page**
   Administrators now have the capability to specify the number of "items per page" they wish to display.

**AC-851: Enhanced whitelabel settings for background image ratios**
   The white-label settings now honour the background image ratio. Administrators can find the specifications in the Background for the Login Page section: “The image must possess a minimum resolution of 1280x1080, a 16:9 ratio, and a size less than 800KB"

**AC-854: Fixed Invalid username creation from name field special characters**
   The Email ID creation process has been enhanced to disable automatic email creation when the combination of the first name and last name includes any special character. This improvement addresses the issue of special characters in the Surname and Name fields, preventing the automatic generation of an email username with invalid characters not accepted by Carbonio during submission.

**AC-855: Enhanced mailbox quota table with color-coded assignments**
   The Mailbox quota table is now easier to identify with color-coded distinctions. Accounts exceeding >70% of Mail Quota are displayed in Yellow, while those exceeding =>90% are highlighted in Red.

**AC-876: User can request token for forget password web UI**
   This update empowers users to autonomously request a token for webmail access in the event of a forgotten password. The admin now has the capability to globally or selectively disable this feature, either for the entire system or specific domains. Notably, the forgotten password feature is designed to update the LOCAL (LDAP) password and is not intended for external LDAP/AD or application credentials. Users can leverage this by configuring the OTP (One-Time Password).

**AC-879: Update interface label to "User"**
   The General tab now displays "User" instead of "Username" improving clarity and user experience.

**AC-892: MTA Queues usability improved**
   Enhances the usability of the MTA queue interface by removing redundant details and improving flow.

**AC-897: Enhanced mail queue supports bulk actions**
   The Mail Queue feature has been significantly improved, allowing administrators to effortlessly select and perform bulk actions on multiple messages across various queue spools. Whether it's deleting, re-queuing, holding, releasing, or flushing, this upgrade empowers administrators with a robust and efficient tool for managing their mail queue on MTA Servers.

**AC-903: Reorganization of Admin panel backup settings menu**
   The Servers List in the Backup Settings menu of the  Admin Panel has been relocated to the top of the Global Server Settings list for improved organization.

**AC-906: Enhanced virtualHost validation for FQDN**
   The virtualHost validation has been improved to allow only Fully Qualified Domain Names (FQDN). An FQDN, such as MAIL.DOMAIN.TLD is now required for virtualHost, ensuring more accurate domain identification.

**AC-909: DomainAdmin can configure recovery address**
   DomainAdmins can now manage user recovery email, set recovery email, and control its verification status in the "Security" tab.

**CO-802: "Keep" policy removed from folder retention**
   The "keep" policy is now removed, ensuring efficient item removal with the enhanced "purge" policy. Improved user experience and system clarity.

**CO-865: Set Default zimbraHttpDebugHandlerEnabled to False**
   The default parameter for zimbraHttpDebugHandlerEnabled is now set to false. The boolean parameter has been updated from true to false.

**CO-893: File upload quota validation enhanced**
   Now the file upload API has been enhanced to validate whether the user's current quota is reached. user now allows successful uploads within the specified quota limits while rejecting uploads that surpass the user's maximum quota.

**CO-922: Refine forgot password Email Message**
   Update the Forgotten Password email message to clearly indicate a request for a temporary authentication code, not a password reset.

**CO-923: Health endpoint implemented in Mailbox**
   The health endpoint is added to the Mailbox service, enhancing health checks and providing better control over its liveliness and readiness.

**CO-929: Milter startup logging error fix**
   Resolves the issue where the milter startup logs report an error about being unable to locate the appender "MILTER" for the logger config "root" in /opt/zextras/log/milter.out.

**CO-930: YUICompressor Library removed from mailbox**
   Optimized Logging: mailbox.log no longer contains unnecessary entries from the unused YUICompressor library, enhancing efficiency.

**CO-931: Db-java - Cleanup Unused Methods and Classes**
   The proposed change involves cleaning up unused methods and classes in the Db-java module, specifically targeting the DbPool class. This cleanup enhances code clarity and simplifies the implementation of the Healthcheck feature.

**COR-1020:  Enhanced notification access for delegated admin**
   Delegated admins now have comprehensive access to notifications through both email and the Admin UI, addressing and resolving the issue where notifications were previously limited to email only. This improvement enhances the overall delegated admin experience on the platform.

**IRIS-4513: Distribution List owner can manage DL**
   The owner of the Distribution List can now control the DL directly from the ContactInput chip using the TO field.

**IRIS-4765: Meeting Room availability visibility enhancement**
   Users can now easily identify the availability of Meeting Rooms from the dropdown menu. Unavailable Meeting Rooms display an alert icon and a warning message, allowing users to make informed selections.

**IRIS-4768: Equipment availability display improved**
   The update enables users to identify Equipment availability in the dropdown, with a visual indicator (alert icon) and a warning under the input. Users can still select unavailable Equipment. The display is validated across various scenarios, including the appointment displayer and edit mode.

**IRIS-4887: Folder sorting and filtering improved**
   Users now have the ability to customize email sorting by Subject, Size, Date, Attachment, Flag, and Important, and view Unread messages, providing a tailored approach to email management. Additionally, users can filter only unread emails within the current folder, streamlining their workflow.

**IRIS-4975:  Change "Edit distribution list" action icon on contactInput chip**
   Two unique icons have been introduced for "Edit email" and "Edit DL" actions on the ContactInput chip, exclusively visible to the DL owner. This change addresses prior confusion and enhances the user experience.

*****

Bugfix List
-----------

**AC-882: Improved alias management with uniqueness check in admin panel**
   Experience the latest enhancement in the Admin Panel, featuring a uniqueness check that prevents the assignment of the same alias to two different mailnames. This improvement ensures data integrity and avoids conflicts by returning an error when attempting duplicate alias assignments.

**CO-948: Resolve ISP license renewal end date issue**
   The ISP License is now fixed and the ISP license end date is properly populated into the Carbonio system.

**CO-953: Fixed NullPointerException in doUndelete operation**
   Previously, the doUndelete operation encountered a NullPointerException and hung when carbonioNotificationRecipients at the domain level configuration was empty. The proposed solution focuses on managing this exception, allowing the operation to proceed even with an empty value. This ensures that the doUndelete command works seamlessly.

**COR-820: MySQLcheck error fix in zmdbintegrityreport**
   The update addresses a MySQLcheck error in zmdbintegrityreport by performing necessary clean-ups in the MySQL datadir, specifically removing empty directories. Validate the zmdbintegrityreport script after the update to ensure it runs without MySQLcheck errors and successfully removes empty directories.

**COR-979: Frequency of trusted IP logging reduced**
   The mailbox log has been optimized to eliminate redundant reporting of 'trusted IP' entries every five seconds. This enhancement ensures efficient logging by capturing trusted IP entries only during mailbox reload, reducing unnecessary log entries.

**COR-992: Refactor ISP license management**
   Now the refactored code to manage ISP licenses correctly as ISP, ensuring they are distinct from purchased licenses in Carbonio.

**IN-644: Keytool execution failure fix in carbonio-core post install phase**
   Resolves the keytool execution failure issue during the carbonio-core post-install scriptlets, ensuring the proper functioning of the product. The fix addresses a misaligned syntax causing the Illegal option error in the keytool -list command.

**IRIS-4258: Unified options naming for Calendar editing**
   Now 'Edit calendar properties' is selected for unified calendar editing option names.

**IRIS-4534: Enhanced 'Delete All' UI Functionality**
    Improvements made to the UI behavior when selecting and deleting/moving all first mail elements. The system now properly loads the next 100 elements without leaving the column blank, provided there are still mail elements in the folder. Additionally, a notification is triggered when clicking the 'Select All' button, indicating that all visible items have been selected.

**IRIS-4593: Cancellation email for shared calendar improved**
   The shared calendar now supports proper deletion of individual instances within a recurring appointment. This enhancement includes seamless handling of cancellation messages and modifications to calendar events on the recipient's side.

**IRIS-4721: "Mark as Important" Option in Carbonio Mail Composing enhanced**
   Now the user can mark it as important, Upon sending mail, this action triggers the email to be received on the other end with an added priority designation. High-priority mail received with "RED up Arrow" in the inbox of the recipient.

**IRIS-4760: Fixed Incorrect Signature Issue on Reply/Forward**
   The issue of incorrect signatures during Reply and Forward actions is now resolved. Previously, users encountered a problem where the default account signature was incorrectly applied despite having specific signatures configured for aliases. The diligent efforts of the team have successfully addressed this issue

**IRIS-4880: User allowed multiple Calendar shares**
   Users can now add and retain multiple share recipients for calendars. Previously, users were limited to keeping only the latest share recipients.

**IRIS-4918: Public sharing of a calendar function**
   The public sharing of a calendar now  works

**IRIS-4992:  Improved scrolling in conversation mode for long emails**
   Previously, scrolling through long emails in conversation mode caused unexpected jumps to the top. Now, scrolling behaves as expected, and emails stay in place during navigation.

**IRIS-5009: Maintain sorting order upon folder change**
   The previous issue, where emails appeared unsorted after changing folders and returning to the original folder in Carbonio Web Mail, has been successfully addressed. Users can now expect messages to consistently retain their sorting order, particularly when changing the viewing mode and sorting by date.

**MOB-422: Calendar invite reply template fixed on IOS**
    Resolve issues related to the template used for replying to calendar invites in Carbonio iOS. This fix aims to improve the accuracy and functionality of calendar invite replies, ensuring a more seamless and reliable user experience on the iOS platform.

*****

End of changelog
