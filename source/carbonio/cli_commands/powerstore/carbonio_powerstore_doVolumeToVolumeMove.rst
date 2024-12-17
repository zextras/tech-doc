.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doVolumeToVolumeMove:

****************************************
doVolumeToVolumeMove
****************************************

::

   carbonio powerstore doVolumeToVolumeMove _source_volume_name_ _destination_volume_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - source_volume_name (M)
     - String
     - 
     - 
   * - destination_volume_name (M)
     - String
     - 
     - 
   * - only_files_and_chats (O)
     - Boolean
     - true\|false
     - false
   * - read_error_threshold (O)
     - Integer
     - 
     - 
   * - policy (O)
     - String
     - 
     - none
   * - perform_deduplicate (O)
     - Boolean
     - true\|false
     - false
   * - overwrite_index_destination (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doVolumeToVolumeMove sourceVolume destVolume



Moves the whole sourceVolume to destVolume
