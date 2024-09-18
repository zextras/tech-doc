.. _role-db-install:

Database
========

.. include:: /_includes/_installation/_roles/role-db.rst

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/pg.rst

Installation of |cwsc|
----------------------

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
