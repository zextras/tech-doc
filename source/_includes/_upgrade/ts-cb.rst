.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Preventing docs-connector Conflicts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you are running a release prior to **22.10.0**, there are chances
that you have installed package ``docs-connector-ce``, which was
common between |carbonio| and |ce|. If you have it installed, make
sure to remove it and that **only** the new package
``carbonio-docs-connector`` is installed, by removing the old package

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt purge carbonio-docs-connector-ce

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf remove carbonio-docs-connector-ce

Then installing the new package

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-docs-connector

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-docs-connector

Since this package installs a database component, bootstrap
the corresponding database.

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

Finally, restart the mailbox service.

.. code:: console
   
   zextras$ zmcontrol stop
   zextras$ zmcontrol start

.. _rhel-post:

``mailboxd`` Process not Running (RHEL-Only )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In case you have a RHEL 8 installation and after the reboot you notice
that the ``mailboxd`` process is not started, check that the
``carbonio-zal`` package is installed (and in case it is not,
reinstall it), then restart the process as the ``zextras`` user.

These are the commands that you need to execute.

.. code:: console

   # dnf reinstall carbonio-zal

.. code:: console

   zextras$ zmmailboxdctl restart
