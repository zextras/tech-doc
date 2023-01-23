.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _changelog:

Carbonio Changelog - Release 23.1.0
===================================

Release Date: January 23th, 2023

.. rubric:: Component: Admin Console & Login UI

* *Issue ID:* AC-91

* *Title:* Allow Admins to drop user sessions

* *Description:* With this feature Admins can now drop user sessions
  through carbonioAdmin GUI by accessing Home > Domains > Accounts

..

* *Issue ID:* AC-236

* *Title:* Domain certificate upload and verification

* *Description:* Domain admins can now upload, verify and apply the
  SSL certificate from the admin console.

..

* *Issue ID:* AC-240

* *Title:* Distribution lists layout improvement

* *Description:* A better layout has been provided for the addresses
  allowed to send emails to a distribution list.

..

* *Issue ID:* AC-260

* *Title:* Whitelabel support from admin console

* *Description:* It is now possible to customize logo, title, favicon
  and the dark mode from the admin console.

..

* *Issue ID:* AC-276

* *Title:* Buckets list improvements

* *Description:* The buckets list columns now show labels and tooltips
  taken from the notes field is shown.  The edit button allows the
  admins to edit the labels and the notes fields.

..

* *Issue ID:* AC-284

* *Title:* Update view button bugfix

* *Description:* Users data are now refreshed and updated when "Update
  View" button is clicked.

..

* *Issue ID:* AC-290

* *Title:* Whitelabeling Customization Allowed for User and Admin
  Login Pages

* *Description:* Through this feature, Admins can now customize the
  login pages UI parameters such as Logo, Title, Favicon, and
  Background images

..

* *Issue ID:* AC-309

* *Title:* Duplicated settings in distrubution lists removed

* *Description:* There is no longer a duplicate of "Can receive email"
  and "hide in gal" switches in the distribution lists panel.

..

* *Issue ID:* AC-310

* *Title:* Fields improvement when using firefox with dark mode

* *Description:* Disabled fields are now in dark grey and enabled
  items are in light grey when using Firefox and dark mode is
  activated.

..

* *Issue ID:* AC-319

* *Title:* Mailbox quota view paginated

* *Description:* The mailbox quota view is now paginated in the admin
  console.  Known bug: the number of lines starts from 1 for each
  page.

..

* *Issue ID:* AC-323

* *Title:* Advanced features hidden in Carbonio CE

* *Description:* Following the customers' requests, Carbonio advanced
  features have been hidden in Carbonio CE in order to have a cleaner
  admin interface.

..

* *Issue ID:* AC-338

* *Title:* Storage management improved

* *Description:* Only mailstore servers are now listed in storage
  management, to have a cleaner interface.

..

* *Issue ID:* AC-339

* *Title:* COS features removal

* *Description:* Several COS features were removed from the admin
  console page to make it cleaner.

..

* *Issue ID:* AC-340

* *Title:* COS and user preferences clean up

* *Description:* Unused preferences were removed from COS and user
  preferences in admin console.

..

* *Issue ID:* AC-350

* *Title:* Buckets list labels and tool tips

* *Description:* The buckets list now uses labels for the columns and
  provides a notes field that is used for the tooltips.

..

* *Issue ID:* AC-351

* *Title:* doUpdateBucket now allows admins to modify label and notes

* *Description:* The `doUpdateBucket` command allows the admins to add
  and modify labels and notes in buckets configuration.

..

* *Issue ID:* AC-353

* *Title:* Typo corrected in domain deletion confirmation

* *Description:* Fixed a typo in the confirmation message when
  deleting a domain.

..

* *Issue ID:* AC-376

* *Title:* Proxy removed from COS settings

* *Description:* Proxy configuration was removed from COS setting
  page.

..

* *Issue ID:* AC-383

* *Title:* Backup module list selector improvement

* *Description:* The list selector in the Backup module only shows the
  mailstore servers now.

..

* *Issue ID:* AC-392

* *Title:* Carbonio License can be seen from the Subscription Page

* *Description:* License information is now shown on the subscription
  page for each mailstore server.

..

* *Issue ID:* AC-393

* *Title:* Server pool settings clean up in COS

* *Description:* Only mailstore servers are listed in the server pool
  list in the COS configuration.

..

* *Issue ID:* AC-396

* *Title:* EAS devices list fixed

* *Description:* All the Exchange ActiveSync devices are now shown
  even if the proxy is not a mailstore server.

.. rubric:: Component: Backup

* *Issue ID:* BCK-680

* *Title:* Corrected Usage example from setBackupVolume S3

* *Description:* Corrected `Usage example` for `carbonio help backup
  setBackupVolume S3` removing `volume_prefix` example.

..

* *Issue ID:* CO-296

* *Title:* Carbonio bootstrap improved

* *Description:* Carbonio bootstrap can now be run more than once
  without breaking the current configuration. The output shows the
  bootstrap mode.

..

* *Issue ID:* CO-367

* *Title:* Installation improved in multiserver environment

* *Description:* To make the installation of a multiserver environment
  easier, now the admins no more need to manually copy the service
  discover service credentials.

..

* *Issue ID:* CO-440

* *Title:* Invalidation of the user cookie improved

* *Description:* `EndSession` with `logoff=1` invalidates the user
  cookie. User cookies are deleted properly from the LDAP.

..

* *Issue ID:* CO-443

* *Title:* Changed the behaviour of resolvedHostname response in
  nginx-lookup

* *Description:* Improved nginx-lookup resolvedHostname behavior to
  increase the success of https certificate validation.

..

* *Issue ID:* CO-449

* *Title:* Zmfixperms improvement

* *Description:* The `zmfixperms` command now fixes
  `/opt/zextras/docs` folder too.

..

* *Issue ID:* CO-453

* *Title:* Link to documentation in service discovery fixed

* *Description:* Link for documentation in systemd script
  service-discover.service was fixed.

..

* *Issue ID:* CO-454

* *Title:* Zextras EULA removed from bootstrap help

* *Description:* When running the `carbonio-bootstrap` command help,
  the welcome message and EULA is no more displayed.

..

* *Issue ID:* CO-457

* *Title:* SSL certificates cleanup for deleted domains

* *Description:* The `zmproxyconfgen` command now removes SSL
  certificates of deleted domains from the domain SSL directory.

..

* *Issue ID:* CO-458

* *Title:* Multiple ClamAV databases support

* *Description:* Carbonio now supports multiple mirrors for the ClamAV
  database.

..

* *Issue ID:* CO-459

* *Title:* Colors and copyright string customization

* *Description:* Colours and copyright strings can now be customized
  at global and domain levels.

..

* *Issue ID:* CO-463

* *Title:* Carbonio mailbox token permissions fixed

* *Description:* The zextras user is now able to run `zmmailboxdctl`
  command. No more permission fix needed during server installation
  and upgrade.

..

* *Issue ID:* CO-467

* *Title:* Multiple `DatabaseCustomeURL` values allowed

* *Description:* Sysadmins are now able to add multiple values to
  `DatabaseCustomeURL` so in case of failure, Clamav can check the
  next link and doesn't stop the update procedure.

..

* *Issue ID:* CO-474

* *Title:* Missing file added

* *Description:* Added `migrate20221110-AddIndexLocatorOnMailItem.pl`
  file which was missing.

..

* *Issue ID:* COR-808

* *Title:* buildContainerFromStringsMap NullPointerException fixed

* *Description:* The command can now handle null values experienced in
  some corner cases.

..

* *Issue ID:* COR-818

* *Title:* License auto renewal fixed for ISPs

* *Description:* Autorenewal is now working as expected for ISP
  licenses.

.. rubric:: Component: Mails

* *Issue ID:* IRIS-3014

* *Title:* Shared folder revokation fixed

* *Description:* Fixed a bug that caused the shared folder permissions
  to be broken on revoking a grant.

..

* *Issue ID:* IRIS-3097

* *Title:* Search button fixed

* *Description:* Fixed a bug that caused the search button not to work
  properly. Now the button works as expected.

..

* *Issue ID:* IRIS-3235

* *Title:* Calendar event duplication

* *Description:* A user can now create a calendar event by copying an
  existing one and they can have the editor of the new event fill in
  all of the information from the copied event.

..

* *Issue ID:* IRIS-3383

* *Title:* Attachment reminder improved

* *Description:* The reminder showed when "attachment" word is present
  in the body of an email no more considers the quoted text.

..

* *Issue ID:* IRIS-3434

* *Title:* Multiple actions support on filter

* *Description:* Multiple actions support has been added to email
  filters so users can add more than one action when filtering the
  emails.

..

* *Issue ID:* IRIS-3440

* *Title:* Not-responded appointments icon improved

* *Description:* The icon of not-responded appointments has been
  placed on the left of the title so that already replied appointments
  and those still waiting for action can be easily distinguished.

..

* *Issue ID:* IRIS-3455

* *Title:* Virtual meeting reminder improved

* *Description:* It is now possible to access the meetings directly
  from the relative reminder.

..

* *Issue ID:* IRIS-3461

* *Title:* Email editor honours the language setting

* *Description:* The email WYSIWYG editor is now translated according
  to the language chosen by the user.


..

* *Issue ID:* IRIS-3476

* *Title:* Appointments invitation displayed on calendar

* *Description:* Appointments invitation now adhere to "add received
  appointments to calendar" setting. If the user chooses not to add
  invitations, they're only shown when the user accepts them from the
  invitation email.

..

* *Issue ID:* IRIS-3477

* *Title:* Tag filter in advanced search fixed

* *Description:* When you select a tag from the filter, it is now
  applied to the emails in the advanced search.

..

* *Issue ID:* IRIS-3503

* *Title:* Implemented Mark as Read Management Feature

* *Description:* Now users can choose between automatically or
  manually marking a message status as Read

..

* *Issue ID:* IRIS-3504

* *Title:* Notify attendees when edit current appointment

* *Description:* Attendees are now notified when drag and dropping an
  appointment in a different date/time.

..

* *Issue ID:* IRIS-3506

* *Title:* Sorting of “recently emailed contacts“ in alphabetical
  order.

* *Description:* The recently emailed contacts are now listed in
  alphabetical order.

..

* *Issue ID:* IRIS-3512

* *Title:* Mail filter redirect fixed

* *Description:* It is now possible to type any email address in
  options > mail > filter > redirect.

..

* *Issue ID:* IRIS-3536

* *Title:* Share list in folder's property added

* *Description:* Added the list of granted accounts to the folder's
  property.

..

* *Issue ID:* IRIS-3538

* *Title:* Added usernames to Calendar shares

* *Description:* Usernames are properly displayed under Calendar
  shares (Calendar > Edit Calendar Properties > Sharing of this
  folder)


..

* *Issue ID:* IRIS-3541

* *Title:* Signature is correctly transformed to plain text, when user
  asks to change from HTML to Plain text in the mail editor

* *Description:* When a user is sending a text only email, it's
  signature is correctly transformed to plain text in the mail editor.

..

* *Issue ID:* IRIS-3551

* *Title:* Black tag of appointments fix

* *Description:* Fixed a bug that caused the black tags to break the
  user interface on applying to an appointment.

..

* *Issue ID:* IRIS-3559

* *Title:* Automatic sender selection

* *Description:* The sender address is automatically selected when
  multiple aliases are set for the account.

..

* *Issue ID:* IRIS-3567

* *Title:* Send later feature fixed

* *Description:* Fixed a bug which prevented the send later feature to
  work properly.

..

* *Issue ID:* IRIS-3570

* *Title:* Large preview of calendar's appointments fixed

* *Description:* Fixed the large preview of appointments on receiving
  an invitation from Microsoft Teams.

..

* *Issue ID:* IRIS-3583

* *Title:* Appointment save button logic change

* *Description:* No more notification is sent on saving an appointment
  in the calendar. Now the "Save" button only saves it and permits
  further changes.

..

* *Issue ID:* IRIS-3588

* *Title:* Private appointment UI fixed

* *Description:* Fixed a bug that caused the user interface to break
  on opening a private appointment in the calendar.

..

* *Issue ID:* IRIS-3593

* *Title:* Dropdown menu closure fixed

* *Description:* All drop-down menus in the calendar now close after
  clicking on any action or point on the screen.

..

* *Issue ID:* IRIS-3595

* *Title:* Inline images in mail body fixed

* *Description:* Fixed a bug that prevented the images from being
  displayed when a space or a comma is present in its name.

..

* *Issue ID:* IRIS-3596

* *Title:* Spreadsheets completely shown in mail body

* *Description:* Spreadsheets are now completely shown inline. If the
  table is too big, scroll bars are displayed.

..

* *Issue ID:* IRIS-3598

* *Title:* Incorporate data-testid in Mails

* *Description:* All of the "data-testid1" as described in the parent
  issue have been implemented.

..

* *Issue ID:* IRIS-3599

* *Title:* Added data-testid parameters to Calendars page

* *Description:* The parameters 'data-testid="CalendarToolbar"',
  'data-testid=”CurrentDateContainer”', 'data-testid="WorkWeekButton"'
  and 'data-testid=”calendar-event”' were added to 'Calendars' webmail
  page

..

* *Issue ID:* IRIS-3609

* *Title:* Multiple personas selection as mail sender

* *Description:* The sender can now choose the email address on
  sending an email when multiple aliases are added.

..

* *Issue ID:* IRIS-3622

* *Title:* Eml attachments view support

* *Description:* Eml attachments can now be opened from the webmail.

..

* *Issue ID:* MOB-396

* *Title:* Appointments replies synchronization fixed for iOS

* *Description:* Fixed a bug that caused iOS mobile devices to
  synchronize replies to calendar appointments multiple times.

.. rubric:: Component: Mobile/EAS

* *Issue ID:* MOB-400

* *Title:* LDAP address book added

* *Description:* It is now possible to connect to the address book via
  LDAP.

.. rubric:: Component: Powerstore

* *Issue ID:* PS-436

* *Title:* Items in dumpster deletion bugfix

* *Description:* Fixed a bug that caused missing blobs for items in
  the dumpster when HSM policy retention was less than the dumpster's
  one.

.. rubric:: Component: Powerstore

* *Issue ID:* PS-455

* *Title:* None

* *Description:* Orphan Accounts Files/Chats delete
