.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_metrics_set_graphite:

****************
graphite
****************

::

   carbonio metrics set graphite _plaintext|udp|pickle_ _metrics.example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 18 15 28 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - protocol (M)
     - String
     - plaintext\|udp\|pickle
     - 
   * - host (M)
     - String
     - metrics.example.com
     - 
   * - port (O)
     - Long
     - 2003
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio metrics set graphite udp metrics.example.com port 2003



Set or update the configuration for graphite endpoint using udp protocol, metrics.example.com as host using port 2003
