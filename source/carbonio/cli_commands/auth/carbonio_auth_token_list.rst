.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_token_list:

********
list
********

::

   carbonio auth token list _uuid|user1@example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 26 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - uuid\|user1@example.com
     - 
   * - credential_id (O)
     - String
     - 
     - 
   * - credential_label (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth token list {account} credential_id j18ai credential_label myCredential



