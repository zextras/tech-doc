
.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      You need to create file :file:`/etc/apt/sources.list.d/zextras.list`
      and add the following content to it:

      .. code:: text

         deb [arch=amd64 signed-by=/usr/share/keyrings/zextras.gpg] https://repo.zextras.io/release/ubuntu focal main

      .. hint:: Make sure the above content is correctly saved on
         the same line

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      You need to create file :file:`/etc/apt/sources.list.d/zextras.list`
      and add the following content to it:

      .. code:: text

         deb [arch=amd64 signed-by=/usr/share/keyrings/zextras.gpg] https://repo.zextras.io/release/ubuntu jammy main

      .. hint:: Make sure the above content is correctly saved on
         the same line

   .. tab-item:: RHEL 8
      :sync: rhel8

      You need to create file :file:`/etc/yum.repos.d/zextras.repo`
      and add the following content to it:

      .. code:: text

         [zextras]
         name=zextras
         baseurl=https://repo.zextras.io/release/rhel8
         enabled=1
         repo_gpgcheck=1
         gpgcheck=0
         gpgkey=https://repo.zextras.io/repomd.xml.key

   .. tab-item:: RHEL 9
      :sync: rhel9

      You need to create file :file:`/etc/yum.repos.d/zextras.repo`
      and add the following content to it:

      .. code:: text

         [zextras]
         name=zextras
         baseurl=https://repo.zextras.io/release/rhel9
         enabled=1
         repo_gpgcheck=1
         gpgcheck=0
         gpgkey=https://repo.zextras.io/repomd.xml.key
