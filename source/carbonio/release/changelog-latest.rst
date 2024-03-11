
Carbonio Changelog - Release 24.3.0
===================================

Release Date: March 13th, 2024

New Features List
-----------------

**AC-419: Enable sorting and filtering for account, resources, mailing list**
   Introduce sorting and filtering options for key columns like Email, Name, and Address in Account, Resources, and Mailing List views.


**AC-806: Streamlined Management of Inherited Values for Whitelabel Settings**
   This update enhances the management of Whitelabel settings by introducing the capability for administrators to seamlessly inherit values from global settings to specific domains. 


**AC-861: Human readable quota sizes**
    Admins can now specify quota sizes in gigabytes instead of bytes, providing a more human-readable and convenient experience for setting storage limits.


**AC-873: Enhance adminUI for subscription interactions**
   Improve Admin interactions by allowing manual renewal of subscriptions, aligning Admin UI data with subscription information, and reorganizing subscription details per design mockup.


**AC-883: Improved Quarantine Management**
   Improved score visibility, flexible retention settings, and enhanced delivery controls provide administrators with comprehensive control and insights. Admins can now assess threat severity more accurately, and the message detail view offers deeper insights with score and reason values.


**AC-889: Admin can manage  "mynetwork" attribute in MTA outbound flow**
   Introduce a powerful new feature in our MTA (Mail Transfer Agent) Outbound Flow system: the ability for administrators to manage the "mynetwork" attribute at the global level. This enhancement provides administrators with greater flexibility and control over their email delivery infrastructure


**AC-890: Admin can update zimbraMtaSmtpdSenderLoginMaps**
   Admin can now update zimbraMtaSmtpdSenderLoginMaps from admin console


**AC-893: Admin control over "Forgot Password" link visibility**
   Implemented the ability for administrators to control the visibility of the "Forgot Password" link on the login page. Admins can choose to either enable or disable this feature, giving them control over users' autonomous password resets.


**AC-895: Enhanced default domain recognition**
   The latest Carbonio webmail update streamlines login by requiring only the username, eliminating the need for entering the full email address. Administrators can configure domain-specific virtual host names, enhancing user experience and simplifying access management across multiple domains.


**AC-920: Improved default domain handling for seamless logins**
   Enhances user experience by allowing login without typing the full email address. The update ensures users can seamlessly log in with just their username and password, providing clarity on the default domain associated with the FQDN. This improvement supports Carbonio, offering a simplified login process.


**AC-929: Enhanced Account update Attribute  for Admins**
   Enhancement removes the EDIT button, providing direct attribute updates for admins. Simplifies the administrative process, allowing seamless modification without extra navigation. Monitoring admins have viewing-only access, while administrators retain full editing capabilities. Additionally, the ABQ attribute is introduced.


**AC-930: UI and functionality update for account details**
   This update includes various UI changes, such as replacing the edit icon with an outline, adjusting the spacing for the end session button and between two dropdowns, ensuring the password change is displayed in one line, setting the default language selection, and introducing the display of OTP device count.


**AC-931: Enhanced account update attribute  for admins**
   Enhancement removes the EDIT button, providing direct attribute updates for admins. Simplifies the process, allowing seamless modifications without additional navigation. Monitoring admins have viewing-only access, ensuring editing is limited to administrators with the SAVE button appropriately grayed out for them.


**AC-944: Toggle to display 'Forgot Password' link in domains authentication**
   The 'Forgot Password' link toggle is now accessible in the Domain's Authentication settings within the admin UI. Admins can use this toggle to decide whether users can view or hide the 'Forgot Password' link based on their preferences.


**CO-902: Enhance backup management for admin CLI**
   Implemented attribute-based backup feature management, replacing the previous COS note method. Added the capability to enable/disable backup at the account level through the CLI.


**CO-945: Removed "carbonio auth enforce2FA" command**
   Now the "carbonio auth enforce2FA" command and related code is removed due to its non-functional nature in Carbonio.


**IRIS-4360: Flexible time proposals in calendar App**
   Users can now suggest new times directly in the Calendar app, responding seamlessly to invitations from both email and calendar appointments. Access this feature conveniently from the mail invite, calendar displayer, context menu, or summary view for efficient and hassle-free responses.


**IRIS-4553: User can see Contacts Group and Distribution List**
    Webmail platform with the introduction of new features for "Contacts Group and Distribution List"  management by the user itself. With these enhancements, users can experience streamlined group organization, improved communication efficiency, and enhanced user control.


**IRIS-4555: User can edit contact group**
   Enhanced contact group editing includes efficient confirmation modals, character limit adherence, and seamless deletion with corresponding snackbar updates. Discarding resets the board, and adding/removing addresses promptly updates the displayer list


**IRIS-4764: User can search the meeting room by typing on the input**
   Users can now seamlessly input and filter Meeting Room options through input feature. The selection transforms into chips, with validation ensuring only valid options are visible upon saving an appointment. The dropdown auto-selects on hitting enter, and availability information is displayed in the chip.


**IRIS-4767: User can search the equipment by typing on the input**
   Users can now seamlessly input and filter Equipment options through input feature. The selection transforms into chips, with validation ensuring only valid options are visible upon saving an appointment. The dropdown auto-selects on hitting enter, and availability information is displayed in the chip.


**IRIS-4774: Improved 'Send Later' in Webmail**
   The latest Webmail update enhances the 'Send Later' feature, giving users more control over email scheduling. Now, users can schedule emails and even cancel or close the 'Send Later' modal as needed.


**IRIS-4854: Distribution list management improved in Webmail**
   Now, users can easily view the distribution lists of which they are members or managers directly from the 'Contacts Group and Distribution List' primary bar. The distribution list members are displayed solely as email addresses for streamlined viewing.


**IRIS-4902: User can Choose timezones in appointment creation**
   Now, when creating appointments, users can easily pick their preferred timezone, allowing flexible scheduling across different locations. This update makes managing appointments more intuitive, adapting to diverse scheduling needs for enhanced productivity and user experience.


**IRIS-4911: User can delete contact group**
   Users have the capability to delete contact groups, with features such as displaying confirmation modals during deletion, effective error handling, successful removal from the list, and closure of associated displayers.


**IRIS-4935: Enhanced mail composs borad with html formatting**
   Enhanced the mail compose board with header patterns, page borders, dividers, and priority indicators, allowing users to personalize their email writing experience.


**IRIS-4950: Empowered DL management in webmail**
   The enhanced feature allows Distribution List (DL) owners to efficiently manage members, names, and descriptions directly from the web interface, providing greater control and flexibility.


**IRIS-4993:  Update distribution list display on manager edit**
   Enhance display accuracy for distribution lists edited by managers. Ensure real-time updates in list, displayer, and board, including changes in display name, owners, and members.


**IRIS-4994: Handle contact groups caching for new or edited groups**
   This update ensures proper handling of contact group caching in different scenarios. When a new contact group (CG) is created, it will be inserted into the sorted position, displayed as active, and auto-scrolled to the bottom when on the /groups/contact-groups page. Additionally, when a new CG is created elsewhere, the contact group cache will be reset, addressing scenarios such as uncached items, modified CG names, unordered deletions, and complete cache emptiness.


**IRIS-5013: New CSV Import/Export feature in  Webmail**
   Effortlessly import and export contact lists using CSV files. This enhancement enables seamless transfer of contact information between Carbonio, both internally and with external applications.


**IRIS-5022: Contacts export enhancement**
   Users can now export mail contacts conveniently with the "Export" option in the right-click menu. The feature handles errors during CSV file import and excludes contacts in sub-address books. It also restricts the action in the Trash and shared address books, showing a snackbar for unsupported extensions


**IRIS-5040:  Icon updated for contacts group and distribution lists**
   The primary bar icon for Distribution Lists and Contacts Groups has been updated to offer users a clear visual distinction from the Contacts module. This modification is intended to enhance user clarity and avoid any potential misunderstandings.


**WSC-1192: Chat filter should include also group**
   When I filter a contact, I would like to see among the results also the group I have with the contact.
   Reason: Sometimes I already have a group with  people, but I don't remember the group name. Looking for it just scrolling is time consuming and I usually give up because I'm not sure it is there. Being able to filter by participant would be very helpful. (this is the behaviour the current chat has and I find it very useful)


**WSC-1227: Moderator mute confirmation modal**
   None


**WSC-1229: Display known user profile pictures in modals**
   This update ensures that in the Creation modal and Add new participant modal, when selecting users from the list with whom the user already has an existing one-to-one or group conversation, the avatar will now display the profile picture of the known user for a more personalized user experience.

*****

Bugfix List
-----------

**AC-887: Enhanced Name validation in  Antivirus mirrors spaces Prohibited**
   Improve name validation in  the anti-virus mirror of Carbonio now mirror  not accept any spacing in name, his enhancement ensures that mirror names adhere to standardized naming conventions, promoting consistency and clarity across the platform


**AC-888:  Admin rights table refinement**
    The Admin Rights table will now exclusively display ACL groups and omit any distribution lists that the admin is part of. This change enhances the clarity and focus of the displayed information.


**AC-919:  Domain admin can change user COS**
   Now the domain admin can modify a user's Class of Service (COS) using the Carbonio Web Admin panel.


**AC-923: FQDN Validation Enhancement**
   Improves the Fully Qualified Domain Name (FQDN) validation in virtual hosts. Validations now align with expected behaviour for various scenarios, ensuring accuracy.


**CO-856: Renameing account name are working from carbonio prov**
   The latest update introduces improved flexibility in managing Carbonio accounts, enabling admin to effortlessly rename accounts within the same domain or across different domains. Leveraging the powerful "carbonio prove" command in the Command Line Interface (CLI), administrators can efficiently execute account renaming operations, ensuring consistency and ease of administration.


**CO-955: Improved backup scheduling error handling**
   Error handling for empty CarbonioNotificationRecipients during backup scheduling has been optimized in Carbonio, preventing disruptions and ensuring smoother backup activities.


**CO-1005: File upload issue in chats module fixed**
   The issue related to the disappearance of thumbnails during file uploads in the Chats module has been investigated and fixed. This solution addresses the bug that affected the uploading and display of images or files in conversations.


**COR-1022: Enhanced delegated admin permissions**
   Delegated admin accounts now include missing grants for modifying the zimbraMailTransport attribute. This update in ensures delegated administrators have the necessary privileges to efficiently manage email transport settings for user accounts.


**COR-1024: Granted missing rights for delegated admins**
   The essential permissions granted to the __helpdesk_admins@ group empower delegated/helpdesk admins to utilize features that allow DomainAdmins to configure recovery addresses and manage forgotten password features for users. This resolution addresses the issue where delegated/admins faced access challenges due to insufficient rights.


**IN-668: Restore Nginx Worker Processes Owner**
   Ensure that the Nginx worker processes owner is restored to the zextras user to address the files download issue in /opt/zextras/data/tmp/nginx/proxy. This change maintains consistency with the current carbonio configuration.


**IRIS-3469: Email conversation threads ordered**
   The email conversation threads are now ordered with the most current email at the top.


**IRIS-3578: Contact sharing and Global address list fixed**
   Addresses the issue in which shared contacts did not appear in the contacts section, blocking contact sharing on Carbonio. Furthermore, the global address list was unreachable in the contacts, limiting the capacity to find and manage contacts. now the users can share contacts and a global address list is accessible.


**IRIS-4292: Calendar description stability proposed time acceptance**
   This fix addresses an issue where the original description in a calendar appointment is lost after accepting a proposed new time. The proposed solution ensures that the description remains intact even after accepting a new time proposal in the calendar.


**IRIS-4635: Calendar color alignment across web and mobile**
   The calendar colours are now synced throughout the web and mobile platforms. The system uses the same color for calendars, whether they are modified on the web or on mobile. This assures the consistency and alignment of color representations.


**IRIS-4656: Improved attachment management in appointments**
   Now users can remove attachments from existing appointments, this update addresses the issue where attachments couldn't be successfully removed during appointment creation or editing. enhancing the overall appointment management experience.
  


**IRIS-4686: Rename subscribed folder reflects changes on local mount-point**
   Renaming a subscribed folder now has no impact on the original name only rename the mount point's name.


**IRIS-4729: Corrected label on search chip for "To" criteria**
   The webmail advanced search modal is improved, now featuring accurate search patterns tailored specifically for the "To" and "From" fields. With this update, users can conduct searches with greater precision.


**IRIS-4884: Appointments under 30 minutes display end time**
   The end time for appointments lasting less than 30 minutes is now correctly displayed along with the title.


**IRIS-4915: Folder control improved for shared account invitations**
   Shared accounts can now only choose folders with the right permissions for calendar events, ensuring invitations are saved in approved folders and maintaining folder management integrity in shared accounts.


**IRIS-4917: Enhanced quick action "Send Email"  functionality**
   Sending emails just got smoother in Webmail! Now, when you use the 'Send Email' option in a chip from a past email, the 'To' field shows the right recipient in both the sent email and the list. We've tested it thoroughly, even with Cc and Bcc addresses,


**IRIS-4920: Enhanced fixed layout for printing long subjects in webmail**
   This enhancement of long subject lines maintains readability and professionalism when printed. By implementing a fixed layout approach, knowing that the subject line is fully displayed and aligned appropriately. This improvement enhances the overall user experience within Carbonio Webmail.


**IRIS-4937: Edit contact in shared address book**
   The enhanced functionality enables users to seamlessly modify contacts within a shared address book, positively impacting the essential process of editing contacts in the shared address book.


**IRIS-4938: Mail search date pattern populated correctly in advanced search calender inputs**
   The date pattern for mail search within the advanced filter fields now populates accurately in the calendar inputs. Users can expect enhanced functionality and convenience when specifying date ranges for their searches. This improvement ensures that the calendar inputs correctly reflect the selected date pattern,


**IRIS-4940: Signature creation process improved**
   The signature creation process has been enhanced to prevent users from entering signature details before clicking "ADD SIGNATURE." This improvement ensures that users must click the button to enable input fields and the editor for adding signature details.


**IRIS-4944: Improved account name visibility in shared address book**
   Improvement of the experience Carbonio Webmail in the sharing of an Address Book, Now the owner can view the shared account names fully within the Webmail interface.


**IRIS-4976:  Calendar editor permission display fixed**
    The display issue with the chip for a person with editor permissions on the "edit calendar properties" modal has been resolved. The fix ensures that the chip length does not break the layout and is fully visible on small screens.


**IRIS-4986: Trusted addresses settings enhanced**
   Resolved the bug affecting the trusted addresses settings, The issue, causing unexpected behaviour such as the transformation of the previous address/domain into 'undefined' and prompts to save unsaved changes, has been successfully fixed.


**IRIS-5004:  Calendar invitation date display fixed**
   Resolves the issue where the calendar invitation incorrectly displays today's date instead of the actual appointment date. The fix ensures that the displayed date aligns with the correct day of the appointment.


**IRIS-5029: Enhanced 'Load More' in webmail search**
   Experience smoother and more accurate loading of search results with the improved 'Load More' feature in the Carbonio Webmail search module.


**IRIS-5039: Selective event reply in Calendar**
   Users can now reply to individual instances within recurring events, offering increased flexibility with options like decline, tentative, or accept.


**IRIS-5059: Restore message order in conversations**
   Now, the user-defined message order, set from old to new, is functioning as intended, ensuring accuracy and consistency. This prevents unintentional reversals of message sequences, delivering users a reliable and expected display in conversations.


**TEAMS-3988: Enhanced video chat virtual Background Functionality**
   Improved Video Chat: Resolved background image path issues for seamless use of virtual backgrounds without disruptions.


**TEAMS-4118: Real-time settings update**
   Settings now instantly update upon user interaction, eliminating the need for a page refresh, enhancing the overall user experience.


**TEAMS-4128: Custom backgrounds upgrade for video chat**
   Now users can select and apply background images of their choice during video calls, adding a touch of creativity and individuality to their conversations.


**WSC-960: Bubble contextual dropdown menu has wrong z-index**
   When opening the dropdown menu of a message, the menu remained visible and overlapped with the conversation header upon scrolling.


**WSC-1154: None**
   None


**WSC-1223: Unused timezone and locale from zimbraPrefs**
   User want messages and users' last seen dates to be formatted based on the timezone and locale they have set in the Carbonio general settings


**WSC-1266: Enhance chat header responsiveness**
   This update focuses on improving the responsiveness of the chat header. Specifically, when the window size is reduced, ensure that the "Start meeting" button and the information button align horizontally instead of vertically for an enhanced user experience.


**WSC-1269: Fix webcam stream release issue**
    This update resolves the issue where, upon entering a meeting with video on and subsequently turning the video off, the webcam stream isn't released, and the webcam light fails to turn off as expected.

*****

End of changelog
