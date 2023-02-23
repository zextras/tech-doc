.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

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
