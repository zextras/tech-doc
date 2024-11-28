.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_retrieveMetadataFromArchive_Local:

**********
Local
**********

::

   carbonio backup retrieveMetadataFromArchive Local _source_ _destination_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 19 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - source (M)
     - String
     - 
     - 
   * - destination (M)
     - String
     - 
     - 
   * - threads (O)
     - Integer
     - 
     - 10
   * - notifications (O)
     - Email Address
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup retrieveMetadataFromArchive Local /path/to/source/directory /path/to/destination/directory



