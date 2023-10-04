.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _bootstrap-db:

Bootstrap Database
~~~~~~~~~~~~~~~~~~

Whenever the ``carbonio-files-db`` package is upgraded, remember to
bootstrap the Database, by running the command.

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

In the above command, |dbadmpwd| is the the password of the
``carbonio_adm`` database role, that is, the one created during
:ref:`Step 6 <installation-step6>` of the Single-Server installation or the
installation of :ref:`srv1-install` in the Multi-Server installation

Finally, since new version of |product| packages may include new
services, it is strongly suggested to execute the command

.. code:: console

   # pending-setups -a

This will register the services to |mesh|, so they can immediately be
used.

.. hint:: The **secret** needed to run the above command is stored in
   file :file:`/var/lib/service-discover/password` which is accessible
   only by the ``root`` user.

.. _adminpanel-packages:

Administration Panel Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you are upgrading from a version previous to **22.10.0**, make sure
to install also the packages for the brand new Administration
console. In a Multi-Server, the commands must be executed on the
**Proxy node**.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-admin-console-ui carbonio-admin-ui


   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-admin-console-ui carbonio-admin-ui

.. _upgrade-docs-editor:

Upgrade of Docs-Editor
~~~~~~~~~~~~~~~~~~~~~~

When installing recent version of the **Docs-Editor**, running the
:command:`pending-setups -a` might abruptly exit with an error message
similar to::

  Error writing config entry service-defaults/carbonio-docs-editor: Unexpected response code:
  400 (Bad request: Request decoding failed: 1 error occurred:

   * invalid config key "Websocket"

To avoid this error, make sure that the installed package
``service-discover-base`` is *at least* version **1.10.12**. You can
verify this with the following commands.


.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt search service-discover-base
         # dpkg -l service-discover-base

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf info service-discover-base
         # rpm -q service-discover-base

If the version is older than **1.10.12**, please upgrade the package.

After you verified that the version is the correct one, please run
this command **before** :command:`pending-setups -a`.

.. code:: console

   # systemctl restart service-discover.service

.. _upgrade-ts-token:

Token-related Error Messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Whenever, during the upgrade process, you find any error in the log
files, execute the following two commands.

The first one must be executed as the ``root`` user.

.. code:: console

   # chmod a+r /etc/zextras/carbonio-mailbox/token

The second one must be executed as the ``zextras`` user.

.. code:: console

   zextras$ zmcontrol stop
   zextras$ zmcontrol start
