.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available for
installation along with the other system updates. Therefore, the upgrade
procedure is usually a very quick activity, carried out with by means
of a few commands.

However, in seldom cases, some incompatibility may arise in
third-party software, which lead to some additional manual steps to be
carried out. Section :ref:`upgrade-troubleshooting` below contains
information to prevent or fix these issues.

Therefore, to
upgrade |product|, first check for new packages:

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt update

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf update

Then choose either way of upgrading:

.. grid:: 1 1 1 2
   :gutter: 3
   
   .. grid-item-card:: Upgrade |product| packages
      :columns: 12 12 12 6
                
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install "carbonio-*"

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install "carbonio-*"

   .. grid-item-card:: Upgrade the whole system
      :columns: 12 12 12 6

      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

   .. grid-item:: 
      :columns: 12 12 12 12

      .. hint:: Even if you choose to upgrade only |product|, remember
         that you should keep the whole system up to date, because new
         system packages may contain security fixes or bug fixes.


Whenever a ``db`` package is upgraded (currently
``carbonio-mailbox-db`` and ``carbonio-files-db``), remember to
bootstrap the corresponding Database, by running either of the commands.

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
   # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

In the above commands, ``$DB_ADM_PWD`` is the the password of the
``carbonio_adm`` database role, that is, the one created during
:ref:`Step 6 <config-db>` of the Single-Server installation or the
installation of :ref:`srv1-install` in the Multi-Server installation

Finally, since new version of |product| packages may include new
services, it is strongly suggested to execute the command

.. code:: console

   # pending-setups

This will register the services to |mesh|, so they can immediately be
used.

.. _upgrade-troubleshooting:

Upgrade Troubleshooting
-----------------------

This section lists some troubleshooting options related to the upgrade
process.

Upgrade of Docs-Editor
~~~~~~~~~~~~~~~~~~~~~~

When installing recent version of the **Docs-Editor**, running the
:command:`pending-setups` might abruptly exit with an error message
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
this command **before** :command:`pending-setups`.

.. code:: console

   # systemctl restart service-discover.service


Token-related error messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Whenever, during the upgrade process, you find any error in the log
files, execute the following two commands.

The first one must be executed as the ``root`` user.

.. code:: console

   # chmod a+r /etc/zextras/carbonio-mailbox/token

The second one must be executed as the ``zextras`` user.

.. code:: console

   $ zmmailboxdctl restart

