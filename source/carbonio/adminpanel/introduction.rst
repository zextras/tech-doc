.. _adminpanel:

|adminui| Overview
==================

|adminui| is the component that allows access to the administration
functionalities of |carbonio|.  Like for every other component, it can
be reached using a :ref:`supported browser <browser_compatibility>`
and point it to https\://acme.example:6071/, replacing `acme.example`
with your domain.

Getting Started with the Carbonio Admin Panel
---------------------------------------------

To access the |adminui|, you need an account that is marked as
**Administrator**. The installation process creates by default one
Global Administrator, whose username is ``zextras@acme.example``, but
its password is empty and needs to be configured from the CLI using
the command shown in Section :ref:`change-pwd`. When a password
expires and the Admin tries to login, an informative dialog will be
show, which allows to change password.

Once logged in, more Admins can be added from the |adminui|;
please refer to section :ref:`ap-new-admin` for directions.


.. card:: The ``zextras`` and ``zextras@example.com`` users

   There is a clear distinction between these two users, which are
   intended to execute different tasks:

   ``zextras``
      This the **unix** account of the administrator and must be used to
      carry out administrative tasks from the command line.

   ``zextras@example.com``
      This is the default administrator user to be used to access the
      Admin UI and manage |product| from the web interface.

|adminui| allows to manage the |product| domains, mailstores,
accounts, |cos|, and privacy settings. The overall organisation of the
panel is similar to the others components: a the *Top Bar* allows
quick creation of a new domain or COS by clicking the |create| button,
while navigation items are on the left-hand column.

.. note::
   
   Any input field marked with an asterisk (*) will be treated as mandatory.
   The system prevents form submission when required fields are left empty.
   For example, see the image below:

   .. figure:: /img/adminpanel/asterisk-example.png
      :width: 60%
      :name: asterisk-example.png

The landing page is shown in :numref:`fig_ap-top` and
:numref:`fig_ap-bottom`.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item::
      :columns: 6

      .. _fig_ap-top:

      .. figure:: /img/adminpanel/AP-landing-top-cb.png
         :width: 100%

         The upper part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      The upper part contains information about the logged in
      administrator, the version of |product| and, on the top-right
      corner a user menu to be clicked to go to the documentation or
      log out, right above the date and time of the last login.

      Moreover, clicking on either of the boxes will open the
      |adminui| page for the Accounts and distribution list,
      respectively.

      The list of Notifications follows: click the `GO TO
      NOTIFICATION` button to open the :ref:`dedicated page
      <ap-notifications>`.

      A banner will be shown in case the Maintenance is expired, which
      upon clicking will take you to the :ref:`ap-subscriptions` page
      where you can check the license details and enter a new token.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item::
      :columns: 6

      .. _fig_ap-bottom:

      .. figure:: /img/adminpanel/AP-landing-bottom.png
         :width: 100%

         The lower part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      In the lower part are shown the versions of |carbonio| and of
      |carbonio| Core for all the servers defined within the
      |carbonio| infrastructure. The button `GO TO MAILSTORES SERVERS
      LIST` allows to open the :menuselection:`Storage --> Global
      Servers --> Server List` page (see :ref:`ap-storage`).


Logout New Behavior for Webmail and Admin Panel
-----------------------------------------------

An administrator can sign in using the same credentials to both the Webmail and the Admin Panel at the same time
maintaining two separate active sessions: one for each interface.

Logging out from one interface now affects only that interface.

- Logging out of **Webmail** terminates the Webmail session only. The user remains signed in to **Admin Panel**.
- Logging out of **Admin Panel** terminates the Admin Panel session only. The user remains signed in to **Webmail**.

Previously, logging out from either interface would end the session for both.
This behavior has been changed so each logout action is isolated to its own UI.
Each interface now manages logout independently.


Using 2FA from Untrusted Networks
=================================

To enhance security, Carbonio can require Two-Factor Authentication (2FA) specifically when you sign in from an **untrusted network**. 
Whether a network is considered trusted or untrusted depends on how your administrator has configured the system. 
Examples of untrusted networks include your home Wi-Fi, public hotspots, or any network outside your organization's trusted corporate environment.

How it Works
------------

When you log in from an untrusted network, the system checks if you have a second-factor authenticator (OTP) configured.

* **If you already have 2FA configured:** You will be prompted to enter your username, password, and the 6-digit code from your authenticator app.
* **If you have NOT configured 2FA:** Depending on your organization's security policy, you will either be guided through a setup wizard or asked to contact your administrator.

Setting Up 2FA Remotely
-----------------------

If your administrator allows remote enrollment, you can set up your 2FA directly from the login screen via the **2FA Setup Wizard**:

1. **Scan the QR Code:** Open your preferred authenticator app and either scan the QR code displayed on your screen or, 
   if you can’t scan the QR code, enter the secret code directly into the application.
2. **Verify:** Enter the 6-digit verification code generated by the app to link it to your account.
3. **Login:** Once verified, you will be granted access to your account.

Understanding the Grace Period
------------------------------

If your organization has enabled a **grace period**, you can temporarily access your account before 2FA becomes mandatory.

* The **2FA Setup Wizard** is displayed each time you sign in until you complete the setup.
* You must complete the setup before the grace period expires. If the period ends and you have not configured 2FA, you will be unable to sign in from an untrusted network and will need to contact your system administrator for assistance.

.. note:: 
   Always complete the 2FA setup as soon as possible to avoid losing access when the grace period ends.


Unless a grace period is configured, you must complete the 2FA setup before you can sign in. 
After setup, every sign-in requires your username, password, and a one-time passcode (OTP) generated by your authenticator app.