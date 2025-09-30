
.. index:: Legal Hold

.. _backup-legal-hold:

============
 Legal Hold
============

A *legal hold* is a functionality that allows to preserve and protect
electronic data (for example e-mails and documents) for potential use
in legal proceedings or investigations.

In the context of Carbonio, the Legal Hold is a mechanism that ensures the integrity and retention of backup data for a selected account. When an account is placed under Legal Hold, the account itself remains fully operational—users can continue accessing and modifying it as usual. However, all backup states will be kept forever and preserved indefinitely, overriding any standard retention policies. This guarantees that any data present in the backup, including items that may later be modified or deleted in the live account, remain available. Additionally, administrators can perform a Restore on New Account to recreate the mailbox in its entirety, including all messages—even those that were subsequently deleted by the user.

|product| makes available a set of CLI commands to manage the legal
host status of the accounts: :command:`carbonio backup legalHold {get
| set | unset` which accept as argument either ``all`` or a
comma-separated list of accounts ID.

.. card:: Examples

   #. Get the legal hold status of all accounts::

        zextras$ carbonio backup legalhold get all

      This command outputs all the accounts, their ID, and status. For
      example::

        john.doe@example.com 924e1cf6-eaba-4aff-a10d-1f8e94fa85e4 unset
        jane.doe@example.com a1701296-7caa-4366-8886-f33bfb44267e unset

   #. Put accounts jane.doe\@example and john.doe\@example.com in legal hold status::

        zextras$ carbonio backup legalhold set a1701296-7caa-4366-8886-f33bfb44267e,924e1cf6-eaba-4aff-a10d-1f8e94fa85e4

      This command accepts e-mail addresses or account IDs (you can
      find them either using the command in the previous point or from
      the |adminui| (:menuselection:`Domains --> Manage --> Accounts`,
      then on the account's *General* details).

   #. Remove account john.doe\@example.com from legal hold status::

        zextras$ carbonio backup legalhold unset 924e1cf6-eaba-4aff-a10d-1f8e94fa85e4


.. seealso:: The legal hold status can be managed from the |adminui|
   as well, please refer to Section ref:`ap-lh`.
