.. index:: Systemd; and zmcontrol

.. _rhel-systemd:

.. card:: New ``systemd`` units to replace ``zmcontrol``

   By installing |product| on RHEL 9 or Ubuntu 24.04 you will no
   longer be able to manage |carbonio| services with the legacy
   :command:`zmcontrol start <service>`, :command:`zmcontrol restart
   <service>`, and :command:`zmcontrol stop <service>`
   commands. Interaction with services should be done exclusively
   through systemd commands.

   .. note:: The :command:`zmcontrol -v` command, used to retrieve
      |product|'s configuration, will continue working as usual.

   The following are useful commands that can be used to manage the
   new ``systemd`` units and find the replacement of the
   :command:`zmcontrol` commands.

   #. Get the list of all |carbonio| services

      .. code:: console

         # systemctl list-unit-files


   #. Check the status of a service, for example |task|

      .. code:: console

         # systemctl status carbonio-tasks.service

   #. To manage a service's start, stop, and restart, replace ``status`` in the
      above command with: ``start``, ``stop``, and ``restart``
      respectively.

   #. :command:`zmcontrol start | stop | restart` is no longer
      available and can not be used as a convenience to restart all
      |carbonio| services at once. This command has been replaced by
      the following **four** Component-specific ``systemd`` commands, which
      must be executed on the Node on which the Component is installed.

      .. code:: console

         # systemctl start/stop/restart carbonio-directory-server.target
         # systemctl start/stop/restart carbonio-appserver.target
         # systemctl start/stop/restart carbonio-mta.target
         # systemctl start/stop/restart carbonio-proxy.target

   .. seealso:: Insights on the new ``systemd`` units and the new
      commands can be found in sections :ref:`systemd-targets` and
      :ref:`systemd-guide`, respectively.
