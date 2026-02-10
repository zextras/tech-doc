
.. rubric:: Repository Setup

.. include:: /_includes/_installation/_repo/pg.rst

.. rubric:: Update Package List and Install Postgres
   
.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update
         # apt install postgresql-16

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt update
         # apt install postgresql-16

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. include:: /_includes/_installation/rhel-pg.rst
         
   .. tab-item:: RHEL 9
      :sync: rhel9

      .. include:: /_includes/_installation/rhel-pg.rst

.. include:: /_includes/_installation/step-conf-db.rst

Complete the Postgres configuration by running these commands.

.. include:: /_includes/_installation/_repo/pg-access.rst
