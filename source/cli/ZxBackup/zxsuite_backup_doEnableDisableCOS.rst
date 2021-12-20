
::

   zxsuite backup doEnableDisableCOS *cos_name* *enable|disable*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **              | String          |                 |                 |
| cos_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **c             | String          | enable|disable  |                 |
| os_state**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doEnableDisableCOS mainCOS disable

Disables backup on the mainCOS class of service
