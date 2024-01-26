.. _mailboxmove:

==================================
 Moving an Account Across Servers
==================================

Moving an account from one server to another within the same |product|
infrastructure can be done using command :command:`carbonio powerstore
mailboxMove` from the CLI interface. The command will take care of
moving the account including everything associated to it: e-mails,
contacts, calendars, and Chats blobs.

The syntax of the command is

.. code:: console

   zextras$ carbonio powerstore *destination server* accounts *account name*

To move account ``alice@example.com`` to server ``example.net``
including all its blobs, the command is

.. code:: console

   zextras$ carbonio powerstore example.net accounts alice@example.com
