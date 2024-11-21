.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_saml_generate:

****************
generate
****************

::

   carbonio auth saml generate _example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 28 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - example.com
     - 
   * - days (O)
     - Integer
     - 
     - 365
   * - country (O)
     - String
     - 
     - IT
   * - state (O)
     - String
     - 
     - VI
   * - location (O)
     - String
     - 
     - Vicenza
   * - organization (O)
     - String
     - 
     - Zextras
   * - organizationalUnit (O)
     - String
     - 
     - Zextras
   * - digest (O)
     - String
     - SHA1\|SHA256\|SHA512
     - SHA256
   * - encryption (O)
     - String
     - RSA\|RSA:2048\|RSA:4096
     - RSA:2048

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth saml generate demo.zextras.io



Generate a certificate with default values and assign it to the SAML profile.

.. rubric:: Usage example


::

   carbonio auth saml generate demo.zextras.io days 30 digest SHA512



Generate a certificate with thirty days of validity, sign it with a SHA512 algorithm and assign it to the SAML profile.
