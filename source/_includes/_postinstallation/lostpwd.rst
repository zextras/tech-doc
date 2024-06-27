
.. index:: Lost password, password recovery

.. _password-recovery:

Lost Password
=============

If the Administrator has enabled the option, you can see a link
underneath the credential's text-fields, that allows you to recover
the password. Before you use it, however, you need to ask the
Administrator to set up a recovery account.

Active 2FA
----------

In case 2FA is active on |product|, there are two cases:

#. The request comes from a trustedIP (see Section :ref:`global-2fa`):
   this case is like the "standard" password recovery

#. The request comes from an untrustedIP: you need to provide also an
   **OTP token** to be able to complete the recovery process
   
