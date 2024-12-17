.. _role-db-install:

Database
========

.. include:: /_includes/_installation/_roles/role-db.rst

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/pg.rst

.. _role-wsc-db-install:

Database Components of |wsc|
----------------------------

If you plan to install the :ref:`role-wsc-install` Role, you need to
install the following packages, which constitute the DB portion of
that Role, then follow the instructions to complete its installation


.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-notification-push-db \
           carbonio-ws-collaboration-db \
           carbonio-message-dispatcher-db

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-notification-push-db \
           carbonio-ws-collaboration-db \
           carbonio-message-dispatcher-db

Installation of other DB Components
-----------------------------------

The following database components need to be installed to ensure
proper working of |product|

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-files-db carbonio-mailbox-db \
           carbonio-docs-connector-db carbonio-tasks-db

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-files-db carbonio-mailbox-db \
           carbonio-docs-connector-db carbonio-tasks-db

Pending setups
--------------

To complete the installation of the database components run

.. code:: console

   # pending-setups -a

Bootstrap Databases
-------------------

You can use the password of the Postgres user ``carbonio_adm`` that
you defined during the  *Database* role or any other
administrator user created previously.

.. card:: Mailbox

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |docs|

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |file|

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |task|

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-tasks-db-bootstrap carbonio_adm 127.0.0.1

.. card:: Message Dispatcher

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |wsc|

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-ws-collaboration-db-bootstrap  carbonio_adm 127.0.0.1

.. card:: Carbonio Notification Push

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-notification-push-db-bootstrap carbonio_adm 127.0.0.1
