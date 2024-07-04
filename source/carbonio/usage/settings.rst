.. _settings-comp:

Settings
========

.. include:: /_includes/_usage/usage-settings.rst
.. include:: /_includes/_usage/settings-mails.rst
.. include:: /_includes/_usage/settings-calendars.rst
.. include:: /_includes/_usage/settings-contacts.rst
             
.. _settings-auth:

Auth
----

.. card:: Change Password
   :class-header: sd-font-weight-bold irisfont

   To change your  password, write in the first box the old one and
   then type twice the new one.

   .. include:: /_includes/hint-pwd.rst


.. card:: Recovery Address
   :class-header: sd-font-weight-bold irisfont

   To add a recovery address, you need to provide a valid e-mail
   address, to which a validation code will be sent. You need to enter
   this code before the recovery e-mail address is verified and can be
   used.
   
   You can modify the recovery address at anytime:
   :bdg-danger-line:`REMOVE` the current address, then follow the same
   procedure described in the previous paragraph.

.. card:: Exchange ActiveSync
   :class-header: sd-font-weight-bold irisfont

   When using this authentication method, you need to provide a
   description (that can serve as a hint for its usage). You will then
   receive an authentication code to use as password. In case you
   forget the password, you can generate a new one. When you delete
   one authentication code, all devices that are using it will be
   immediately disconnect.

.. card:: Mobile Apps
   :class-header: sd-font-weight-bold irisfont

   You can generate an authentication token, in form of a QR code,
   that you can scan from a mobile device to activate the |product|
   client. Since the QR code is shown only once, use the
   :bdg-primary-line:`COPY QR CODE` button to copy the string (encoded
   by the QR code) and store it in a safe place. When you delete one
   authentication code, all devices that are using it will be
   immediately disconnect.

.. card:: OTP Authentication
   :class-header: sd-font-weight-bold irisfont

   Similar to the previous one, you can create an OTP authentication
   token that will create a QR code to be scanned from a mobile
   device. Additionally, a set of pin codes is generated, to be used
   as one-time password for authentication.
