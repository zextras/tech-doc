
::

   zxsuite mobile getProvisioning *account|cos* *target* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **tar           | Multiple choice | account|cos     |                 |
| get_type**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **target**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| key(O)          | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile getProvisioning account john@example.com key zimbraMobilePolicyAllowDesktopSync

Shows the value of the zimbraMobilePolicyAllowDesktopSync property for
John’s account

.. rubric:: Usage Example

::

   zxsuite mobile getProvisioning account john@example.com

Shows the value of all properties for John’s account
