
::

   zxsuite admin doAddDelegationSettings *account* *domain* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+------------------+-----------------+-----------------+-----------------+
| NAME             | TYPE            | EXPECTED VALUES | DEFAULT         |
+------------------+-----------------+-----------------+-----------------+
| **account**\ (M) | String          |                 |                 |
+------------------+-----------------+-----------------+-----------------+
| **domain**\ (M)  | String          |                 |                 |
+------------------+-----------------+-----------------+-----------------+
| viewMail(O)      | Boolean         | true|false      | false           |
+------------------+-----------------+-----------------+-----------------+
| editFeatures(O)  | Boolean         | true|false      | false           |
+------------------+-----------------+-----------------+-----------------+
| adminQuota(O)    | String          |                 | -1              |
+------------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin doAddDelegationSettings john@example.com example.com viewMail true adminQuota -1

Adds John as delegated administrator of domain example.com, with the
right to view user mail on such domain and

no right to grand quotas to users.

.. rubric:: Usage Example

::

   zxsuite admin doAddDelegationSettings john@example.com example.com adminQuota 0

Adds John as delegated administrator of domain example.com, with the
right to assign unlimited quotas to users.

.. rubric:: Usage Example

::

   zxsuite admin doAddDelegationSettings john@example.com example.com adminQuota 10gb

Adds John as delegated administrator of domain example.com, with the
right to assign quotas up to 10gb to each user.
