
Carbonio Changelog - Release 24.5.0
===================================

Release Date: May 22nd, 2024

New Features List
-----------------

**AC-785: Enhanced Content Visibility to Carbonio Webmail's Responsive Window Support**
   Experience improved content visibility on smaller screens with the latest update to Carbonio webmail. Our enhanced code now supports responsive windows, ensuring seamless readability and navigation across devices of all sizes


**AC-899: Introducing the Carbonio Mobile App popup generate in login screen**
   Now Carbonio webmail shows a popup of a modal on the login screen on the mobile device about mobile (Android/iOS) applications.


**AC-900: Manage global active-sync settings**
   Global Admins can now enable/disable the DoS filter and purge the Active Sync table. This allows for better management of Active Sync settings at a global level.


**AC-904: Admin update MTA server attributes**
   Admins can now manage specific MTA attributes for each server, allowing for specialization.


**AC-913: Auto cache flush on Global admin domain updates**
   The system now automatically flushes the cache following domain updates by the Global Admin, ensuring smooth transitions to the latest version.


**AC-914: Introduced autometically cache flushing system of mailbox objects**
   Introduced a game-changing feature an automatic cache flush system that ensures administrators see immediate reflections of updated values in their browsers. This innovative system seamlessly integrates with Carbonio's attribute update mechanism, enhancing the user experience and streamlining workflow efficiency


**AC-922: Browser Compatibility Detection in Carbonio to enhancing User Experience**
   The latest update to Carbonio introduces a powerful functionality to the ability to detect and distinguish between full and limited browser support during user and admin login sessions. This enhancement ensures a smoother user experience by providing tailored interactions based on browser capabilities


**AC-925: Update server MTA attributes management**
   Admins can now manage specific attributes related to the MTA for each server, enabling specialization.


**AC-935: Removed password option in resource creation**
   While creating a resource account now "Password" option no longer be displayed, aligning with the intended behaviour of resource accounts. This ensures clarity that resource accounts are not standard accounts with passwords by default.


**AC-940: Streamlined Notification Preferences for New Mail in Carbonio Admin**
   This update simplifies notification settings within Carbonio admin user preferences by removing the redundant double enable notification for new mail. Now, users have a single notification option available in their preferences, enhancing user experience and reducing confusion


**AC-941: Implemented LDAP\:// as static non-editable value**
   This update ensures that LDAP\:// is added as a static non-editable value in the Distribution Lists URL field. Users will be prevented from typing LDAP, triggering an error prompt, while the full string, including LDAP\:///, will be utilized for SOAP calls during connection checks or saves.


**AC-942: Updateed label from "Hide in GAL" to "Hidden in GAL"**
   The label for account details will be changed from "Hide in GAL" to "Hidden in GAL" to match the distribution list label.


**AC-943: Updated Terminology in Carbonio Admin Panel for Resource Management**
   The latest update to the Carbonio admin panel introduces revised terminology for resource management. The "Devices" label has been replaced with "Equipment," while "Location" now appears as "Meeting Room" within the interface.


**AC-951: Domain Menus: Interchanged "Details" and "Manage" Positions**
   In the domain menus of our system, we have interchanged the positions of "Details" and "Manage" options. Previously, "Manage" was situated below, but now it has been moved up, while "Details" has been shifted downwards. This adjustment aims to enhance user accessibility and streamline navigation


**AC-952: Reposition MTA below COS on primary toolbar**
   Now the MTA is repositioned below COS on the primary toolbar.


**AC-953: Enhanced LoginUI for Carbonio Webmail to Implementing Common Password Rules for First-time Users**
   Enhance the Carbonio Webmail LoginUI to accommodate common password rules for users prompted to change their password during their initial login. This feature ensures secure access by guiding users to create strong passwords while adhering to established security standards. Improve user experience and bolster system security with streamlined password management.


**AC-960: Improved Padding for Carbonio Admin Panel MTA Section Using CSS"**
   Enhance layout padding issues within the MTA (Mail Transfer Agent) section of the Carbonio admin panel by tuning  CSS (Cascading Style Sheets) modifications. By adjusting the padding settings


**AC-961: Update "Included in backup" field**
   The "Included in backup" field in account details has been modified to improve usability and clarity.


**AC-965: Hide "Global Admin" flag for Non-Global admins**
   The "Global Admin" flag should be hidden from user details if the user is not a Global Admin. This change ensures a cleaner interface and prevents confusion for delegated users.


**AC-966: Rectification of Duplicate Label Name "What's a GAL" in Carbonio Admin Panel**
   In the Carbonio admin panel, a recent update addressed an issue where the label name "What's a GAL" was found to be duplicated while creating a domain. This rectification ensures smoother navigation and clarity within the admin interface


**AC-967: Enhanced quota sizes and threshold label**
   Now the admin can set mailbox quota sizes and threshold label


**AC-970: Label updatedof  Button for Certificate Verification in Virtual Host Configuration**
   In the Virtual Host configuration settings of the Carbonio Admin Panel, the "upload and verify certificate" button has been replaced with a new "Verify Certificate" option.


**AC-972: Enhancement in disabling "Create COS or Domain" Option for Delegated Domain Admins in Carbonio Admin Panel**
   In the Carbonio admin panel, a security enhancement has been implemented to disable the "Create COS or Domain" option for delegated domain administrators


**AC-976: Delegated account toggle behavior update**
    The behaviour of the global admin toggle in delegated admin accounts has been updated to reflect the specified scenarios. This includes visibility and functionality adjustments for different account types.


**AC-1002: Enhancement to Update Label from 'Who’s in this list' to 'This list is included in**
   This enhancement updates the label within the DL of the admin interface from "Who’s in this list" to "This list is included in." This change aims to provide clearer and more intuitive navigation for users, 


**AUTH-542: User can specify and confirm a recovery addres**
   Now user can specify and confirm the recovery address.


**CO-319: Enhanced cleanup of residual files by service-discover**
   Improved removal of residual files generated by service-discover during service package uninstallation in Carbonio-ce, ensuring smoother system reconfiguration and reinstallation processes.


**CO-921: Enhanced Service Health Check for Carbonio-Storage**
   Improvements to Carbonio service health check feature in Carbonio-Storage, aimed at ensuring a more reliable and seamless experience for Monitoring admin. The enhanced service health check will provide real-time monitoring and diagnostics to promptly identify and address any potential issues affecting the performance or availability of Carbonio-Storage. 


**CO-954: Enhance account quota information considering CoS->Account hierarchy**
   APIs now handle CoS->Account hierarchy for accurate quota retrieval.


**CO-981: Ensuring Unaffected Carbonio File Uploads Despite Consul DNS Removal from PowerStoreClient**
   Important update regarding our file upload functionality and the recent removal of Consul DNS resolve from PowerStoreClient. Despite this change, we want to assure you that file uploads on Carbonio remain unaffected


**CO-982: Improved autocomplete ordering**
   Autocomplete now prioritizes matches from preferred source accounts, sorts matches from other accounts based on ranking and alphabetically, and gracefully handles failures during retrieval from remote accounts.


**CO-994: Infinite Retention Backup Feature for Legal Data Recovery in Carbonio"**
   Implementing a new feature in Carbonio to enable infinite retention backup for user accounts. With this feature, administrators gain the ability to securely store user data indefinitely, facilitating legal data recovery processes when necessary. Configurable settings to designate specific user accounts for infinite retention backup


**CO-1008: Update Content-Security-Policy to include mediapipe NPM package**
   This update modifies the default Content-Security-Policy (CSP) of Carbonio to allow loading the Mediapipe NPM package from cdn.jsdelivr.net. This change is necessary for enabling Virtual Background functionality.


**CO-1011: Video Call Recording in Carbonio Webmail Unaffected by Removal of Consul DNS Resolve from AppToken SDK**
   Ensuring the continued integrity and functionality of video call recording within Carbonio webmail, even in scenarios where Consul DNS resolution is removed from the AppToken SDK. The goal is to develop a robust recording mechanism that remains unaffected by changes or updates to underlying DNS resolution protocols


**CO-1014: Implement analytics tracking Opt-out for admin and user**
   This update enables Carbonio to collect analytics on user interactions. Admins will have the option to opt-out of data collection at the account level, with the potential for future enhancements allowing users to opt-out as well.


**CO-1017: Remove delegation settings versioning**
   The Delegation Settings versioning mechanism, previously tracked by the AdminUpgradeService component, is no longer necessary due to the introduction of the initDomainForDelegation command, which deprecated and removed the old DelegationSettings functionality. Therefore, the related code is being removed to streamline the system and eliminate deprecated components


**CO-1035: Automatic start of carbonio-avdb-updater.service**
   The service "carbonio-avdb-updater.service" will now start automatically after installation, ensuring seamless integration with Ansible scenarios. This change ensures that the service is available without the need for manual intervention.


**CO-1041: Removed unused Log4j 1.2.x dependency**
   The unused Log4j 1.2.x dependency now removed from the project pom file resolves a security alert and ensures the project's dependencies are up-to-date.


**CO-1047: FullAutoComplete API Response Enhanced**
    FullAutoComplete API now delivers JSON responses with auto-completed ranking based on recently used contacts. For delegated accounts, the current user's contacts are prioritized at the top during composition, followed by others in later ranks.


**FILES-761: Quota info on Files module**
   Now the user can see the quota information on the Files module.


**FILES-767:  Quota failure handling in files upload**
   Users will be notified of upload failures due to quota constraints with a specific error code (422 Unprocessable Content) and a banner displayed within the upload view. The banner will disappear when no uploads fail due to quota. Additionally, error indicators will be present in other views and modules. The banner will not be manually closable.


**FILES-769: Enable quota update in Files**
   Users can now manually update the quota information displayed in the Files module to reflect changes made when adding or removing files, providing them with accurate storage data.


**IN-557: Carbonio Startup Service optimization**
   Implement "systemd" and ".target "in place of ".services" to manage Carbonio service loaded into the server in a proper order in  all service-dependency manner with the help of that, we can eliminate "zmcontrol scripts"


**IN-667: Improved JVM security and launch Carbonio**
   Enhance security and JVM settings in carbonio-launcher. Upon installing Carbonio, Now it starts correctly.


**IN-678: Perl module updates**
   Updated Perl modules to latest versions.


**IRIS-4474: Enhanced Availability Check Feature in Carbonio Webmail Invitation**
   Carbonio webmail now includes a convenient "Check Your Availability" button within appointment invitation emails. This feature allows users to verify their availability before confirming an appointment. Users can propose alternative meeting times by sending a revised email to the initiator, streamlining the scheduling process and improving communication efficiency


**IRIS-4773: Create Appointment from Email option added**
   Users will now have the ability to create an appointment from an email using the contextual menu. This feature will prefill the "Description" field with the content of the email.


**IRIS-4822: Expand event duration by stretching event tile**
   Users can now expand event durations by stretching event tiles in the calendar view, enabling quick adjustments directly within the interface. Confirmation modals prompt users when stretching events sent to attendees or recurrent events, ensuring proper handling and user control.


**IRIS-4983: EML message download feature**
   Users can now download email messages in EML format directly from their inbox, enhancing email management efficiency.


**IRIS-5016:  Include full Name and address in expanded Sender/Receiver header**
   The sender/receiver chips in the expanded header now display both the full name and email address of the user. This enhancement provides additional context for recipients and improves user understanding of known contacts, domain users, and external contacts.


**IRIS-5017: Improved sorting functionality in Webmail**
   This update improves sorting in webmail, ensuring proper functionality for options like "unread," "important," "flagged," and "attachment" with ascending or descending orders. Users will experience smoother email organization.


**IRIS-5043: Calendar export feature**
   This feature enables Carbonio users, both Admin and EndUser, to import arbitrary ICS files into calendars they have write access to. Additionally, users can export single appointments or entire calendars they have read access to into a single ICS file.


**IRIS-5044: Single appointment export enhancement**
   Users can now export single events they have read access to into a single ICS file, facilitating data portability and backup.


**SHELL-192: Removed Carbonio logo from email loader**
   The Carbonio logo and associated references are now removed from the email loader to prevent conflicts with the Whitelabel feature.


**TSK-69: Tasks module icon update**
   The icon for the Tasks module in the primary bar has been updated to "checkmark-circle-2-outline," enhancing user clarity and recognition of the feature.


**TSK-73: Update database existence check in tasks-db-bootstrap**
   This update modifies the database existence check in the carbonio-tasks-db-bootstrap file and implements a real health check using a script to verify if the database exists. 


*****

Bugfix List
-----------

**AC-896:  Disable login API call when using SAML option**
   When the SAML option is selected on the login page, the UI must not call the login API. Users should ensure that the username and password fields are filled before clicking the SAML button.


**AC-948: Activate "As New Email Arrives" option in Admin UI**
   Currently, the 'As New Email Arrives' option within the Admin UI has been updated to be active and selectable. This adjustment ensures consistency with the functionality observed in the User UI. By making this change, users will experience improved consistency and usability across both interfaces, enhancing their overall experience with the application.


**AC-963: Carbonio Storage Volume Modification work Seamless Functionality Across Languages**
   Improvement in the modifying Carbonio Storage Volume operates flawlessly across various languages without encountering any errors. Whether you're adjusting storage volume settings in English, Spanish, Mandarin, or any other language, the functionality remains consistent and reliable


**AC-977: Enhanced COS Management by Selecting and Deselecting Domains and User Accounts**
   Significant improvements have been made to COS (Class of Service) management within the administrative functions. Admins can now conveniently select or deselect domains and user accounts, streamlining the process of assigning COS preferences. Additionally, users will find improved clarity as the handled domains and accounts are now prominently displayed under the selected COS in the General Information section


**AC-978: Incorrect value for zimbraAuthMech during domain creation fixed**
    The issue with incorrect zimbraAuthMech values during domain creation via the Admin UI has been fixed. This problem affected all users creating domains through the admin interface. The fix ensures correct authentication for services.


**AC-980: User UI OTP reflects admin UI status**
   Fix the discrepancy where OTP status is displayed as "Disabled" in the Admin UI while it's actually enabled for users. This ensures consistency between user and admin views.


**AC-997: View mail button visibility fixed**
   Domain Admin and Delegated Admin users can now see the VIEW MAIL button in the user interface. This resolves the issue where the button was not visible to these user roles.


**AC-1012: ACL rights display improvement**
   Update ACL rights display in the Administration panel to correctly show the list name instead of the local_part.


**AC-1027: Mobile popup display fixed**
   The software behavior has been updated to ensure that the app info popup only appears on mobile devices where app installation is feasible. This resolves the issue where the popup incorrectly appeared on web browsers with small screens or when resizing windows.


**CO-986: Optimizing PostgreSQL Connection Management: Ensuring Max_pool Multiplication Limits**
   To address PostgreSQL connection issues, especially related to connection pooling, it's crucial to implement a formula that optimizes the usage of database connections within the specified limits. The goal is to ensure that the product of max_pool (maximum pool size) and num_init_children (number of initial children processes)

if Single mailbox db instance
max_pool*num_init_children <= (max_connections - superuser_reserved_connections)

If N mailbox db instance
max_pool*num_init_children * mailbox instnace<= (max_connections - superuser_reserved_connections)


**CO-1012: Efficient Large File Downloads with Blob Storage on Cloud Buckets**
   Enhance the download process of large files by leveraging cloud storage buckets for efficient blob handling. By storing file blobs on cloud buckets like Amazon S3 or Google Cloud Storage, the download process becomes scalable, reliable, and optimized.


**CO-1048: Fixed mail recipient dropdown selection**
    When creating a new mail, the recipient dropdown is not functional, preventing users from selecting recipients.


**CO-1049: Fixed Carbonio version reporting on CLI**
   The issue with Carbonio 24.5.0 RC incorrectly reporting the Carbonio version on the CLI "zmcontrol -v" command output as 24.3.0 has been resolved


**CO-1062: CLI GetAllDevices command fix**
   This fix ensures that the GetAllDevices command now displays results. It resolves the issue where the CLI command GetAllDevices failed to show any devices.


**CO-1065: carbonio service module Restart Error Fixed**
   The "carbonio [service] doRestartService" module previously raised errors during restarts. This fix addresses this issue.


**CO-1068: SAML authentication compatibility fix**
   This fix addresses the issue where SAML authentication fails specifically when using Firefox or Safari browsers.


**FILES-603: Dropzone overlay alignment issue resolved**
   The dropzone overlay in list items was misaligned, appearing at the top of the container instead of being centered. After the fix, the dropzone overlay is now correctly centered within the dropzone container, ensuring proper alignment.


**FILES-669: Preservation of Cyrillic File Names in Email Attachments**
   In this feature update, we ensure that when sending emails with attachments containing Cyrillic characters in their file names, the file names remain unchanged and intact. This enhancement aims to eliminate any potential loss of information or confusion that may arise from file name alterations during the email transmission process.


**IRIS-3230: Enhanced Appointment Calendar selection**
   Users can now select the calendar in which to add new appointments directly from Mail, ensuring appointments are organized according to user preference.


**IRIS-3768: Display missing contact information in Contact details**
   The issue regarding missing contact information such as website, address, work type, street, city, postal code, country, and state in the Contact Details section has been resolved. All relevant contact information is now visible in the Contact Details section as expected


**IRIS-4205: "Send via Mail" in File enhanced**
   Users now can send emails using the "Send via Mail" option within the File Module.


**IRIS-4803: Fixed reminder settings issue**
   Users can now set the reminder period to "Never" in calendar settings, This fix addresses the issue where setting the reminder time-span to "Never" in calendar settings does not correctly apply to new appointments.


**IRIS-4819: Attachment issue with Files section fixed**
   This issue addresses the problem where attachments selected from the "Files" section in webmail do not visually appear as attached and do not send with the message as expected.


**IRIS-4863:  Improved mail search settings behavior**
   The mail search functionality has been enhanced to honor the settings configured in the General settings section. Users can now conduct searches within their email accounts with the ability to include or exclude specific folders such as Spam, Trash, and Shared folders, resulting in a more efficient and accurate search experience.


**IRIS-4868: Draft deletion undo behavior enhancement**
   Improved user experience by ensuring that when a draft is deleted and then undone, the letter is returned to the Drafts folder instead of being sent to the Trash.


**IRIS-4881:  Improve visibility of event duration**
   Users can now be able to clearly see the full duration of events within email invitations, especially for multi-day non-all-day events, ensuring improved usability and understanding.


**IRIS-4888: Contact field deletion issue fix**
   The fix addresses an issue where users are unable to delete certain contact fields. The solution involves fixing the EditView and/or CustomMultivalueField components and implementing tests to ensure the correct update of the editor store after field deletion. TSX conversion will not be implemented in this fix.


**IRIS-5011: Improved "Advanced Search" button behavior**
   Enhance logic in the useDisabled hook to accurately enable the search button in the "Advanced Search" modal. Additionally, refactor and add unit tests for useSecondaryDisabled, which determines the status of the reset button.


**IRIS-5127: Fix error when selecting contacts in search tab**
   Resolves an issue where selecting contacts in the search tab triggers an error.


**IRIS-5132: Appointment search functionality enhanced**
   This addresses the issue where appointments cannot be found using the search tab, even after creating them in the calendars tab.


**IRIS-5146: Appointment timezone display correction**
   This fix corrects the display of appointment timezones, ensuring that the timezone displayed reflects the actual timezone of the event rather than the organizer's timezone.


**PS-473: doVolumeToVolumeMove excludes files blobs from other servers**
   The 'doVolumeToVolumeMove' operation now correctly moves data between volumes without attempting to migrate Files blobs from other mailbox servers. Metadata_files table reflects accurate server and volume information.


**SHELL-184: Quota display adjustment**
   The quota display now correctly shows "0 of N" when a quota is configured for an account and the used quota is 0, providing users with accurate information about their storage usage.


**SHELL-188: Application version label correction**
   The label display issue in the Application Versions section has been resolved. The correct label 'Chats' now appears, addressing the inconsistency in the settings interface.


**SHELL-196: Whitelabel color reset functionality enhancement**
   After resetting the Whitelabel colour from the admin panel to the default, the user interface now accurately displays the default colour instead of retaining the previously customized colour.


**TSK-52: Reminder notifications restricted to within 48 hours**
   Adjusted behavior to prevent immediate notification of reminders set for dates more than 25 days from the current date. Reminders set beyond this threshold will not trigger notifications until they are within 48 hours of the set date.


**TSK-63: Tasks service auto-start enhancement**
   Now the carbonio-tasks service automatically starts after installation, addressing the issue where it remains inactive due to sidecar service dependency.eliminating the need for manual intervention.

*****

End of changelog
