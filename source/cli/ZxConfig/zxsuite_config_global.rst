.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config global *set|get|empty* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**command**\ (M) | String          | set|get|empty   |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config global get attribute debranded

.. rubric:: Usage Example

::

   zxsuite config global set attribute debranded value true

.. rubric:: Usage Example

::

   zxsuite config global empty attribute debranded

.. warning:: This command is deprecated use instead:

::

   zxsuite config get global {attribute} zxsuite config set global
   {attribute} {value} zxsuite config unset global {attribute}
