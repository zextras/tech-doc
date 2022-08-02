.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config account *set|get|empty* *accountName* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**command**\ (M) | String          | set|get|empty   |                 |
+-----------------+-----------------+-----------------+-----------------+
| **acc           | Account Name/ID |                 |                 |
| ountName**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) -- mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite config account get accountName attribute debranded

.. rubric:: Usage Example

::

   zxsuite config account set accountName attribute debranded value true

.. rubric:: Usage Example

::

   zxsuite config account empty accountName attribute debranded

.. warning:: This command is deprecated use instead:

::

   zxsuite config get account {account} {attribute} zxsuite config set
   account {account} {attribute} {value} zxsuite config unset account
   {account} {attribute}
