Enforcing OTP for 2FA users
===========================

Starting from release 26.3.0, |product| introduces an OTP enforcement mechanism
for domains where **Two-Factor Authentication (2FA)** is enabled.

This mechanism ensures that users are guided to complete their **OTP (One Time Password) configuration**,
preventing long-term use of accounts with incomplete 2FA setup and improving overall security.

.. figure:: /img/concepts/otp-enforcement-flow.png
   :alt: OTP enforcement flow for 2FA-enabled users
   :align: center
   :width: 60%

   OTP enforcement decision flow. When 2FA is enabled, users already logged in
   without OTP configured may be prompted to complete the setup.

.. important::

   OTP enforcement applies only to users who are already logged in at the moment
   2FA is enabled. It does not affect the login flow directly.

Overview
--------

When 2FA is enabled at domain or global level, the system evaluates users
who already have an active session.

If a logged-in user is required to use 2FA but has not configured an OTP method,
they will be prompted to complete the setup through a dedicated wizard.

This mechanism is designed to encourage OTP adoption without immediately
interrupting user activity.

For administrators, this means:

* Active sessions may be notified or redirected to OTP setup
* Users can be guided to complete OTP configuration
* No immediate lockout is applied during the current session

.. figure:: /img/concepts/otp-enforcement-1.png
   :alt: OTP enforcement message
   :align: center
   :width: 60%

   OTP enforcement message.

When OTP setup is triggered
---------------------------

The OTP setup wizard may be triggered when all the following conditions are met:

* 2FA is enabled at **domain or global level**
* The user is **allowed to configure their own OTP**
* The user has **no OTP method configured**
* The user already has an **active session**

When these conditions are satisfied, the user may be redirected to the OTP
setup wizard during their session.

User experience
---------------

When the OTP setup is triggered:

* The user may be redirected to a **setup wizard during their active session**
* The wizard provides step-by-step guidance to configure OTP
* The user can continue using |product| services during the session

.. figure:: /img/concepts/otp-enforcement-2.png
   :alt: OTP enforcement wizard
   :align: center
   :width: 60%

   OTP enforcement wizard.

If OTP is already configured, or the user is not eligible for OTP setup,
no action is taken and the session continues normally.

.. note::

   The OTP setup wizard is intended as a guidance mechanism during active sessions.
   It does not enforce a strict access block in this phase.

See also
--------

The following resources provide additional information about authentication
and OTP management in |product|:

* 2FA section in the Admin Panel: :ref:`domain-2fa`
* 2FA section in Admin by Command Line: :ref:`policy-management-2fa`

.. note::

   The exact availability of OTP features depends on the domain configuration
   and user permissions defined by the administrator.