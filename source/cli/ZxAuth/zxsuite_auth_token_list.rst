.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth token list *uuid\|\ *\ user1@example.com [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | String          | user\@exam\     |                 |
| ount**\ (M)     |                 | ple.com | uuid  |                 |
+-----------------+-----------------+-----------------+-----------------+
| c               | String          |                 |                 |
| redential_id(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| cred            | String          |                 |                 |
| ential_label(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth token list {account} credential_id j18ai credential_label myCredential
