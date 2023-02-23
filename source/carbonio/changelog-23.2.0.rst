.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Changelog - Release 23.2.0
===================================

Release Date: February 23rd, 2023

.. rubric:: Component: Admin Console & Login UI

**AC-407: Domain selector should show default list of domains**
   In the admin console, after clearing the domain selector, it now shows the default list of domains instead of the filtered one.

.. 


**AC-379: Account status displayed in the admin console**
   The account status is now displayed correctly in the admin panel; if the account is locked out, it is displayed there.

.. 


**AC-352: Admin COS Locale management**
   Admins are now able to manage the default user Locale from the Class of Service

.. 


**AC-336: Login page logo URL redirection**
   Admin can modify the URL to be redirected when users click on the login page logo

.. 


**AC-329: Single-user password policies management**
   Features for the admin being able to change single-user password policies were added.

.. 


**AC-291: Carbonio Advanced operations list Running and Queued**
   Now in Carbonio, Admin can manage running and queued operations through the admin panel.

.. 


**AC-81: Create volume refactored**
   It is now possible to create both local and remote volumes from the admin console. Now volumes can also be set as current while creating them.

.. 

.. rubric:: Component: Mails

**IRIS-3889: Clients timezone bug when missing fixed**
   Fixed a bug that caused the user interface to raise an error when editing an appointment in the calendar, showing its timezone, but it was not in the list of known ones.

.. 


**IRIS-3781: Spaces ignored on searching contacts**
   When searching a contact, leading and trailing white spaces are now ignored to avoid missing results.

.. 


**IRIS-3735: BBC mail sender on reply**
   The sender field is now set to the default address when replying to BCC/redirected emails or when the recipient's address is not one of the account's identities.

.. 


**IRIS-3723: Edit appointments already sent to attendees**
   Users can now edit the appointments which are already sent to the attendees.

.. 


**IRIS-3683: Draft saved message**
   Messages saved in the draft folder are now opened for editing when double-clicked.

.. 


**IRIS-3682: Fixed Sender Field changes in "Draft"**
   When opening a message from "Draft," the sender field contains the value that was previously set when the "Draft" was created.

.. 


**IRIS-3678: Multiple reply editor improvement**
   Opening two or more reply tabs for the same email message editor have the subsequent tabs not containing text from the opened previously editor tab

.. 


**IRIS-3667: Link to virtual room in appointment's invitation**
   It is now possible to click on the virtual room link when receiving an invitation to an appointment.

.. 

**IRIS-3656: Sender address of shared accounts on reply**
   In a scenario where an account has multiple personas and multiple
   shared mailboxes, on replying to an email that is received by more
   than one of its accounts, the sender address is chosen based on the
   folder from which the user is replying to.

..

**IRIS-3610: Signature with clickable images**
   Images/Logo is now clickable when it has a link to an external page.

.. 


**IRIS-3539: Copy or send email in calendars**
   It is now possible to copy an email address from an appointment or send an email simply by clicking on the relative icon near it.

.. 


**IRIS-3475: Appointment edit page improvement**
   A user can no more edit a calendar appointment if he's not the owner and doesn't have write permissions on it.

.. 


**IRIS-3473: Custom colours for user interface**
   The end user's interface can be customized with custom colors as per the business requirement.

.. 


**IRIS-3450: Trash folder position**
   The trash folder is now always positioned just after the other default folders even when custom folders are present.

.. 


**IRIS-3443: Local copy of the Roboto font**
   Now UI uses a local copy of the Roboto font instead of downloading it from Google.

.. 


**IRIS-3144: Empty address book fixed**
   Emptying the address book by right-clicking it and choosing the empty feature is working fine now.

.. 

.. rubric:: Component: Backup

**BCK-681: Smart scan operation fixed**
   Fixed a bug that caused items to be skipped when interrupting a Smart Scan operation.

.. 


**BCK-679: Undelete operation fixed**
   Fixed a bug that caused the `doUndelete` operation to fail the restoration of some items and stop in some corner case scenarios.

.. 

.. rubric:: Component: Carbonio

**CO-504: Consul Multiserver setup download credentials tar**
   When setting up a multi server infrastructure, Service discover downloads the credentials tar from LDAP

.. 


**CO-501: Authentication cookies remove after logout**
   When a user logout, both `ZM_AUTH_TOKEN` and `ZX_AUTH_TOKEN` cookies are now removed. Same, when an admin logout, the admin authentication cookie `ZM_ADMIN_AUTH_TOKEN` is removed.

.. 


**CO-495: Logo URL attribute improved**
   Carbonio logo URL now uses `carbonioLogoUrl` as the attribute name in LDAP.

.. 


**CO-494: Carbonio Admin login page redirection**
   Admin is now redirected to the proper `/static/login/` path on logging in to the admin console.

.. 


**CO-477: zimbraMailCatchAllForwardingAddress attribute assign to the target domain**
   It is now possible to send an email to domain alias account and it will be delivered to target domain account.

.. 


**CO-304: zmcbpolicydctl fixed**
   Fixed a bug that caused `zmcbpolicydctl` command to show an error when started.

.. 


**CO-25: Address book addressed to port 8636**
   The address book service now listens on port 8636 with a valid SSL certificate.

.. 

.. rubric:: Component: Core

**COR-850: Notifications sender and destination addresses**
   The administrator can now specify the sender and destination email addresses of the notifications.

.. 


**COR-822: CarbonioLogoURL is included in LDAP attributes**
   Now `carbonioLogoUrl` is included in Carbonio LDAP to manage the URL used by the logo on the login page.

.. 

.. rubric:: Component: Mobile/EAS

**MOB-397: StartTime change on accepting an appointment fixed**
   Fixed a bug that caused the `StartTime` value of an accepted appointment to change to the current date/time when synchronizing via EAS 14.0 and lower.

.. 


**MOB-393: StartTime change on accepting an appointment fixed**
   Fixed a bug that caused the `StartTime` value of an accepted appointment to change to the current date/time when synchronizing via EAS 14.1.

.. 

.. rubric:: Component: Powerstore
