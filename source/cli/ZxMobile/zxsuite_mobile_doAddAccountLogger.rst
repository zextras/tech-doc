
::

   zxsuite mobile doAddAccountLogger *account*
   *trace|debug|info|warn|err|crit* *log_file* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | Account Name    |                 |                 |
|**account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **l             | Multiple choice | trace|debug|inf |                 |
| og_level**\ (M) |                 | o|warn|err|crit |                 |
+-----------------+-----------------+-----------------+-----------------+
| **l             | Path            |                 |                 |
| og_file**\ (M)  |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| window_size(O)  | Integer         | a value > 0     |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile doAddAccountLogger john@example.com info /tmp/john_logger

Creates an info account logger for john’s account to file
/tmp/john_logger

.. rubric:: Usage Example

::

   zxsuite mobile doAddAccountLogger john@example.com info /tmp/john_logger window_size 1

Creates an info account logger for john’s account to file
/tmp/john_logger with window size set to 1.
