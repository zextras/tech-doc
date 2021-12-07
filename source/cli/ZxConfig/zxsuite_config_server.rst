
::

   zxsuite config server *set|get|empty* *serverName* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**command**\ (M) | String          | set|get|empty   |                 |
+-----------------+-----------------+-----------------+-----------------+
| **se            | String          |                 |                 |
| rverName**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config server get serverName attribute debranded

.. rubric:: Usage Example

::

   zxsuite config server set serverName attribute debranded value true

.. rubric:: Usage Example

::

   zxsuite config server empty serverName attribute debranded

.. warning:: This command is deprecated use instead:

::

   zxsuite config get server {server} {attribute} zxsuite config set
   server {server} {attribute} {value} zxsuite config unset server
   {server} {attribute}
