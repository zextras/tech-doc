.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_loginPage_setColorPalette_domain:

********************************
loginPage setColorPalette domain
********************************

::

   carbonio auth loginPage setColorPalette domain _domain_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 19 15 23 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - 
     - 
   * - primary (O)
     - String
     - hexadecimal color
     - 
   * - secondary (O)
     - String
     - hexadecimal color
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth loginPage setColorPalette domain example.com primary 6174AE



