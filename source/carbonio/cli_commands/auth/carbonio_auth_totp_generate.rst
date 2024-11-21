.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_totp_generate:

****************
generate
****************

::

   carbonio auth totp generate _account_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - 
     - 
   * - algorithm (O)
     - String
     - SHA1\|SHA256\|SHA512
     - SHA1
   * - pin (O)
     - String
     - 
     - 
   * - secret_length (O)
     - Integer
     - 32
     - 32
   * - period (O)
     - Integer
     - 30\|60
     - 30
   * - digits_length (O)
     - Integer
     - 6\|8\|10
     - 6
   * - human_readable (O)
     - Boolean
     - true\|false
     - true
   * - pin_prepend (O)
     - Boolean
     - true\|false
     - false
   * - static_code (O)
     - Integer
     - 0\|...\|12\|
     - 12
   * - label_prefix (O)
     - String
     - alphanumeric string (with dashes and underscores allowed) of length up to 20 characters
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth totp generate generate {account} <algorithm> <pin> <secret_length> <period> <digits_length> <human_readable> <pin_prepend> <static_code> <label_prefix>



