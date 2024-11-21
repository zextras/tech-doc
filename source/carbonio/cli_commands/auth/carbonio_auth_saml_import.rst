.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_saml_import:

************
import
************

::

   carbonio auth saml import _example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - example.com
     - 
   * - file (O)
     - Path
     - ./saml-config.json
     - 
   * - url (O)
     - String
     - http://domain/sso/saml/
     - 
   * - allow_unsecure (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth saml import



