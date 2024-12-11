In order to configure |product|'s repository, you need to add one file
with the necessary information.

It you install |product| on Ubuntu, you also need to import the GPG
key used for signing the packages and verify them.

.. card:: Configure Repository

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

      .. tab-item:: RHEL 9 |beta|
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

.. card:: Import GPG key

   This step is required only on Ubuntu systems (Ubuntu 20.04 and Ubuntu 22.04).

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         Download and save the GPG key

         .. code:: console

            # wget -O- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5dc7680bc4378c471a7fa80f52fd40243e584a21" \
            | gpg --dearmor | sudo tee \
            /usr/share/keyrings/zextras.gpg > /dev/null

         Assign correct access permissions to the key

         .. code:: console

            # chmod 644 /usr/share/keyrings/zextras.gpg

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         Download and save the GPG key

         .. code:: console

            # wget -O- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5dc7680bc4378c471a7fa80f52fd40243e584a21" \
            | gpg --dearmor | sudo tee \
            /usr/share/keyrings/zextras.gpg > /dev/null

         Assign correct access permissions to the key

         .. code:: console

            # chmod 644 /usr/share/keyrings/zextras.gpg

      .. tab-item:: RHEL 8
         :sync: rhel8

         This step is not needed.

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         This step is not needed.
