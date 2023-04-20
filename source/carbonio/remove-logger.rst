.. _rm-logger:

==========================
 Remove |carbonio| Logger
==========================

The carbonio-logger service was removed in version **23.3.0**, because
the upstream software is no longer maintained and not suited for
|carbonio| anymore. 

In this section we guide you in the complete removal of the service
from a |product| installation, in three steps: remove the package,
then the directories, and finally the service.

.. note:: In a Multi-Server installation, all the commands below must
   be run on the node on which the Logger is installed.


If you need to redirect the log files produced by  ``syslog`` to a
centralised server, you can refer to section :ref:`centralised-logging`.

.. _rm-logger-package:

Remove Logger Package
=====================

The ``carbonio-logger`` package is no longer needed in |product|
installations and can be removed.  You can verify that it is still
present on the system with the following commands 

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt list carbonio-logger  
         carbonio-logger/focal,now 4.0.19-1ubuntu1~focal amd64 [installed]

      .. note:: If the string **[installed]** is not present in the
         output, the package was already removed.
         
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf list installed carbonio-logger  
         carbonio-logger.x86_64     4.0.19-1     zextras

      .. note:: This command returns the message *Error: No matching
         Packages to list* if the package is not installed

If the package is not installed, you can skip to the :ref:`next
section <rm-logger-dir>`

To remove the package, execute the command

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt remove -y carbonio-logger  
         
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf remove carbonio-logger 

.. _rm-logger-dir:

Remove Logger Directories
=========================
   
In some cases, during the upgrade procedure, a warning will warn that
the logger directory and its sub-directories is not empty and cannot
be deleted. For example, on Ubuntu::

  dpkg: warning: unable to delete old directory '/opt/zextras/logger/db/data': Directory not empty
  dpkg: warning: unable to delete old directory '/opt/zextras/logger/db': Directory not empty
  dpkg: warning: unable to delete old directory '/opt/zextras/logger': Directory not empty


These directories are no longer used and contain data relevant only
for the logger, so you can safely remove them

.. code:: console

   # rm -rf /opt/zextras/logger

.. _rm-logger-service:

Remove Logger Service
=====================

The final step is to remove the service from the |product|
installation, in which :bdg-secondary-line:`LOGGER_SRV_HOSTNAME`
is the hostname of the node where the Logger was installed.

.. code:: console

   zextras$ carbonio prov ms LOGGER_SRV_HOSTNAME -zimbraServiceEnabled \
   -zimbraServiceInstalled logger

