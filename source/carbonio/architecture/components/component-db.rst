.. _component-db-install:

Database
========

.. include:: /_includes/_installation/_components/component-db.rst

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/pg.rst

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

.. _connectors-wsc-db-install:

Database Components of |wsc|
----------------------------

If you plan to install the :ref:`component-wsc-install` Component, you need to
install the following packages, which constitute the DB portion of
that Component, then follow the instructions to complete its installation

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-ws-collaboration-db \
           carbonio-message-dispatcher-db carbonio-notification-push-db

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-ws-collaboration-db \
           carbonio-message-dispatcher-db carbonio-notification-push-db

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Bootstrap Databases
-------------------

You can use the password of the Postgres user ``carbonio_adm`` that
you defined during the *Database* Component's installation, or of any
other administrator user created previously.

.. include:: /_includes/_installation/_steps/db-bootstrap.rst

If you plan to install also the :ref:`component-wsc-install`, execute also
the following commands.

.. include:: /_includes/_installation/_steps/db-bootstrap-chats.rst
