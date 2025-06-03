
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
