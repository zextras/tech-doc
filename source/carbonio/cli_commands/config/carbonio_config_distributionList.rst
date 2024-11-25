.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_distributionList:

********************************
distributionList
********************************

::

   carbonio config distributionList _set|get|empty_ _distributionListName_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 30 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - command (M)
     - String
     - set\|get\|empty
     - 
   * - distributionListName (M)
     - String
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

   carbonio config distributionList get distributionListName attribute allowDlMemberAddAsFriend




.. rubric:: Usage example


::

   carbonio config distributionList set distributionListName attribute allowDlMemberAddAsFriend value true




.. rubric:: Usage example


::

   carbonio config distributionList empty distributionListName attribute allowDlMemberAddAsFriend



