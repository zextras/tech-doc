
::

   zxsuite config cos *set|get|empty* *cosName* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**command**\ (M) | String          | set|get|empty   |                 |
+-----------------+-----------------+-----------------+-----------------+
|**cosName**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config cos get cosName attribute debranded

.. rubric:: Usage Example

::

   zxsuite config cos set cosName attribute debranded value true

.. rubric:: Usage Example

::

   zxsuite config cos empty cosName attribute debranded

.. warning:: This command is deprecated use instead:

::

   zxsuite config get cos {cos} {attribute} zxsuite config set cos
   {cos} {attribute} {value} zxsuite config unset cos {cos}
   {attribute}
