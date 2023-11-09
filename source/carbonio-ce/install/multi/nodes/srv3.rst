
.. _srv3-install:

SRV3: AppServer, |storage|, and |task| Backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3

   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "16GB"
         "Disk Space", "50GB"
         "IP Address", "172.16.0.13"
         "FQDN", "srv3.example.com"

      .. note:: Remember to allocate enough disk space for the user's
         quota, which is around 750GB for 150 users with 5GB quota each.

   .. grid-item-card:: Roles
      :columns: 6

      * AppServer
      * |storage|
      * |task| backend

On the third node, the AppServer and the |storage| instance are
installed, and, like in the previous node, the bootstrap of |product|,
and the configuration of |mesh| and *Memcached* are carried out.

.. include:: /_includes/_multiserver-installation/srv3-ce.rst
