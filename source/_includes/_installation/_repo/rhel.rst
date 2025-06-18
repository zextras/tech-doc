.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      This step is not needed.

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      This step is not needed.

   .. tab-item:: RHEL 8
      :sync: rhel8

      You need to add the EPEL repository and enable
      the BaseOS, Appstream, and CodeReady repositories.

      .. code:: console

         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
         # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

   .. tab-item:: RHEL 9
      :sync: rhel9

      You need to add the EPEL repository and enable the BaseOS,
      Appstream, and CodeReady repositories.

      .. code:: console

         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
         # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms
