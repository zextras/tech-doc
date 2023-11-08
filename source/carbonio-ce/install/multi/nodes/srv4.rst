

.. _srv4-install:

SRV4: |pv|, |file|, and |docs|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3

   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "8GB"
         "Disk Space", "50GB"
         "IP Address", "172.16.0.14"
         "FQDN", "srv4.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * |pv|
      * |file|
      * |docs|

The fourth node requires the bootstrap of |product| and the
configuration of |mesh| and *Memcached*.

.. include:: /_includes/_multiserver-installation/srv4-ce.rst
