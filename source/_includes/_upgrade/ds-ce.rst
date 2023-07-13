.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

As a preliminary task, we backup the LDAP data of the Directory
Server. On a Multi-Server installation, execute the following commands
on the node with the Directory Server Role installed, which is
|dsnode| in our scenario.

#. Make a dump of the LDAP Database, especially if the if the upgrade
   includes the Directory Server. This can be done using the command
   (as the ``zextras`` user)

   .. code:: console

      zextras$ /opt/zextras/libexec/zmslapcat /tmp

   .. note:: The dump will be saved in the :file:`/tmp/` directory, so
      make sure to copy it to a **safe** location.

#. Make a backup copy of file
   :file:`/opt/zextras/conf/localconfig.xml` and **store it in a
   safe place**
