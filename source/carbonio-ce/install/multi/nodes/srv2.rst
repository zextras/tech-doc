
.. _srv2-install:

SRV2: MTA, Proxy, and User Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3

   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "10GB"
         "Disk Space", "50GB"
         "IP Address", "172.16.0.12"
         "FQDN", "srv2.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * MTA, the mail server
      * Proxy
      * User management

Installation of Node 2 foresees the installation of MTA, Proxy, and
user management Roles, the bootstrap of |product|, and the
configuration of |mesh| and *Memcached*.

.. include:: /_includes/_multiserver-installation/srv2-ce.rst
