
::

   zxsuite admin doMonthlyReport *start* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action**\ (M) | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| month(O)        | String          | mm/yyyy \|      | previousMonth   |
|                 |                 | previousMonth   |                 |
+-----------------+-----------------+-----------------+-----------------+
| force(O)        | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| n               | Boolean         | true|false      | false           |
| otify_admins(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin doMonthlyReport

Generates the monthly report for the previous month and saves it in the
currentZextras Admin log path

.. rubric:: Usage Example

::

   zxsuite admin doMonthlyReport month 05/2021

Generates a PARTIAL monthly report for the current month, without saving
it to disk.

.. note:: This command is automatically executed once a month to
   generate a file containing the report for the previous month. To
   overwrite an existing report file, set the 'force' parameter to
   true.

   If you just want to display an existing report, use the
   :ref:`getMonthlyReport <zxsuite_admin_getMonthlyReport>` instead.
