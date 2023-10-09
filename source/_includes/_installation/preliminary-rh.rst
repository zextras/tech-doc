.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0
             
If you plan to install |product| on RHEL 8, these tasks are required
before attempting the installation.

.. card:: Repositories

   A subscription to the follow repositories must be active (you must
   be able to fetch from **BaseOS** and the other main repositories)::

     # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms

   The **CodeReady** repository enabled::

     # subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

.. card:: SELinux 

   SELinux Must be set to **disabled** or **permissive** in file
   :file:`/etc/selinux/config`. You can check the current profile
   using the command

   .. code:: console

      # sestatus
