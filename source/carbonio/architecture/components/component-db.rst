.. _component-db-install:

Database
========

.. include:: /_includes/_architecture/_components/component-db.rst

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/pg.rst

Installation of Mailbox DB Component
------------------------------------

The following database component needs to be installed to ensure
proper working of |product|

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install  carbonio-mailbox-db \

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-files-db carbonio-mailbox-db \
           carbonio-docs-connector-db carbonio-tasks-db

.. _other-db-conn-install:

Installation of Other DB Components
-----------------------------------

If you plan to install one or more of the |docs|, |file|, |task|, or
|wsc| Components, you need to install the corresponding "``-db``"
packages, which constitute the DB portion of that Component, then
follow the instructions to complete its installation. Remember also to
initialise the DB by executing the corresponding :ref:`bootstrap
command <dbs-bootstrap>`.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-docs-connector-db carbonio-tasks-db \
           carbonio-files-db carbonio-ws-collaboration-db \
           carbonio-message-dispatcher-db \
           carbonio-notification-push-db

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-docs-connector-db carbonio-tasks-db \
           carbonio-files-db carbonio-ws-collaboration-db \
           carbonio-message-dispatcher-db \
           carbonio-notification-push-db

.. _comp-db-ps:

Pending Setups
--------------

.. include:: /_includes/_installation/pset.rst

.. _dbs-bootstrap:

Bootstrap Databases
-------------------

You can use the password of the Postgres user ``carbonio_adm`` that
you defined during the *Database* Component's installation, or of any
other administrator user created previously.  Only the first bootstrap
command (the one for the Mailbox) is mandatory, the other are required
only if you install the Component.

.. include:: /_includes/_installation/_steps/db-bootstrap.rst

.. _chats-db-bootstrap:

The :ref:`component-wsc-install` components requires three bootstrap
commands to be executed:

.. include:: /_includes/_installation/_steps/db-bootstrap-chats.rst
