.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doDeleteAllDelegatedRights *confirmation string*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **con           | String          | confirmation    |                 |
| firm**\ (M)     |                 | string          |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. warning:: This command will delete both Zextras Admin and Zimbra’s
   own Admin.

   Delegation settings reverting the Admin Delegation configuration to
   that of a fresh Zimbra installation.

   Please read the documentation carefully before executing this
   command.

   Use the value "I read the documentation and want to delete all
   Admin Delegation settings" as 'confirmation string' in order to
   make sure you don’t execute this command inadvertently.
   
   No action was performed.
