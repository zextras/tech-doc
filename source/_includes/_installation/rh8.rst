
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


