.. _up-ansible-old-rel:

Upgrade Using Ansible from older versions
=========================================

To upgrade with Ansible, the inventory file must accurately reflect
the |product| infrastructure. This is particularly important if you
installed |product| manually and are now upgrading with Ansible. In
this case, you can use an inventory file from one of the
:ref:`scenarios` and adapt it to your |carbonio| infrastructure. See
section :ref:`ansible-inventory` for directions.

These are the alternatives to upgrade an existent |product|
infrastructure, depending if you have installed the **24.12**
version or an older one.

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
     chats.example.com

   Replace the ``chats.example.com`` string with the actual FQDN of the
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
     chats.example.com

   Replace the ``chats.example.com`` string with the actual FQDN of
   the Node on which |wsc| is installed, then proceed to Section
   :ref:`up-ansible-run` below.

.. card:: |product| has both  |wsc| and Legacy Chats installed

   Regardless if you installed manually or with Ansible, if both the
   |WSC| Component and the legacy Chats and Video Server Components are
   installed, you need to edit the inventory file like above::

     [workStreamServers]
     chats.example.com

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

.. include:: /_includes/_upgrade/run-upgrade.rst
