.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_getVolumeStats:

****************************
getVolumeStats
****************************

::

   carbonio powerstore getVolumeStats _volume_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 26 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - volume_name (M)
     - String
     - 
     - 
   * - show_volume_size (O)
     - Boolean
     - true\|false
     - false
   * - show_blob_num (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter


**BE CAREFUL** show_volume_size and show_blob_num options are IO intensive and thus disabled by default

.. rubric:: Usage example


::

   carbonio powerstore getVolumeStats volumeName



Shows stats for the volume with name equal to volumeName
