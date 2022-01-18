==========================
 |product| Uninstallation
==========================

This procedure is intended for a **complete** uninstallation of
|product| on an **Ubuntu 18.04 LTS Server Edition** and is suitable in
case you want to reinstall |product| on a clean system. If you want to
keep configuration files or logs, remember **to copy them to a
different directory** before starting this procedure.

Console access is required for successful completion, so make sure to log in as
``root`` user--or as a user with administrative provileges--then
execute the following commands **in the given order**.

At the end of the procedure, when all steps have been completed, no
|product| trace will be present on the system.

.. dropdown:: Step #1: stop service

   .. code:: console

      # su - zextras -c "zmcontrol stop"

.. dropdown:: Step #2: remove packages

   .. code:: console

      # apt purge "carbonio*"

   .. note:: After this step you may get a warning that while removing
      carbonio packages, some directories are not empty so they have not
      been removed.

.. dropdown:: Step #3: disable system service

   .. code:: console

      # systemctl disable carbonio

.. dropdown:: Step #4: remove unused packages

   .. code:: console

      # apt autoremove

.. dropdown:: Step #5: remove crontab entry

   .. code:: console

      # crontab -u zextras -r

.. dropdown:: Step #6: remove users

   .. code:: console

      # userdel -rf zextras
      # userdel postfix

.. warning:: The next steps will remove all files that do not belong
   to the ``carbonio-*`` packages: customised configuration files, log
   files, and system files. If you think you will need them, for
   example for diagnostics or troubleshooting, copy them away before
   removing them.

.. dropdown:: Step #7: remove dangling configuration files

   .. code:: console

      # rm -rf /opt/zextras/

.. dropdown:: Step #8: remove log and system files

   .. code:: console

      # rm /var/log/carbonio*
      # rm /etc/logrotate.d/carbonio
      # rm /etc/init.d/carbonio
      # rm /run/systemd/generator.late/carbonio.service

.. dropdown:: Step #9: remove repository

   .. code:: console

      # rm /var/lib/apt/lists/repo.zextras.io*
