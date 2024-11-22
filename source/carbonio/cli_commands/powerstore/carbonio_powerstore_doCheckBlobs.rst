.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCheckBlobs:

************************
doCheckBlobs
************************

::

   carbonio powerstore doCheckBlobs _start_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 18 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - action (M)
     - String
     - start
     - 
   * - volumes (O)
     - String[,..]
     - message1,hsm[,...]
     - 
   * - mailbox_ids (O)
     - Integer[,..]
     - 2,9,27
     - 
   * - missing_blobs_crosscheck (O)
     - Boolean
     - true\|false
     - true
   * - traced (O)
     - Boolean
     - true\|false
     - false
   * - fix_incorrect_compressed_digests (O)
     - Boolean
     - true\|false
     - false
   * - missing_blob_delete_item (O)
     - Boolean
     - true\|false
     - false
   * - check_digests (O)
     - Boolean
     - true\|false
     - false
   * - items (O)
     - String
     - mail\|files\|all
     - all

::

   (M) == mandatory parameter, (O) == optional parameter


Usage examples:

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start



Perform a BLOB coherency check on all message volumes

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start volumes message1,hsm



Perform a BLOB coherency check on volumes message1 and hsm

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start mailbox_ids 2,9,27



Perform a BLOB coherency check on mailboxes 2,9 and 27

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start missing_blobs_crosscheck false



Perform a BLOB coherency check without checking on other volumes

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start traced true



Perform a BLOB coherency check, logging even the correct checked items

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start fix_incorrect_compressed_digests true



This option verifies if the digest (hash) of every object is correct and eventually fixes it

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start check_digests true



Verifies if the blob digests are correct

.. rubric:: Usage example


::

   carbonio powerstore doCheckBlobs start missing_blob_delete_item true



Remove entries from the database that are missing their blob file in the hsm volume
Volume names are case sensitive. Run 'carbonio powerstore getAllVolumes' for a complete list of the volumes.
