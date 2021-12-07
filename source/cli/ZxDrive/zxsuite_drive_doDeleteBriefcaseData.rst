
::

   zxsuite drive doDeleteBriefcaseData
   *account@example.com,\ *\ system-account@example.com\ *,test.example.com[,…​]*
   [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **target**\ (M) | String[,..]     | account@ex      |                 |
|                 |                 | ample.com,\ sys |                 |
|                 |                 | tem-account@exa |                 |
|                 |                 | mple.com,test.e |                 |
|                 |                 | xample.com[,…​] |                 |
+-----------------+-----------------+-----------------+-----------------+
| dryRun(O)       | Boolean         | true|false      | true            |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite drive doDeleteBriefcaseData admin@example.com dryRun false

Perform a briefcase deletion for a system account

.. rubric:: Usage Example

::

   zxsuite drive doDeleteBriefcaseData user@example.com dryRun false

Perform a briefcase deletion for an account

.. rubric:: Usage Example

::

   zxsuite drive doDeleteBriefcaseData demo.example.com dryRun false

Perform a briefcase deletion for an entire domain

.. rubric:: Usage Example

::

   zxsuite drive doDeleteBriefcaseData demo.example.com,user@example.com

Perform a briefcase deletion for the entire domain ``demo.example.com``
and user ``user@example.com``

.. rubric:: Usage Example

::

   zxsuite drive doDeleteBriefcaseData user@example.com dryRun true

Perform a fake deletion of the briefcase for a generic account, this
could be useful for check what the real operation will do
