.. _upgrade-ansible:

===============
 Using Ansible
===============

The upgrade procedure with Ansible Galaxy is strongly suggested when
you are upgrading from the previous version, which will take care of
all the tasks required.

Before starting the procedure, make sure that you satisfy the
:ref:`up-ansible-req`, then choose one of the supported
:ref:`up-ansible-paths`.

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

Please also check Sections :ref:`ts-up-prev` or :ref:`ts-up-older` for
known issues impacting the upgrade process, depending on the version
from which you are upgrading.

.. _up-ansible-req:

Requirements & Preliminaries
============================

The following points must be taken into account before starting the
upgrade procedure with Ansible.

* If you do not have yet a working Ansible environment, please follow
  the instructions in section :ref:`install-with-ansible`

* You need to install the latest ``carbonio_upgrade`` :ref:`Ansible Galaxy
  collection installed <ans-pb-install>`

  * If you already have installed it, make sure that it :ref:`is updated
    <ans-pb-up>`, see how to :ref:`check the current version
    <ans-pb-check>`

* The upgrade procedure does not depend on the underlying
  :ref:`supported operating system <software-requirements>`. However,
  note that this release, **25.03**, is the last version supporting
  **Ubuntu 20.04 LTS**, which goes EOL in May 2025, so you are
  strongly recommended to :ref:`upgrade to Ubuntu 22.04 LTS
  <os-upgrade>`.

* This upgrade procedure works even if you installed |product|
  manually: see Section :ref:`up-ansible-paths` for details

* The version of |product| that you want to upgrade is not important:
  you can start from any version (24.12, 24.9, or older) and you will
  always end up with the latest version (|release| at the time of
  writing)

* The Ansible Galaxy collection will update all the packages installed on the
  system, from any active configured repository, not only
  |product|\'s. To avoid this behaviour, comment out any repositories
  from which you do not want to upgrade packages.

* Ansible will **not** upgrade **PostgreSQL to version 16**, you need
  to upgrade it manually: please refer to Section :ref:`pg-upgrade`.
  |product| :red:`no longer supports` PostgreSQL **12**, which must be
  upgraded to version **16** before upgrading |product| to
  |version|. Check section :ref:`pg-upgrade` for directions.

* The upgrade procedure using Ansible is slightly different depending
  if you already installed |wsc| or not. Choose the right
  :ref:`upgrade path <up-ansible-paths>` according to your setup.

* If you install |wsc| in the upgrade procedure:

  * The old, legacy Chats will be left untouched, i.e., it will
    neither be removed, nor set in read-only mode

  * No migration of the old (legacy) Chats to WSC will be performed

.. _ans-pb-install:

.. card::  Install ``carbonio_upgrade`` collection

   To install the latest ``carbonio_upgrade`` collection, issue the
   following command, which will install the necessary infrastructure to
   use for the |product| upgrade.

   .. code:: console

      $ ansible-galaxy collection install zxbot.carbonio_upgrade

.. _ans-pb-up:

.. card:: Update Ansible Galaxy collection

  The collection is version-dependant: to upgrade |product| to version
  |version|, you need to have the **same main version** of the
  collection. For example, to upgrade to version **25.3.0**, the
  collection version must be **25.3.X**, regardless of the last
  number. To install the latest version of the collection, execute the
  following command.

  .. code:: console

     $ ansible-galaxy collection install -U zxbot.carbonio_upgrade

.. _ans-pb-check:

.. card:: Check current Collection version

   To verify the currently installed version of the collection, execute
   command

   .. code:: console

      $ ansible-galaxy collection list zxbot.carbonio_upgrade

   The output will be similar to::

     # /home/ansible/.ansible/collections/ansible_collections
     Collection             Version
     ---------------------- -------
     zxbot.carbonio_upgrade 25.3.0

   This version of the collection can be used to upgrade |product| to
   the most recent version in the **25.3** series of |product|.

.. No specific requirement is required to upgrade to  |product|
   |version|.

.. _up-ansible-paths:

Upgrade Paths
=============

To upgrade with Ansible, the inventory file must accurately reflect
the |product| infrastructure. This is particularly important if you
installed |product| manually and are now upgrading with Ansible. In
this case, you can use an inventory file from one of the
:ref:`scenarios` and adapt it to your |carbonio| infrastructure. See
section :ref:`ansible-inventory` for directions.

These are the alternatives to upgrade an existent |product|
infrastructure, depending if you have installed the latest **24.12**
version or an older one.

.. hint:: If you are unsure, :ref:`check the command <ts-version>` to
   retrieve the correct version number.

Upgrade From |product| 24.12
----------------------------

If you are upgrading from the **24.12** series version (**24.12.0**
and **24.12.1**), there are two different paths, depending on whether
you previously installed with Ansible or not.

|product| was Installed with Ansible
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. The infrastructure has **no** |WSC| Component installed. In this case,
   add an this (empty) block at the end of the file::

     [workStreamServers]

   You can now proceed to Section :ref:`up-ansible-run` below.

#. The |WSC| Component was manually installed. In this case, edit the
   inventory file and add this block at the end of the file::

     [workStreamServers]
     wsc.example.com

   Replace the ``wsc.example.com`` string with the actual FQDN of the
   Node on which |wsc| is installed, then proceed to Section
   :ref:`up-ansible-run` below.

|product| was Manually Installed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. The infrastructure has **no** |WSC| Component installed. You need to
   compile the inventory file, then you can proceed to Section
   :ref:`up-ansible-run` below.

#. The infrastructure has the |WSC| Component installed. Compile the
   inventory file and then, like in the previous case, edit the
   inventory file and add this block at the end of the file::

     [workStreamServers]
     wsc.example.com

   Replace the ``wsc.example.com`` string with the actual FQDN of the
   Node on which |wsc| is installed, then proceed to Section
   :ref:`up-ansible-run` below.

.. card:: |product| has both  |wsc| and Legacy Chats installed

   Regardless if you installed manually or with Ansible, if both the
   |WSC| Component and the legacy Chats and Video Server Components are
   installed, you need to edit the inventory file like above::

     [workStreamServers]
     wsc.example.com

   Ansible will take care of upgrading all Nodes, including those
   installing the legacy Components. Note, however, that there are no
   updates to the packages providing these Components, so they will keep
   the same version.

In both cases, you need to save the inventory file in the :file:`data`
directory (see Section :ref:`up-ansible-run` below`). You must also
save in that directory these additional files, which contain access
passwords for various services. You should have saved these password
during the installation process.

#. :file:`inventory_postgrespassword` must contain the password of PostgreSQL
   administrative user, called ``DB_ADM`` in the documentation.

#. :file:`inventory_ldap_password` must contain the password that you
   can retrieve with the command, executed as the |zu| on the node
   featuring the Mesh & Directory Component

   .. code:: console

      zextras$ zmlocalconfig -s | grep ldap_password"

#. :file:`inventory_consulpassword` must contain the password stored in
   file :file:`/var/lib/service-discover/password`

#. :file:`inventory_videoserver_password` must contain the password
   used by the |vs|, that you can retrieve with the command, executed
   as the |ru| on the Node installing the |vs|:

   .. code:: console

      # grep api_secret /etc/janus/janus.jcfg

Upgrade From |product| 24.9 or Older
------------------------------------

If you are upgrading from the **24.9** version or older, you need to
make sure that you inventory file still contains the **DB Connector**
Component::

  [dbsConnectorServers]
  srv3.example.com

Replace the ``srv3.example.com`` string with the actual FQDN of the
Node on which the Component is installed.

While the Component was removed, its presence is necessary to allow Ansible
to properly deal with the packages providing the Component: :file:`pgpool`
will be removed, while the :file:`*-db` packages will be moved to the Node
where the Database Component is installed.

After the successful upgrade, the Component can be emptied and a comment
can be added to the inventory file, for example::

  ### Keep this Component empty and uncommented
  [dbsConnectorServers]


.. _up-ansible-run:

Run the Upgrade
---------------

To run the upgrade, you need to move to the directory where you have
the **inventory file** of your installation (it is called :file:`data`
in the :ref:`ansible-setup` Section), then issue the command
below. Before running it, please note that:

* The command will automatically remove all unused dependencies
  installed on your system. To prevent this behaviour, add to the
  command line the option :command:`--extra-vars skip_autoremove=1`

  * Packages that were manually installed and are no longer used will
    **not** be removed from your system: you need to remove them
    manually

.. code:: console

   $ ansible-playbook zxbot.carbonio_upgrade.carbonio_upgrade \
   -u root -i carbonio-inventory

In case the procedure does not complete successfully, you can run the
command a second time, during which the  tasks that successfully run
will be skipped. For details, refer to Section :ref:`ansible-ts`.
