
::

   zxsuite config distributionList *set|get|empty*
   *distributionListName* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**command**\ (M) | String          | set|get|empty   |                 |
+-----------------+-----------------+-----------------+-----------------+
| **distribution  | String          |                 |                 |
| ListName**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config distributionList get distributionListName attribute allowDlMemberAddAsFriend

.. rubric:: Usage Example

::

   zxsuite config distributionList set distributionListName attribute allowDlMemberAddAsFriend value true

.. rubric:: Usage Example

::

   zxsuite config distributionList empty distributionListName attribute allowDlMemberAddAsFriend
