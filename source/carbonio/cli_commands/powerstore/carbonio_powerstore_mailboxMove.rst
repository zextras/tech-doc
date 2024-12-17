.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_mailboxMove:

**********************
mailboxMove
**********************

::

   carbonio powerstore mailboxMove _mail2.example.com [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 33 19 35 21
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - destinationHost (M)
     - String
     - mail2.example.com

     - 
   * - accounts (O)
     - String[,..]
     - john@example.com,smith@example.com[,...]
     - 
   * - domains (O)
     - String[,..]
     - example.com,test.com[,...]
     - 
   * - input_file (O)
     - String
     - 
     - 
   * - notifications (O)
     - Email Address
     - 
     - 
   * - blob_destination_volume (O)
     - String
     - current_primary\|current_secondary\|6
     - current_primary
   * - read_error_threshold (O)
     - Integer
     - 
     - 
   * - compress (O)
     - Boolean
     - true\|false
     - true
   * - threads (O)
     - Integer
     - 
     - 1
   * - checkDigest (O)
     - Boolean
     - true\|false

     - false
   * - overwrite (O)
     - Boolean
     - true\|false
     - true

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore mailboxMove mail2.example.com accounts john@example.com



Moves mailbox for account john@example.com to mail2.example.com host


