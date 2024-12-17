.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_admin_initDomainForDelegation:

**********************************************
initDomainForDelegation
**********************************************

::

   carbonio admin initDomainForDelegation _domain_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 20 15 34 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - domain_name
     - 
   * - configFile (O)
     - String
     - Absolute path of config file
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio admin initDomainForDelegation demo.zextras.io




.. rubric:: Usage example


::

   carbonio admin initDomainForDelegation demo.zextras.io configFile /opt/zextras/DomainConfig.json



