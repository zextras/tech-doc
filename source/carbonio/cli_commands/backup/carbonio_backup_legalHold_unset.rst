.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_legalHold_unset:

**********
unset
**********

::

   carbonio backup legalHold unset _all for all accounts, zimbraId or email address list with comma separated_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 18 23 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - accounts (M)
     - Account Name[,..]
     - all for all accounts, zimbraId or email address list with comma separated
     - 

::

   (M) == mandatory parameter, (O) == optional parameter


carbonio legalhold unset all
carbonio legalhold unset zimbraId,test@example.tld
