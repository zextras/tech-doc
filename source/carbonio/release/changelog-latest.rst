
Carbonio Changelog - Release 24.7.0
===================================

Release Date: July 22nd, 2024

New Features List
-----------------

**AC-937: Active directory authentication port hint updated**
   The AdminUI will now display a hint for AD authentication that suggests using port 3268 instead of 389, which aligns with the correct port used for authenticating against the Global Catalog in AD.


**AC-950: Dashboard now display admin last Login timestamp and carbonio version**
   The Carbonio Admin panel Dashboard will now include the Carbonio version and the admin's last login timestamp, providing administrators with key information immediately upon logging in.


**AC-962: Account details updated for files space**
   The Files Space Limit field will now highlight in color (#D5E3F6) for 3 seconds when clicked, and the display will scroll to this field. Additionally, a warning for "Maximum 3 digits allowed after the decimal point" will only appear if the user exceeds this limit.


**AC-969: The "INIT DOMAIN" enhanced**
   Admins can now view the status of domain initialization. For first-time domain initialization, they will see an "INIT" button. For subsequent initializations, a "RE-INIT" button will be displayed. This allows admins to decide whether to initiate or apply additional changes based on the current status.


**AC-1005: Update translations to use i18next JSON format v4**
   Update i18next provider to use JSON format v4 for improved translation management and compatibility.


**AC-1006: LegalHold account status management in AdminUI**
   Admins can now toggle to view only legal-hold accounts or all accounts, search for accounts by domain or input field, and set accounts as legal hold through the AdminUI.


**AC-1009: OTP requirement in forgot password flow**
   Users with 2FA enabled on Carbonio will now required to enter an OTP code in addition to the recovery token when using the "Forgot Password" feature from an untrusted IP address.


**AC-1011: Delegated admin panel error handling enhanced**
   The AdminUI will now display an informative message to the delegated admin if there is a lack of rights-related API calls, such as `getEffectiveRights`. This will help the admin understand why they may not be able to perform certain tasks and guide them on potential actions to resolve the issue.


**AC-1014: The domain disclaimer control by global config**
   The Domain Disclaimer feature is now controlled by the Global Config setting, allowing administrators to enable or disable the disclaimer option for all domains from a central location.


**AC-1015: Enhanced domain auth LDAP support**
   The Domain Auth LDAP feature has been improved to securely store search bind credentials, allowing for easier and more secure authentication with external LDAP directories.


**AC-1020: Global Delegates label change**
   The label "Global Delegates" has been changed to "Administrators" across the platform. This update standardizes the terminology used to refer to administrative roles, improving clarity and consistency within the user interface.


**AC-1023: Secondary volumes removed from CE storages**
    The Storages section no longer supports or references Secondary Volumes, simplifying volume management and removing unnecessary features.


**AC-1030: Files quota information added to quota panel**
   The Carbonio Quota panel now reports file quota usage and limit, providing administrators with detailed insights into file storage and mail storage usage.


**AC-1031: Files account quota added to COS advanced**
   The COS - Advanced settings now include the Files Account quota, allowing administrators to manage file storage limits for users.


**AC-1032: Disable 2FA for incorrect AuthMech**
   If the domain's Authmech is set to external LDAP, external AD, or “zimbra”, the 2FA menu will be disabled or a clear warning will inform the admin that 2FA settings are not enforced with the chosen Auth Method.


**AC-1035: The Indonesian language options introduced**
   Added Indonesian language option to the language selector for improved accessibility and personalization.


**AC-1036: Remove chinese language option**
   The Chinese language option has been removed from all language selectors on the admin console. Now the users will no longer see Chinese as an available language choice.


**AC-1043: Mailbox and Files quota visualization**
   Admins can now view the used and available quota for Mailbox and Files directly from the Account panel. When a user clicks on the mailbox quota usage, the system focuses on and highlights the account quota input field, enhancing the user experience.


**AC-1060: The example for hex code for colors in the admin UI updated**
   The admin UI now shows a valid hex color code example to prevent errors caused by invalid hex color codes.


**AUTH-543: Removal of desktop app option from webmail auth**
   The desktop application option from our webmail auth module in Carbonio is removed due to low usage. Users will no longer see this option.


**AUTH-549: Enabled communication between Carbonio Files and auth**
   Communication between carbonio-files and carbonio-auth is now established by adding the required intentions, enabling the token validation endpoint to function correctly.


**CO-904: RecoverAccount API sendRecoveryLink operation removal**
   The sendRecoveryLink operation has been removed from the RecoverAccount API. The UI now correctly uses the getRecoveryAccount operation for the "Forgot Password" feature.


**CO-977: Enhanced subscription: display end user name in admin UI and CLI**
   The subscription feature now shows the end user's name in both the Admin panel and CLI, enhancing user management and visibility for administrators.


**CO-992: Expose prometheus metrics for Carbonio storages service**
   Carbonio storages service now exposes prometheus metrics, including JVM info, node metrics, and HTTP traffic data. This enables better monitoring and observability.


**CO-1023: Module-Specific trash emptying enhanced**
   Each module's trash can now be emptied independently, ensuring only the selected module's items are deleted.


**CO-1024: Admin can control message undelete feature**
    Global administrators can now define which COS and users can restore deleted messages. Users will only see the restore option if they have permission.


**CO-1032: New endpoint for guest account creation**
   Successful implementation of an API endpoint for creating guest accounts in Carbonio. Post API with any guest name and API provide zxToken and tokenId


**CO-1039: Prohibit copy on over quota**
   The carbonio-storage now prevents copy operations when a user exceeds their storage quota, ensuring no further data can be added beyond the allocated limit.


**CO-1040: Account status accessible via GetAccountInfo API**
   The GetAccountInfo API now returns the account status, allowing sysadmins to determine if an account is in maintenance, closed, etc.


**CO-1045: Improved LDAP external auth: Concurrent socket factory usage**
   The recent LDAP external auth update with AllowConcurrentSocketFactoryUse enhances performance and reliability by enabling multiple connections to efficiently share the same socket factory.


**CO-1058: The domain filtering supports to GetAllDevices API**
   Enhancement to the GetAllDevices API allowing administrators to filter mobile devices by specific domains.


**CO-1061: Contact groups ordering in autocomplete**
   Contact groups are now included in the alphabetical order of the autocomplete suggestions based on their display name.


**CO-1063:  Simplify MDM Feature Configuration**
   Remove ZxMobile_DeviceManagementEnabled attribute requirement and ensure zimbraFeatureMobilePolicyEnabled alone enables MDM features across accounts.


**CO-1070: OTP email template icon fixed**
   The icons in the static OTP notification email template no longer overlap, ensuring a clear and professional appearance.


**CO-1120: Quota sorting capability added**
   Added sorting functionality to API to sort mail quotas by percentUsed, totalUsed, quotaLimit, using this API functionality users can sort mail quotas by percentUsed, totalUsed, and quotaLimit in ascending or descending order.


**CO-1146: Improved hyperlink edit box visibility**
   The hyperlink edit box has been enlarged to display the entire URL, improving user experience and ease of editing web links.


**CO-1160: User can select items for restore**
   Users can now see and select specific mail items to restore from a backup, with options to view item details such as Date, Subject, From, and To.


**CO-1169: New secondary bar with common components**
   A new secondary bar with common components is enhanced, which fixed sharing and icon size inconsistencies. The “ADD SHARES” button is now disabled for viewers.


**CO-1172: Seamless Contact Creation and Search with Enhanced UI Integration**
   The UI now seamlessly integrates address book information, ensuring smooth contact creation and error-free search functionalities.


**CO-1174: Folder actions and modals implementation**
   Added functionality to handle delegated account's folder actions and related modals in the Contacts module, ensuring proper context menu actions and modal displays.


**CO-1175: User can download single contact vCard**
   Users can now download a vCard for any contact in their address book, allowing them to share contact details easily via email or chat.


**CO-1176: Enhanced Icon for recurrent appointments**
   Recurrent appointments now feature a new icon on their cards for easy identification. Users can quickly recognize recurrent appointments and hover over the icon to view a tooltip saying "Recurrent appointment," improving usability and appointment management.


**CO-1177: Enhanced local password reset with recovery code**
   Users in Carbonio CE can now reset their password locally using a recovery code, activated by admins through the zimbraFeatureResetPasswordStatus setting. Ensure a recovery email is added in settings; upon requesting a reset, a code is sent to this email for authentication and password reset.


**CO-1193: vCard Import from mail attachment**
   Users can now import vCards directly from mail attachments into their address book by clicking an icon in the AttachmentBlock component.


**CO-1195: Users can import vCard from attachment**
   Now the users can import contacts directly from attached vCard files.


**COR-916: Proxy Configuration for Internet Access**
   Carbonio can now be configured to connect to the internet using both authenticated and unauthenticated proxy settings. This allows for data downloads and metrics collection through proxies.


**DOCS-202: Quota check for document edit access**
   The Docs now check the document owner's quota before allowing write access. If the owner is over quota, the document is opened in read-only mode.


**DOCS-210: Health check APIs for carbonio-docs-connector**
   The carbonio-docs-connector now has three new APIs to check its health status. These APIs allow for monitoring the health of the service and its dependencies.


**FILES-287: Improved "Update View" Button in Carbonio File Module**
   Pressing the “update view” button now correctly updates the Files view, ensuring that the cache is reset and the displayer remains open when the response arrives.


**FILES-770: Localize date and time display**
   Instead of using the account settings' timezone, the system will now display dates and times based on the browser's timezone and locale settings. This change ensures that users see dates and times in a format that is familiar and standard for their region.


**FILES-771:  Hide docs and preview features when services not available**
   The Files UI will hide all Docs and Preview related features if the corresponding services (carbonio-docs-connector and carbonio-preview) are not live.


**IN-681: Update to carbonio-openssl 3.0 LTS**
   The Carbonio OpenSSL library has been updated to the 3.0.x LTS series, with adjusted compilation flags and FIPS enabled at build time.


**IN-691: Carbonio pidfiles moved to /run/carbonio**
   Carbonio processes will now store their pidfiles in /run/carbonio instead of /opt/zextras/log, adhering to UNIX best practices and ensuring consistency across reboots.


**IN-702: Add systemd tmpfiles support and checks for /run/carbonio**
    The system now supports tmpfiles configuration for systemd and includes checks for the /run/carbonio directory in various zm*ctl scripts to ensure proper functionality after a reboot.

*****

Bugfix List
-----------

**AC-932: Display message enhanced for missing OTP images**
   When sending OTP codes to Gmail, images and the QR code were not visible. The update provides alternative text for these images, ensuring that users receive clear instructions even if the images fail to load.


**AC-981: FQDN validation Improved**
   Improves the Fully Qualified Domain Name (FQDN) validation in virtual hosts. Validations now align with expected behaviour for various scenarios, ensuring accuracy.


**AC-982: HSM policy creation and editing enhanced**
   Carbonio allows users to create and edit HSM policies without issues, ensuring correct functionality.


**AC-983: CoS selection and saving at account level fixed**
   The admin now correctly disables the CoS selector if the account is set to use the default (domain) CoS. If a specific CoS is selected, it will be saved properly and updated correctly when the account is reopened.


**AC-1013: Enforce external auth improvements**
   The AdminUI now clearly informs the admin about the implications of setting "allow local fallback" to FALSE without an LDAP URL. Warnings and confirmations are added for better clarity.


**AC-1017: Domain based ActiveSync account filtering**
   The ActiveSync account management system now allows Global Admins to view and manage accounts specific to the selected domain, enhancing account management efficiency and organization.


**AC-1018: Inherited value option in MTA My Network**
   The My Network section in MTA Server General settings now includes an option to inherit values, providing administrators with the ability to use inherited network settings.


**AC-1033: Manage parts scrolling issue fixed**
   The scrolling behaviour in various management sections such as Accounts, Delegated Domain Admin, Distribution list, Security Groups, Resources, Cos List, and Domain List has been improved to provide a smoother user experience. Additionally, the Chevron and text colour have been synchronized to secondary regular, and the icon and text now have an 8px space.


**AC-1040: Enhanced HSM scheduler enable/disable feature**
   Improved HSM scheduler now allows enabling or disabling features. The powerstoreMoveScheduler policy executes based on the scheduler's enabled status from the admin UI.


**AC-1041: Correct HSM Policy Display in Admin UI**
   The Admin UI now correctly displays the HSM policy as per the zimbraHsmPolicy attribute, reflecting any changes made at the server level.


**AC-1042: Enhanced admin UI for large domains**
   The Carbonio admin UI has been optimized to efficiently manage domains with over 5000 accounts, improving performance and usability in large-scale environments.


**AC-1058: Remove device button enables upon account selection**
   The remove device button functionality has been updated. It now activates correctly when any account is selected, enabling users to remove the selected account efficiently. This improvement enhances user experience by ensuring that the button remains inactive until an account is chosen, preventing accidental deletions and streamlining the account management process


**AC-1059: Enhanced service passphrase management in admin account security**
   Improvements have been made to accurately manage multiple service passphrases in Carbonio admin accounts, aligning them with specific protocols. This enhancement ensures precise management and enhances the administrative experience.


**AC-1061: Improved passphrase protocol in account security services**
   The account security services now ensure an accurate display of passphrases. This enhancement improves user experience by simplifying the management of service passphrases with precision and efficiency.


**AC-1063: Uniform distribution list naming**
   The terminology for Distribution Lists is now consistent throughout the Carbonio Web Admin interface, replacing all instances of "Mailing List" with "Distribution List".


**AC-1081: Whitelabel help URL update fixed**
   The help documentation URL in whitelabel settings now correctly updates to the domain level URL instead of the global URL when modified.


**CO-959: Enhanced Bulk Message filler compatibility with "Request Read Receipt"**
   We've improved the Bulk message filler feature in UI to operate smoothly alongside the "Request Read Receipt" functionality. This enhancement ensures that sending bulk messages does not interfere with tracking email reads, ensuring effective communication and monitoring.


**CO-985: OTP enforced with forgottenPassword token**
   Users must now provide OTP along with the ForgottenPassword token if 2FA is enabled, ensuring a more secure password reset process.


**CO-1021: Fixed query string handling in SAMLRequest**
   The SAML authentication process now correctly handles query strings in the sp.entityid field, allowing for successful authentication with Identity Providers that use query strings, such as Google Custom SAML apps.


**CO-1053: Upload Cancellation Deletes Partial Data**
   When a user cancels an upload, the system now ensures that any partially uploaded data is automatically deleted, preventing unnecessary data storage.


**CO-1060: TrustedDevice handler fixed**
   The trustedDevice handler is now properly registered, allowing the CLI commands for listing and deleting trusted devices to function correctly.


**CO-1064: getHsmPolicy document retrieval fix**
   The getHsmPolicy function now correctly returns the document, resolving the issue where it previously did not.


**CO-1147: Improved message subject visibility on hover**
   Enhances user experience in Carbonio by displaying full message subjects in a tooltip when hovering over messages with long subjects, improving readability.


**CO-1155: Email Printing Enhancement**
   Enhanced email printing functionality to ensure complete printouts, including all content and images, regardless of how images are inserted into the email body.


**CO-1161: Correct date in cancellation message**
    The cancellation message now correctly displays the date of the deleted instance or series, providing clear information to the participants about which occurrence has been deleted.


**CO-1162: Fixed mail editor UI freeze due to update loop**
   The mail editor component has been refactored to eliminate an infinite update loop that caused UI freeze when creating new emails.


**CO-1163: Fixed "Open in new window" issue**
   When a user opens an email in a new window and navigates back to the original tab to access other modules like Calendar, Address Book, Chat, or Files, the email content in the new window remains visible. This update ensures the message content does not disappear when switching between modules.


**CO-1164: Contact editor crash enhanced**
   The contact editor no longer crashes when editing an existing contact in the Contacts module.


**CO-1165: User no longer save big signature**
   Users will now receive an error message if they attempt to save a signature that is too large. Only signatures within the allowed size will be saved.


**CO-1166: Remove delegation buttons from user settings**
    The delegation buttons (Add Delegate, Edit Permissions, Remove) have been removed from the user settings in Carbonio Webmail to ensure delegation can only be set by an Admin in the Carbonio Web Admin console.


**CO-1205: Avoid survey popup in Carbonio**
   The survey popup will only appear if `CarbonioAllowFeedback` is TRUE and the instance is CarbonioCE. This prevents the survey from showing up on Carbonio instances.


**CO-1239: Attendee notification fixed for shared calendar**
   Attendees will now receive notifications when an account with manager rights modifies an appointment on a shared calendar. This ensures that all participants are informed of any changes made to the meeting details.


**CO-1243: Appointment reminder Issue fixed**
   The appointment reminder value will no longer increase significantly after modifying, dragging & dropping, or copying the appointment.


**CO-1244: Updated GetAccountInfo and GetInfo error code  for non-existent guest accounts**
   The GetAccountInfo and GetInfo operations now return a 422 Unprocessable Content status code instead of a 500 error when a guest account does not exist.


**CO-1246: Permanent delete button text restored**
   The 'DELETE PERMANENTLY' button text is now correctly displayed when permanently deleting a contact, fixing the issue where it was previously missing.


**CO-1248: Fix mailboxMove for S3 centralized volumes**
   Mailbox move now correctly updates volume IDs for chats and files when moving between mailstores with the same S3 centralized volumes.


**CO-1249:  Fix FullAutoComplete API for non-expandable GALGroup**
   FullAutoComplete API now handles non-expandable distribution lists without causing failures and allows users to autocomplete, save drafts.


**CO-1250: Fixed Missing Translations for Calendar and Mail**
   Translations for calendar and mail functions have been improved, ensuring consistency, especially for French users. The previously missing translations have been corrected, providing uniformity across these sections.


**CO-1251: Hide backup legal hold options**
   The Backup legal hold options are now hidden in the Admin Panel for the CE  to avoid confusion among CE users, as these features are exclusive to the premium version of Carbonio.


**CO-1252: Filter selection modal fix**
   The modal for selecting folders within the Filters settings now functions correctly, allowing users to select folders without encountering errors.


**CO-1254: Disappearing email recipients fixed**
   Fixed a bug that caused wrong mail addresses to be shown as recipients in sent emails in some corner cases.


**CO-1358: migrated slapd PID file location**
   Migrated the slapd PID file location from /opt/zextras/data/ldap/state/run/slapd.pid to /run/carbonio/slapd.pid. This change ensures consistent and secure management of process IDs within the LDAP configuration.


**FILES-274: Coherent file size sorting**
   The sorting of files by size is now coherent, ensuring files with size 0 are correctly placed in the list.


**FILES-619: Rename file on restore conflict**
   When a file is restored from the trash and a file with the same name already exists in the folder, the restored file is renamed to avoid conflicts.


**FILES-811: Fixed recording upload issue on Files**
   Recordings can now be successfully uploaded to Files as the JWT token validation between videoserver-recorder and Files is resolved.


**IN-706: zmdomaincertmgr is enhanced**
   Admins are now able to save and deploy domain certificates correctly. The `zmdomaincertmgr deploycrts` command now deploys the correct certificates.

*****

End of changelog
