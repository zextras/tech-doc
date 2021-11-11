
::

   zxsuite config domain *set|get|empty* *domainName* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**command**\ (M) | String          | set|get|empty   |                 |
+-----------------+-----------------+-----------------+-----------------+
| **do            | Domain Name     |                 |                 |
| mainName**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config domain get domainName attribute debranded

.. rubric:: Usage Example

::

   zxsuite config domain set domainName attribute debranded value true

.. rubric:: Usage Example

::

   zxsuite config domain empty domainName attribute debranded

.. warning:: This command is deprecated use instead:

::

   zxsuite config get domain {domain} {attribute} zxsuite config set
   domain {domain} {attribute} {value} zxsuite config unset domain
   {domain} {attribute}
