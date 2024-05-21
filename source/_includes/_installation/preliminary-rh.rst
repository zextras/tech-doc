.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

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

.. card:: New ``systemd`` units to replace ``zmcontrol``

   By installing |product| on RHEL 9 you will no longer be able to
   manage |carbonio| services with the legacy :command:`zmcontrol
   start <service>`, :command:`zmcontrol restart <service>`, and
   :command:`zmcontrol stop <service>` commands. Interaction with
   services should be done exclusively through systemd commands.

   .. note:: The :command:`zmcontrol -v` command, used to retrieve
      |product|'s configuration, will continue working as usual.

   To get the list of all |carbonio| services, use command

   .. code:: console

      # systemctl list-unit-files

   **Example**

   You can check the status of the |task| service with:

   .. code:: console

      # systemctl status carbonio-tasks.service

   To manage its start, stop, and restart, replace ``status`` in the
   above command with: ``start``, ``stop``, and ``restart``
   respectively.

   It will also not possible to use :command:`zmcontrol start | stop |
   restart` as a convenience to restart all |carbonio| services at
   once. This command will be replaced by Role-specific ``systemd``
   commands, to be executed on the Node on which they are installed.

   .. code:: console

      # systemctl start directory-server.service
      # systemctl start mta.service
      # systemctl start proxy.service
