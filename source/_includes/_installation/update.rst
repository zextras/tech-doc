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

The steps required are basically two, although in some rare cases some
additional care is required, see after the instructions below.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: 
      :columns: 12 12 12 6

      Step 1. Update package list
      ^^^^^
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf update

   .. grid-item-card:: 
      :columns: 12 12 12 6

      Step 2 Install new packages
      ^^^^^
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

These two commands also take care of resolving all dependencies and
install all the upgrades available, of both the system and |product|.

Manual steps
------------

Whenever a ``db`` package is upgraded (currently there are two of
these packages, ``carbonio-mailbox-db`` and ``carbonio-files-db``),
remember to bootstrap the corresponding Database, by running either of
the commands.

.. code:: console

   # $PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
   # $PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

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
