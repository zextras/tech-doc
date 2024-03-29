.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite admin getMonthlyReport [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| month(O)        | String          | mm/yyyy \|      | previousMonth   |
|                 |                 | previousMonth   |                 |
+-----------------+-----------------+-----------------+-----------------+
| local(O)        | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin getMonthlyReport

Shows the monthly report for the previous month

.. rubric:: Usage Example

::

   zxsuite admin getMonthlyReport month 10/2015

Shows the monthly report for the month '10/2015'.

.. note:: This command reads the report files generated by the
   :ref:`doMonthlyReport <zxsuite_admin_doMonthlyReport>` command,
   which is automatically executed once a month.

   If no report exists for the specified month in the current Zextras Admin
   log path, this command will fail.
