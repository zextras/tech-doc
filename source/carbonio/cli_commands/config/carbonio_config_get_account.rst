.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_get_account:

**************
get account
**************

::

   carbonio config get account _account_ _attribute_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 19 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - attribute (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config get account u0@example.net teamChatEnabled



Retrieves the value of the attribute 'teamChatEnabled' of the account
