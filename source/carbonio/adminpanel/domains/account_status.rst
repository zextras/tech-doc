.. _ap-account-status:

Account Statuses
================

A user account can be in one of the following statuses.

#. **Active**. The account is enabled and ready for everyday
   operations: the user can log in and send and receive e-mails.

#. **Under Maintenance**. This state occurs during maintenance operations
   on the domain or account: backup, import, export, restore. The
   user can not login, e-mails are queued on the MTA.

#. **Locked**. The account can not be accessed by the user, but
   incoming e-mails are still delivered. This status can be set for
   example if the user violates the terms of service or if the
   account has been cracked

#. **Closed**. The user is not allowed to log in, incoming e-mails
   are rejected.

#. **Pending**. This status is usually seen during the account
   creation, when it is not yet active. User can not log in,
   incoming e-mails are rejected.

#. **LockOut**. This is the only status that can not be set. It is
   applied automatically when the log in attempts fail for a given
   number of times. It is a preventive measure to avoid
   unauthorised access of brute force attacks. The account will not
   be accessible for a given interval (*"lockout period"*)

   .. hint:: Both the number of failed attempts and the lockout
      period can be configured.

The status of an account also influences the items stored in that
user's |file|: Whenever an account is in *Closed* status, the item
shared by that user are no longer visible to the users who could
access it.

.. index:: ! Alias, Account; alias