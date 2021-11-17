.. _backup_doEnableDisableCOS:

doEnableDisableCOS
------------------

.. container:: informalexample

   zxsuite backup doEnableDisableCOS *cos_name* *enable|disable*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **              | String          |                 |                 |
| cos_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **c             | String          | enable|disable  |                 |
| os_state**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doEnableDisableCOS mainCOS disable

Disables backup on the mainCOS class of service
