.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Release 23.3.0
==============

Release Date: March 20th, 2023


.. rubric:: Component: Admin Console & Login UI

**AC-496: Gal default name changed**
   The default GAL name for new domains is now `InternalGal`.

.. 


**AC-465: Richtext rendering fixed in admin console**
   Fixed an unwanted behaviour that caused the admins to experience rendering problems with the rich text editor while adding a new signature to a user account.

.. 


**AC-423: Delegate send settings introduced to account management**
   It is now possible to manage the delegate features from the account settings in the admin console.

.. 


**AC-410: Privacy settings in feedback panel improved**
   From the feedback panel, the administrator can now easily update the privacy settings.

.. 


**AC-408: Update Logo URL from theme management**
   Admin can now change the URL of the logo using theme management in the Carbonio domain or global preferences.

.. 


**AC-405: Admin can modify COS/User features**
   Features can now be activated/deactivated from the admin console in COS and user settings.

.. 


**AC-373: Quota reports downloadable**
   Domain administrators can now download Mailbox quota reports in CSV format for multiple accounts. 

.. 

*****

.. rubric:: Component: Mails

**IRIS-4011: Attached EML can be open in search results**
   Users can now open EML attachment files to emails even from the search results.

.. 


**IRIS-3962: Open appointments from search results**
   It is now possible to open appointments from search results.

.. 


**IRIS-3901: Calendars search results improved**
   The search now returns the last and the next 30 days' appointments as results.

.. 


**IRIS-3897: Add attachments from Files refactored**
   The add attachments from Files feature has been refactored so it's easier to add attachments and public links from Files.

.. 


**IRIS-3885: New mail notification popup redirection fixed**
   When clicking on a new mail notification popup the user is now redirected to the correct mail tab.

.. 


**IRIS-3821: White label compliance in users settings**
   Removed `Carbonio` and `Zextras` from the app versions in the user's general settings to comply with the white label design.

.. 


**IRIS-3777: Shared calendars group fixed**
   When you add a calendar from the "find shares" list, it is now added to the "shared calendars" group.

.. 


**IRIS-3760: Time span in appointments search added**
   The user can now specify the time range for which appointments can be searched.

.. 


**IRIS-3759: Appointments previews improvement**
   Now, both the small and large previews appear in the calendar at the same time.

.. 


**IRIS-3745: Room moderators added in appointments attendees list**
   Now the moderators of a virtual room are added to the attendees when the user creates an appointment and contextually creates a virtual room with moderators.

.. 


**IRIS-3740: Background color for selected emails improved**
   Focused emails, either selected or unread, are now distinguished from the others using a different background colour even when the user is moving through the list using the keyboard.

.. 


**IRIS-3672: Duplicated fields removed from advanced filter**
   The duplicated fields have been removed from the advanced search filters.

.. 


**IRIS-3663: EML attachments viewer**
   It is now possible to open EML files attached to emails.

.. 


**IRIS-3474: Appointments' icons moved to the left**
   The "private" and "action request" icons have been moved from the upper right to the upper left corner in the preview so they're visible also on appointments overlapping.

.. 


**IRIS-3255: "SELECT ALL" and "DESELECT ALL" buttons added**
   It is not possible to select and deselect all the emails in a list with a single click.

.. 

*****


.. rubric:: Component: Carbonio

**CO-544: Empty virtual hostname deletion**
   To remove `zimbraVirtualHostname`, administrators can now use `modifyDomain` with an empty parameter.

.. 


**CO-513: Unlisted accounts rejected by default**
   The feature for rejecting emails to non-existent recipients is now enabled by default.

.. 


**CO-499: `http` and `mixed` modes removed**
   Now, `http` and `mixed` mode are no longer supported by the Nginx configuration.

.. 


**CO-491: `Schedule-agent` header managed on CalDAV**
   Support to `Schedule-agent` header has been added in Carbonio when synchronizing a Calendar via CalDAV.

.. 

*****

.. rubric:: Component: Core

**COR-853: Documentation for `unloadMailbox` added**
   Added the documentation and examples for the `unloadMailbox` command in the CLI.

.. 


**COR-851: Auth API for SAML configuration**
   An API has been added to manage SAML configuration either via CLI or the admin console.

.. 

*****

.. rubric:: Component: Mobile/EAS

**MOB-398: Attachment's name encoding via EAS fixed**
   Fixed a bug that caused the attachment's names with non-ASCII characters to be wrongly encoded when synchronizing via EAS.

.. 

*****

.. rubric:: Component: Powerstore

**PS-456: Powerstore and Files performance improved**
   The interaction between Files and the Powerstore has been refactored to improve the way Nginx lookup and Memcached are used and reduce the number of threads.

.. 


