.. _restore-account:

Restore Account
===============

The *Restore Account* procedure allows you to restore the contents and
preferences of a mailbox in the exact status when it was deleted.

When a Restore Account starts, a new account is created (the
*Destination Account*), and all the items existing in the source
account at the moment of the deletion are recreated in the destination
account, including the folder structure and all the user’s data. All
restored items will be created in the current primary store unless the
**Apply HSM Policy after the restore** box is checked.

.. warning:: When restoring data on a new account, shared items
   consistency is not preserved. This is because the original share
   rules refer to the original account’s UUID, not to the *Destination
   Account*, which has a completely different UUID.

To start the procedure, type an e-mail address in the text-field or
select an account from the list.

Then, click on the :blue:`CONFIG` tab and select the options to apply for
the Restore:

* To which date and time to restore the account
* On which domain the account should be restored
* Whether to use the last available status of the account
* If External Data Sources should be restored
* Select an e-mail to which send a notification of the successful
  restore.

  .. hint:: This could be the alternate e-mail of the user whose
     account is being restored.
