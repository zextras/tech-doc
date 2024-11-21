.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_saml_get:

******
get
******

::

   carbonio auth saml get _example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 19 15 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - example.com
     - 
   * - key (O)
     - String
     - organization.name
     - 
   * - export_to (O)
     - Path
     - ./saml-config.json
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth saml get



