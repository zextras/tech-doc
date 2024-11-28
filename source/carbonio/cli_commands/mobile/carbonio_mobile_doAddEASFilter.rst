.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_doAddEASFilter:

****************************
doAddEASFilter
****************************

::

   carbonio mobile doAddEASFilter _and|or|regex|contains|account|domain_ _text|people@example.com|account=example@ff.com,contains=android_ _add|subtract|fixed|limit_ _easversions_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - type (M)
     - Multiple choice
     - and\|or\|regex\|contains\|account\|domain
     - 
   * - parameter (M)
     - String
     - text\|people@example.com\|account=example@ff.com,contains=android
     - 
   * - mode (M)
     - Multiple choice
     - add\|subtract\|fixed\|limit
     - 
   * - easversions (M)
     - String[,..]
     - 
     - 
   * - blocking (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile doAddEASFilter contains android fixed 2.5,12.0,14.1



Adds a protocol filter that will restrict the pool of available EAS versions to 2.5, 12.0 and 14.1 if the user agent name
contains the string 'android'.

.. rubric:: Usage example


::

   carbonio mobile doAddEASFilter and account=user@example.com,contains=android fixed 14.1 blocking true



Adds a protocol filter that will restrict the pool of available EAS versions to 14.1 if the user agent name
contains the string 'android' only for user@example.com. No more EAS filters will be evaluated after this one due to the 'blocking' directive.
