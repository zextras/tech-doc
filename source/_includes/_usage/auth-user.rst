.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|auth| features a dedicated settings page (see :numref:`auth-page`)
to manage all user-side credential and features, such as the account
and EAS Mobile Passwords, Mobile App QR Codes, and OTP for 2FA.

.. _auth_settings_overview:

|auth| settings page overview
-----------------------------

The |auth| settings page can be accessed from the right-hand side
menu. Users do not need any CLI access to use the |auth|.

The creation of a new credential allows to give access to the account,
possibly including the Zextras Mobile Apps, to other persons without
having to share the personal credentials.

.. _auth-page:

.. figure:: /img/auth/authpage.png
   :scale: 50%

   The |auth| settings page.

From the settings page, the user can:

- :ref:`Change the password <auth_change_pass>` of the currently
  logged in user

- **Add new credentials** in the dedicated pages, accessible by
  clicking :ref:`Exchange ActiveSync <auth_zimlet-create-eas>`,
  :ref:`Mobile Apps <auth_create_new_credentials_qr_code>`, or
  :ref:`OTP Authentication <auth_zimlet-create-otp>`

- **Check the status** and other information for all `Exchange
  ActiveSync` and `Mobile Apps` credential created. In each section,
  entries in the list display the label of the password, its status,
  the service it is valid for, and its creation date.

- **Check the status** and other information for every `One Time
  Password` created. Here, each entry shows a description, its status,
  the failed attempts, and its creation date.

- **Manage** the 2FA access. Each user can decide whether to enforce
  access using 2FA, unless its use has been enabled or disabled at
  COS, domain, or global level.
   
- :ref:`Delete <auth_delete_credentials>` any credential created

.. important:: Users can in no case modify their assigned username,
   change the password of credentials they generate, or modify any
   property of the credential. Limited editing of a credential is
   strictly limited to the administrators.

In the remainder of this section, we give an overview of the various
possibilities to create new credentials and provide instruction to add
or delete them them.

.. _auth_change_pass:

Change Password
---------------

In order to change password, click **Change Password**. Here, you need
to provide the current password, then enter twice a new one (see :numref:`auth-page`.

.. hint:: Make sure you use a robust password, which includes
   lowercase and uppercase letters, numbers, characters, and is at
   least ***8** characters long.

To save the new password, click the blue :bdg-primary-line:`CHANGE
PASSWORD` button.

.. _auth_zimlet-create-eas:

.. _auth_zimlet-create-mobile:

Create New Credentials: EAS
---------------------------

To create a new Password for :abbr:`EAS (Exchange ActiveSync)`
service, click `Exchange ActiveSync`, then
:bdg-primary-line:`NEW AUTHENTICATION +`.
Here, enter an easy to remember identifier for the password in the
*Authentication description* field.

.. figure:: /img/auth/eas1.png
   :scale: 50%
           
Then click :bdg-primary:`CREATE PASSWORD`: the new Mobile Password
will be displayed.

  .. figure:: /img/auth/eas2.png
     :scale: 50%

Finally, click the :bdg-primary-line:`COPY PASSWORD` button to copy
the password to the clipboard.

.. warning:: Mobile Passwords are randomly generated and cannot be
   displayed again after the creation is complete.

Click :bdg-primary:`DONE` to close the |auth| window. An entry
for the new Mobile Password is now visible in the *Active Passwords*
list of the |auth| Zimlet.

.. _auth_create_new_credentials_qr_code:

Create New Credentials: Mobile Apps
-----------------------------------

..
   |auth| can speed up and manage Zextras Application logins, such
   as those for the :ref:`Team Mobile App <team_mobile_app>` and
   :ref:`Drive Mobile App <drive_mobile_app>`.

|auth| can speed up and manage Zextras Application logins, such
as those for the :ref:`mobile_apps`.   
This is achieved through the creation of a QR Code, which the user can
then scan from the App’s login page to log in. The procedure is very
similar to the one described in the previous section.

.. warning:: QR Codes are a one-time credential only, meaning that
   once generated it will grant access to the app until the relevant
   credential itself is deleted from the account. Once generated, the
   QR Code can only be viewed once.

In order to create a new QR Code for Mobile Application, open the
|auth| Zimlet and click `Mobile Apps`, then
:bdg-primary-line:`NEW AUTHENTICATION +`.
Here, enter an easy to remember identifier for the password in the
*Authentication description*.
Click :bdg-primary:`CREATE PASSWORD` and the new QR code for Mobile
Application will be displayed. You can use the Zextras mobile app to
frame the code and grant access to the app.

.. commenting out due to a description error in the modal
   .. figure:: /img/auth/qrcode1.png
      :scale: 50%

.. warning:: QR Codes are randomly generated and cannot be displayed
   again after the creation is complete.

Click :bdg-primary:`DONE` to close the |auth| window. An
entry for the new Mobile Application is now visible in the *Active
Passwords* list of the |auth| Zimlet.

.. _auth_zimlet-create-otp:

Create New Credentials: OTP
---------------------------

In order to create a new One Time Password access, open the |auth|
Zimlet and click **OTP Authentication**, then :bdg-primary-line:`NEW
OTP +` to open a dialog in which you have to enter a unique label to
identify the OTP.

.. figure:: /img/auth/otp1.png
   :scale: 50%

You will be presented with the QR code: scan it with your smartphone
or copy it (as string) to the clipboard, then click
:bdg-primary:`NEXT` to see the list of PIN codes to be used for
authentication.

.. grid:: 1 1 2 2 
   :gutter: 1
            
   .. grid-item::
      :columns: 6

      .. figure:: /img/auth/otp2a.png
         :scale: 50%

   .. grid-item::
      :columns: 6

      .. figure:: /img/auth/otp2b.png
         :scale: 50%

Next, click the :bdg-primary-line:`PRINT PIN CODES` button to print the
codes on paper or to a file. The printed document includes all the
codes, the username/e-mail address for which they are valid and
instructions to use them.

.. figure:: /img/auth/otp3.png
   :scale: 50%
   :align: center

.. warning:: QR codes and their associated PINs are randomly generated
   and cannot be displayed again after the creation is complete.

Finally, click :bdg-primary:`DONE` to close the |auth|
window. An entry for the new OTP entry will be shown in the list.

.. note:: The *Description* is automatically created using the email
   address to which it is associated.

.. _auth_delete_credentials:

Delete Credentials
------------------

In order to delete a credential, simply select it from the list of
Active passwords or OTPs, and click the :bdg-danger-line:`DELETE x`
button:

.. image:: /img/auth/delete_credential.png
   :width: 30%

Click :bdg-danger:`YES` to confirm the removal of the credential.
