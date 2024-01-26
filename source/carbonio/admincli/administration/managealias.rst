.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _manage-alias:

===========================
 E-mail Aliases Management
===========================

.. card:: E-mail aliases explained

   An e-mail alias allow to add another name to an existing e-mail
   address. Like any other e-mail address, it is composed by a
   *username* (e.g., `john.doe`) and a *domain* (e.g., `example.com`)
   separated by a ``@``: `john.doe@example.com`.

   Aliases prove useful in a number of cases, including:

   * To subscribe to distribution lists or newsletters without using
     your real e-mail address for privacy reasons

   * To make the management of incoming mail easier by defining
     suitable filters

   * In company environments, aliases are often used to assign an
     e-mail address to a *role* and not to a person. For example, an
     alias it-operations@example.com forwards email to the head of the
     IT department: when the person in charge is replaced, you just
     need to point the alias to the e-mail address of the new person.

   The main difference between an alias and a regular e-mail address
   is that an alias does not occupy any space on the server to store
   the e-mail, because all e-mails sent to the alias will be forwarded
   to the user's e-mail address. Therefore, deleting an alias will
   **not impact** the existing user's e-mails.


|product| supports e-mail aliases as any other e-mail server and
allows to define and remove them from the CLI, as the ``zextras``
user. These is however no way to transfer an alias from one user to
the other: you need to first remove the alias from the old user, then
assign it to the new one.

.. grid:: 1 1 2 2
   :gutter: 1

   .. grid-item-card::
      :columns: 6

      Add an alias to an account
      ^^^^^

      .. code:: console

         zextras$ carbonio prov aaa john.doe@example.com it-operations@example.com

      This command adds alias it-operations@example.com to user
      john.doe@example.com.

      .. hint:: ``aaa`` is the short form of ``addAccountAlias``.

   .. grid-item-card::
      :columns: 6

      Remove an alias from an account
      ^^^^^

      .. code:: console

         zextras$ carbonio prov raa john.doe@example.com it-operations@example.com

      This command removes alias it-operations@example.com from user
      john.doe@example.com.

      .. hint:: ``raa`` is the short form of ``removeAccountAlias``.



