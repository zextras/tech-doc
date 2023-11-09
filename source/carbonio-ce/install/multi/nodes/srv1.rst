
.. _srv1-install:

SRV1: Postgres, Directory Server, DB connection, |mesh|, and |monit|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3

   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "8GB"
         "Disk Space", "120GB"
         "IP Address", "172.16.0.11"
         "FQDN", "srv1.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * PostgreSQL
      * Database components of |product| (|file|, |task|)
      * DB connection, provided by pgpool
      * Directory Server
      * |mesh|
      * |monit|

To install the first Node, follow the order of Roles presented in the
above panel: start with the installation and configuration of
PostgreSQL and DB connection, then bootstrap |product|, set up |mesh|,
and finally prepare the |file| database.

.. include:: /_includes/_multiserver-installation/srv1-ce.rst
