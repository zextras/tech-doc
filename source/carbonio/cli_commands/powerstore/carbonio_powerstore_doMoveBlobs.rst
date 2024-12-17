.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doMoveBlobs:

**********************
doMoveBlobs
**********************

::

   carbonio powerstore doMoveBlobs _start_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 30 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - action (M)
     - String
     - start
     - 
   * - custom_policy (O)
     - String
     - 
     - none
   * - read_error_threshold (O)
     - Integer
     - 
     - 
   * - perform_deduplicate (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doMoveBlobs



Move items between the Current Primary Store and the Current Secondary Store according to the default HSM policy
