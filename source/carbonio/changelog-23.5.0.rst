.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


Changelog |release|
===================

Release Date: May 15th, 2023


New Features List
-----------------

**IRIS-3953: Carbonio Web UI subfolders not expanded**
   When open Carbonio Web UI first time, subfolders are not expanded.
   
.. 


**IRIS-3208: Max number of chips in the contact input increased**
   Now Max number of chips in the contact input increased from 20 to 1000 for To, CC and BCC
   
.. 


**DOCS-171: Docs installation ignores consul UUID**
   When docs editor package is reinstalled it should ignore consul UUID for old entry when execute pending-setups.
   
.. 


**DOCS-169: can see details of other collaborators when edit a document**
   Now we can see details(user name)  of other collaborators when others edit a shared document
   
.. 


**COR-842: Move the operation log to PostgreSQL**
   The operation logs have now been migrated to Postgres.
   
.. 


**CO-659: Disable antivirus feature**
   Added feature for admin disable amavis antivirus.
   
.. 


**CO-597: Carbonio-clamav as service in consul mesh**
   ClamAV is now registered in consul mesh as service as well as
   carbonio-clamav upstream has been added for carbonio-mta.  The
   carbonio-bootstrap maps the carbonio-clamav to antivirus
   service. Carbonio-clamav has been renamed to
   carbonio-antivirus. And using carbonio-bootstrap script, the value
   (true/false) of carbonio-antivirus can be modified.  Also,the
   bootstrap script gives an option to modify the notification address
   for AV alerts.
   
.. 


**CO-592: Modify default value for zimbraSmtpRestrictEnvelopeFrom**
   Modify the default value of "zimbraSmtpRestrictEnvelopeFrom" attribute from  TRUE to FALSE to improve the default management of bounce messages as the SPF alignment breaks if the return path is not the same as that of the "From" address.
   
.. 


**AC-500: Admin can clear the user password from LDAP**
   Admin can now empty the user password from LDAP using the admin panel.
   
.. 


**AC-446:  Admin can manage user application credentials**
   Now Admin can manage user application credentials through the admin panel.
   
.. 


**AC-417: The AD configuration can verify login**
   The AD configuration can now validate login using the login verify.
   
.. 


**AC-380: Admin can manage galsync account**
   Now the admin can create and delete GalSync accounts post domain creation from the admin BUGFIX.
   
.. 


Bugfix List
-----------

**SHELL-73: Closing one board tab, another board tab work correctly**
   Now closing one board tab, another board tab work correctly as expected
   
.. 


**SHELL-47: Moving from a component to another the view is not resetting**
   Now Moving from a component to another the view is not resetting
   
.. 


**PS-459: S3 bucket validation enhanced**
   To improve the `testS3Connection` command, a file is now uploaded on the bucket, read and finally deleted to confirm that the bucket is properly working.
   
.. 


**PREV-110: PDF thumbnail work in file upload**
   Now PDF  thumbnail working in file upload windows
   
.. 


**MOB-407:   Attachment's name encoding via EAS fixed**
   Fixed a bug that caused the attachment's names with non-ASCII characters to be wrongly encoded when synchronizing via EAS.
   
.. 


**IRIS-4241: The drag of a message or conversation is working as intended**
   Drag a message item from one folder to onther folder is working as intended
   
.. 


**IRIS-4240: new appointment enhanced**
   While creating a new appointment, you can now write normally and simply inside the board's text field.
   
.. 


**IRIS-4238: Enhanced shared accounts**
   The moving message in the preview action now works on shared accounts. 
   
.. 


**IRIS-4160: Translations for files, mails, contacts, calendars as per selected language**
   Now translations for files, mails, contacts, calendars are being as per selected language. result as expected
   
.. 


**IRIS-3974: Resolved Truncated Email Text Issue**
   The issue "truncated text" occurs when reading an email where text between "<" and ">" characters is lost. This issue is present on the webmail UI and does not occur in the Carbonio mobile app.
   
.. 


**IRIS-3937: The Italian translation enhanced**
   While composing a fresh email In Italian, BCC is now translated to CCN. 
   
.. 


**IRIS-3841: Mails deletion UI bugfix**
   Fixed a bug that caused the deleted emails to still be displayed in the inbox after deleting them. Now the emails are removed from the inbox immediately after clicking the trash icon.
   
.. 


**IRIS-3524: Polish translation enhanced**
   The Polish translation has now been improved.
   
.. 


**IRIS-3353: Public shares for calender work**
   Public Share calaender is work as expected. All Steps to verify are passed
   
.. 


**FILES-638: User can open specific version of the document**
   Now user can open specific version of the document without any http 500 error
   
.. 


**FILES-629: Share button is translated to selected language**
   Now share button is translated to selected language as per setting language configured in user account.
   
.. 


**FILES-624: Search Button Accordion Translation Improvement**
   This improvement focuses on ensuring that the search button's accordion actions are correctly translated into the selected language.
   
.. 


**COR-905: Password change is functional**
   Users can now change their passwords. 
   
.. 


**COR-901: Domain admin not getting json error**
   Now Domain admin not getting json error when editing account
   
.. 


**CO-695: Fix NoOp SOAP Request Failures**
   This improvement fixes the NoOp SOAP Request when users log in to an account
   
.. 


**BCK-685: setBackupVolume usage example has been enhanced**
   All setBackupVolume commands in the "Usage Example" section have been improved.
   
.. 


**AUTH-521: Delegated  Admin can manage user's OTP and Application Credentials**
   Now Help Desk (Domain) Admin can manage user's OTP and Credentials
   
.. 


**AC-575: DL and GAL button label text are fixed**
   The user interface in the mailing list and GAL step improved, specifically the size of the DL and GAL  button, the default behaviour has been enhanced by scaling the button to appropriately display the text.
   
.. 


**AC-532: Fields not blinking from delegated admin**
   When logged in as a delegated admin, the Public service protocol and time zone fields no longer blink.
   
.. 


**AC-526: GalSync LDAP Filter  enhanced**
   The GalSync LDAP Filter has been updated by replacing gn with the right value giveName
   
.. 


**AC-522: The domain deletion enhanced**
   The deleted domain has been removed from the domain list, and the resources are no longer available from anywhere.
   
.. 


**AC-519:  Size of "Change to" button fixed in GAL setup**
   The user interface in the GAL setup has been improved, specifically the size of the "Change To..." button, the default behaviour has been enhanced by scaling the button to appropriately display the text.
   
.. 


**AC-478: The restore account wizard enhanced**
   The restore account wizard has been improved by allowing you to proceed only if the account to be restored is selected.
   
.. 

