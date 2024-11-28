.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doRemoveHsmPolicy:

**********************************
doRemoveHsmPolicy
**********************************

::

   carbonio powerstore doRemoveHsmPolicy _hsm_policy_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 20 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - hsm_policy (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doRemoveHsmPolicy "message, document:before:-2month"



Remove the HSM policy: "message, document:before:-2month"
