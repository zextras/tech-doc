.. _ap-lh:

Legal Hold
==========

A *legal hold* is a functionality that allows to preserve and protect
electronic data (for example e-mails and documents) for potential use
in legal proceedings or investigations.

.. seealso:: More details on how this functionality works on
   |product|, please refer to Section :ref:`backup-legal-hold`, where
   also the CLI counterpart of the functionality is described with
   examples.

In this page appears the list of all users defined on a domain
including their accounts status and legal hold status. To show only
the accounts put on legal hold, click the switch button on the top of
the page. To put an account in legal hold state, search for it or
click it on the list, then click the :bdg-primary-line:`SET LEGAL
HOLD` button. The same button will be used to unset the legal hold
status.

The :bdg-primary-line:`RESTORE` button allows to execute the *Restore
on a New Account* operation on the account, by providing some
information in the panel. You need to provide these mandatory data.

* A prefix that will be prepended to the existing account name

* The date after that will be used to restore the account. All the
  e-mails after that date included will be restored.

* the e-mail addresses of the local users entitled to access the
  restored account.

Optionally, you can include in the restored account the deleted items.

The original account, which is still on legal hold, is left untouched
by the restore process.


   
