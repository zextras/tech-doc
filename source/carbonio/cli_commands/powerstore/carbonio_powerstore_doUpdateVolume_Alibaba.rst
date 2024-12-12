.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doUpdateVolume_Alibaba:

*************************
doUpdateVolume Alibaba
*************************

::

   carbonio powerstore doUpdateVolume Alibaba _current_volume_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 33 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - current_volume_name (M)
     - String
     - 
     - 
   * - volume_name (O)
     - String
     - 
     - 
   * - volume_type (O)
     - String
     - primary\|secondary
     - 
   * - volume_prefix (O)
     - String
     - Prefix to the server id used in all objects keys
     - 
   * - bucket_configuration_id (O)
     - String
     - UUID for already existing service credentials (carbonio config get global s3BucketConfigurations)
     - 
   * - current_volume (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doUpdateVolume Alibaba



