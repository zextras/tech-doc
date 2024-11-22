.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCreateVolume_FileBlob:

****************
FileBlob
****************

::

   carbonio powerstore doCreateVolume FileBlob _volume_name_ _primary|secondary_ _volume_path_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 21 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - volume_name (M)
     - String
     - 
     - 
   * - volume_type (M)
     - Multiple choice
     - primary\|secondary
     - 
   * - volume_path (M)
     - Path
     - 
     - 
   * - volume_compressed (O)
     - Boolean
     - true\|false
     - false
   * - compression_threshold_bytes (O)
     - Long
     - 
     - 4096

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doCreateVolume FileBlob volumeName secondary /path/to/store volume_compressed true compression_threshold_bytes 4096



