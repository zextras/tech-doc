.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


We mentioned that the upgrade from |prev| to |version| involves the
Directory Server, so the procedure will be divided in three main
phases:

#. Make a backup of the Directory Server
#. Upgrade the Single-Server installation and reboot

.. rubric:: Phase 1: Make a backup of the Directory Server

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 1. Make a dump of the LDAP Database
      :columns: 12 12 6 6

      This task can be carried out using the command (as the
      ``zextras`` user)

      .. code:: console

         zextras$ opt/zextras/libexec/zmslapcat /tmp

      .. note:: The dump will be saved in the :file:`/tmp/` directory,
         so make sure to copy it to a **safe** location.
   
   .. grid-item-card:: Step 2. Backup LDAP configuration
      :columns: 12 12 6 6

      Make a backup copy of file
      :file:`/opt/zextras/conf/localconfig.xml` and **store it in a
      safe place**

.. rubric:: Phase 2: Upgrade the Single-Server installation

.. include:: /_includes/_upgrade/node.rst

After the restart, all services will be correctly registered to |mesh|
and will be working correctly.
