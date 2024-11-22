.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_dump_account:

**************
account
**************

::

   carbonio config dump account _account_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - show-inherited (O)
     - Boolean
     - true\|false
     - true

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config dump account user@example.com



Dumps all the attributes related to the account u0@example.com skipping inherited values

.. rubric:: Usage example


::

   carbonio config dump account user@example.com show-inherited true



Dumps all the attributes related to the account u0@example.com showing inherited values
