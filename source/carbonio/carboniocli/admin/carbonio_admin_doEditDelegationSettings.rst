.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   carbonio admin doEditDelegationSettings *account* *domain* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | String          |                 |                 |
|**account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| viewMail(O)     | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| editFeatures(O) | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| adminQuota(O)   | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   carbonio admin doEditDelegationSettings john@example.com example.com viewMail true adminQuota -1

Edits John’s delegation rights for domain example.com, with the right to
view user mail on such domain and

no right to grand quotas to users.

.. rubric:: Usage Example

::

   carbonio admin doEditDelegationSettings john@example.com example.com adminQuota 0

Edits John’s delegation rights for domain example.com, with the right to
assign unlimited quotas to users.

.. rubric:: Usage Example

::

   carbonio admin doEditDelegationSettings john@example.com example.com adminQuota 10gb

Edits John’s delegation rights for domain example.com, with the right to
assign quotas up to 10gb to each user.
