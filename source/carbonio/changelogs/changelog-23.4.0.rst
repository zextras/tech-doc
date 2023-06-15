.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _changelog-23.4.0:

================
Changelog 23.4.0
================

This is the Changelog for |product| 23.4.0, released on April
17th, 2023.

.. rubric:: Component: Admin Console & Login UI

**AC-523: Local copy for fonts**
   To increase privacy, Carbonio now uses a local copy of Roboto font instead of downloading it from internet

.. 


**AC-482: LDAP configuration validation in GAL panel**
   The default behaviour has been improved by displaying if the LDAP URL is valid or invalid. This improvement addresses the user interface enhancement in the Global Address List (GAL) settings, specifically the LDAP URL validation, which warns the admin if the URL is invalid by changing the colour of the text present in the "External Server Address" field. 

.. 


**AC-436: Admin can manage distribution list aliases**
   The administrator can now manage distribution list aliases from the admin console.

.. 


**AC-427: Permit admin to force  domain deletion**
   Admin can now delete domains with the warning "Domain [domain name] is not empty and contains X Accounts, X System Accounts, X Distribution list, X Aliases, X Resources".

.. 


**AC-402: Volume management refinements**
   General refinements of volume management panel in the admin console. An external volume now displays the correct attributes and can be edited. It shows details about the bucket name/prefix. The "is current" volume toggle behaviour has been fixed.

.. 


**AC-357: Admin UI supports whitelabel color settings**
   The Admin UI now allows for whitelabel or custom colour settings.

.. 


**AC-321: Add colors to theme management**
   Colours can now be managed using Hex colour codes via Global/Domain Theme Management.

.. 

*****

.. rubric:: Component: Mails

**IRIS-4095: Admin can manage "Redirect to Address" action in filter**
   An administrator can grant users access to the "Redirect to Address" action filter from CLI using the `zimbraFeatureMailForwardingInFiltersEnabled` attribute below.

.. 


**IRIS-4066: Long email conversations fixed**
   Long email conversations no longer flicker in Carbonio.

.. 


**IRIS-3911: Find Calendar Shares limit calendar list**
   The "Find Shares" option in the Shared Calendars module now only displays the calendars list.

.. 


**IRIS-3903: Appointment creation enhanced with aliases and identities.**
   Users can now create and edit appointments using aliases and identities.

.. 


**IRIS-3902: Default calendar for appointments**
   The users can now choose their default calendar, and the appointment composer uses it while creating a new appointment.

.. 


**IRIS-3896: Appointments creation improved**
   When creating a new appointment, the calendar selector list now hides trashed calendars.

.. 


**IRIS-3894: Scrollbar resets navigating mail folders**
   The scroll bar position now resets properly when navigating between different folders.

.. 


**IRIS-3827: Placeholders corrected in advanced filters**
   On the advanced filters panel, the labels for the fields 'From' and 'To' are now correctly displayed inside the component.

.. 


**IRIS-3826: Persona creation improved**
   Personas can now be created using the addresses set in `SendOnBehalfOf` or `sendAs` parameters.

.. 


**IRIS-3825: Search contacts  enhanced**
   The search contacts now include the shared address book.

.. 


**IRIS-3824: Address book is enhanced**
   The user can now select the destination address book while creating contacts, and they can see where the new contact is created by the string at the top of the form.

.. 


**IRIS-3795: Plain data of an appointment is visible to users**
   Users can now view an appointment's plain text content from the appointment's "show original" menu, which assists the user in the event of a display issue.

.. 

*****


.. rubric:: Component: Carbonio

**CO-620: Web loading performance improved**
   Carbonio proxy now compresses and caches static content served by Carbonio web apps before serving it. This reduces the time it takes for the page to load.

.. 


**CO-568: Increased LDAP password security**
   Carbonio now supports PBKDF2 and Argon2 encryption for LDAP passwords. A script for migrating from SHA512 can be found in `/opt/zextras/libexec/scripts/migrate20230217-AddArgon2.pl`.

.. 


**CO-562: Carbonio-bootstrap validates the address configuration.**
   During the Carbonio installation, the bootstrap checks now show a warning in case of hostnames pointing to a loopback address to avoid post-installation problems.

.. 


**CO-553: Calendar invitation bugfixes**
   The MIME and code of the appointment invitations have been fixed according to their RFC so they can now be parsed by all the clients.

.. 


**CO-536: CSP headers can added to improve security**
   Content security policy (CSP) headers have been added to improve the security of web resources served by the Carbonio proxy.

.. 

*****

.. rubric:: Component: Storages

**PS-460: MinIO and S3-like integration Improved**
   Improved the integration of MinIO and other S3-like cloud providers within the application. The changes include updating the core `testS3Connection` help, modifying command examples, implementing the v4 signature and setting it as the default value for better compatibility and functionality.

.. 


**PS-458: Custom SSL certs for object storages**
   Custom SSL certificates are now accepted to configure external object storage via HTTPS.

.. 

*****

.. rubric:: Component: Teams

**TEAMS-4026: Carbonio logo replaces Inside meetings**
   When a custom logo is configured, the Carbonio logo "powered by Zextras" is now removed or replaced inside meetings.

.. 


**TEAMS-4025: Customized logo in meetings**
   When a custom logo is configured in Carbonio, that logo is now used inside static pages of meetings.

.. 


**TEAMS-3971: Closed virtual room displays an error message**
   If the virtual room is closed/deleted and no longer exists, an appropriate error page is shown.

.. 

*****

.. rubric:: Component: SHELL

**SHELL-72: Creation of personas enhanced**
   When the user has a delegated `sendOnBehalf` and the relative persona is properly configured, he can now send the email using that address.

.. 


**SHELL-61: Custom logo on browser notifications**
   Now the custom logo is used in browser notifications.

.. 

