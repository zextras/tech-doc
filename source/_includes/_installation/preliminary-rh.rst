You need to satisfy these requirements, depending on the RHEL version
you want to install:

.. _rhel8-req:

RHEL 8
++++++

.. card:: Repositories

   If you plan to install |product| on RHEL 8, you need an active
   subscription to the following repositories, i.e., you must be able
   to fetch packages from them

   * **BaseOS** and the other main repositories::

       # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms

   * **Appstream**::

       # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms

   * **CodeReady**::

       # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

   * **EPEL**::

       # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

.. card:: SELinux

   SELinux Must be set to **disabled** or **permissive** in file
   :file:`/etc/selinux/config`. You can check the current profile
   using the command

   .. code:: console

      # sestatus

.. card:: Ansible Requirements

   If you plan to install |product| using Ansible (see Section
   :ref:`install-with-ansible`), the **Control Node** must be equipped
   with the following software:

   * Python 3.12

   * Latest Ansible version (**2.6.9**)

   Moreover, to connect to the Control Node you must use the
   :command:`ssh` command with the ``-A`` option, e.g.:

   .. code:: console

      $ ssh -A root@mail.example.com


   Remember to replace ``mail.example.com`` with the name or IP of the
   control node.

.. _rhel9-req:

RHEL 9 |beta|
+++++++++++++

.. card:: Repositories

   If you plan to install |product| on RHEL 9, you need an active
   subscription to the following repositories, i.e., you must be able
   to fetch packages from them

   * **BaseOS** and the other main repositories::

       # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms

   * **Appstream**::

       # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms

   * **CodeReady**::

       # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms

   * **EPEL**::

       # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

.. card:: SELinux

   SELinux Must be set to **disabled** or **permissive** in file
   :file:`/etc/selinux/config`. You can check the current profile
   using the command

   .. code:: console

      # sestatus

.. card:: Ansible Requirements

   If you plan to install |product| using Ansible (see Section
   :ref:`install-with-ansible`), the **Control Node** must be equipped
   with the following software:

   * Python 3.12

   * Latest Ansible version (**2.6.9**)

   Moreover, to connect to the Control Node you must use the
   :command:`ssh` command with the ``-A`` option, e.g.:

   .. code:: console

      $ ssh -A root@mail.example.com

   Remember to replace ``mail.example.com`` with the name or IP of the
   control node.

.. index:: Systemd commands; on RHEL9

.. _rhel-systemd:

.. card:: New ``systemd`` units to replace ``zmcontrol``

   By installing |product| on RHEL 9 you will no longer be able to
   manage |carbonio| services with the legacy :command:`zmcontrol
   start <service>`, :command:`zmcontrol restart <service>`, and
   :command:`zmcontrol stop <service>` commands. Interaction with
   services should be done exclusively through systemd commands.

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
      the following **four** Role-specific ``systemd`` commands, which
      must be executed on the Node on which the Role is installed.

      .. code:: console

         # systemctl start/stop/restart carbonio-directory-server.target
         # systemctl start/stop/restart carbonio-appserver.target
         # systemctl start/stop/restart carbonio-mta.target
         # systemctl start/stop/restart carbonio-proxy.target
