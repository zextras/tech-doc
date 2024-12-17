.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_domain:

************
domain
************

::

   carbonio config domain _set|get|empty_ _domainName_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 20 17 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - command (M)
     - String
     - set\|get\|empty
     - 
   * - domainName (M)
     - Domain Name
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

   carbonio config domain get domainName attribute debranded




.. rubric:: Usage example


::

   carbonio config domain set domainName attribute debranded value true




.. rubric:: Usage example


::

   carbonio config domain empty domainName attribute debranded




.. WARNING::

      this command is deprecated

   use instead:

      carbonio config get domain {domain} {attribute}

      carbonio config set domain {domain} {attribute} {value}

      carbonio config unset domain {domain} {attribute}



