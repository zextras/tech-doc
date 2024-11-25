.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_account:

**************
account
**************

::

   carbonio config account _set|get|empty_ _accountName_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - command (M)
     - String
     - set\|get\|empty
     - 
   * - accountName (M)
     - Account Name/ID
     - 
     - 
   * - attribute (O)
     - String
     - 
     - 
   * - value (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config account get accountName attribute debranded




.. rubric:: Usage example


::

   carbonio config account set accountName attribute debranded value true




.. rubric:: Usage example


::

   carbonio config account empty accountName attribute debranded




.. WARNING::

      this command is deprecated

   use instead:

      carbonio config get account {account} {attribute}

      carbonio config set account {account} {attribute} {value}

      carbonio config unset account {account} {attribute}



