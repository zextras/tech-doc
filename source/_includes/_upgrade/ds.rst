As a preliminary task, we backup the LDAP data of the Directory
Server. On a Multi-Server installation, execute the following commands
on the Node with the Directory Server Role installed.

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

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            zextras$ zmcontrol status

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            zextras$ zmcontrol status

         .. hint:: On RHEL 9, use the new systemd commands that
            replace the :command:`zmcontrol` command (see the
            :ref:`dedicated box <rhel-systemd>`).

   If in the output some service appears as not running, start it.
