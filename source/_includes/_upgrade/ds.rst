As a preliminary task, we backup the LDAP data of the Directory
Server. On a Multi-Server installation, execute the following commands
on the Node with the Directory Server Component installed.

#. Make a dump of the LDAP Database, especially if the upgrade
   includes the Directory Server. This can be done using the command
   (as the ``zextras`` user)

   .. code:: console

      zextras$ /opt/zextras/libexec/zmslapcat /tmp

   .. note:: The dump will be saved in the :file:`/tmp/` directory, so
      make sure to copy it to a **safe** location.

#. Make a backup copy of file
   :file:`/opt/zextras/conf/localconfig.xml` and **store it in a
   safe place**


#. It is necessary that all services, especially OpenLDAP, be running
   during the whole procedure

   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            zextras$ zmcontrol status

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            zextras$ zmcontrol status

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         To see the status of only a service, use the new systemd
         commands that replace the :command:`zmcontrol` commands (see
         :ref:`systemd-targets`).

      .. tab-item:: RHEL 9
         :sync: rhel9

         To see the status of only a service, use the new systemd
         commands that replace the :command:`zmcontrol` commands (see
         :ref:`systemd-targets`).

   If in the output some service appears as not running, start it.
