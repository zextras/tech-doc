.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite drive doImportBriefcase *target* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **target**\ (M) | String[,..]     |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| dryRun(O)       | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| d               | Boolean         | true|false      | false           |
| eleteSources(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| override(O)     | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| i               | Boolean         | true|false      | true            |
| temRevisions(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| sendShareN      | Boolean         | true|false      | false           |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase admin@example.com

Perform a system account migration

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase user@example.com

Perform an account migration

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase demo.example.com

Perform an entire domain migration

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase demo.example.com,user@example.com

Perform entire domain ``demo.example.com`` and user ``user@example.com``
migration

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase user@example.com dryRun false

Perform a fake migration for a generic account, this could be useful for
check what the real operation will do

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase user@example.com deleteSource false

Perform an account copy-migration

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase user@example.com override true

Perform an account migration overriding items that already exists

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase user@example.com itemRevision false

Perform an account migration without importing each items revision

.. rubric:: Usage Example

::

   zxsuite drive doImportBriefcase user@example.com sendShareNotifications true

Perform an account migration sending share notifications when imported
one
