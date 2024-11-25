.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doUpdateVolume_FileBlob:

****************
FileBlob
****************

::

   carbonio powerstore doUpdateVolume FileBlob _current_volume_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 31 15 31 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - current_volume_name (M)
     - String
     - 
     - 
   * - volume_type (O)
     - String
     - primary\|secondary\|index
     - 
   * - volume_name (O)
     - String
     - 
     - 
   * - volume_path (O)
     - Path
     - 
     - 
   * - current_volume (O)
     - Boolean
     - true\|false
     - false
   * - volume_compressed (O)
     - Boolean
     - true\|false
     - 
   * - compression_threshold (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doUpdateVolume FileBlob



