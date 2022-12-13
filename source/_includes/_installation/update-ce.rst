.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _bootstrap-db:

Bootstrap database
~~~~~~~~~~~~~~~~~~

Whenever a ``-db`` package is upgraded (currently they are
``carbonio-mailbox-db``, ``carbonio-files-db``, and
``carbonio-docs-connector-db``), remember to bootstrap the
corresponding Database, by running the command, respectively.

.. code:: console

   # PGPASSWORD=DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

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

If you are upgrading to version **22.10.0**, make sure to install also
the packages for the brand new Administration console. In a
Multi-Server, the commands must be executed on the **Proxy node**.
      
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-admin-console-ui carbonio-admin-ui


   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-admin-console-ui carbonio-admin-ui

.. _upgrade-directory-server:

Upgrade Directory Server
~~~~~~~~~~~~~~~~~~~~~~~~

Whenever the upgrade involves the Directory Server, and there are some
backward incompatible changes like the addition of new attributes in
the database, follow these directions. On the Multi-Server, execute
them in on the node with the Directory Server Role installed, which is
:ref:`SRV2 <srv2-install>` in our scenario.

#. Make a dump of the LDAP Database, especially if the if the upgrade
   includes the Directory Server. This can be done using the command
   (as the ``zextras`` user)

   .. code:: console

      zextras$ opt/zextras/libexec/zmslapcat /tmp

   .. note:: The dump will be saved in the :file:`/tmp/` directory, so
      make sure to copy it to a **safe** location.

#. Make a backup copy of file
   :file:`/opt/zextras/conf/localconfig.xml` and **store it in a
   safe place**

#. Stop the Directory Server service

   .. code:: console

      zextras$ ldap stop

#. Execute the :ref:`Single-Server <upgrade-single>` upgrade
   procedure

#. Restart the Directory Server service

   .. code:: console

      zextras$ ldap start

#. Make sure that |mesh| picks up all changes

   .. code:: console

      # pending-setups -a
