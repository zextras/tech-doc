.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doAccountScan:

**************************
doAccountScan
**************************

::

   carbonio backup doAccountScan _account_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 32 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - deep (O)
     - Boolean
     - true\|false
     - false
   * - notifications (O)
     - Email Address
     - 
     - 
   * - remote_metadata_upload (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doAccountScan john@example.com deep true



Performs a deep scan of the account john@example.com
