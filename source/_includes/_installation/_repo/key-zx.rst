
.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      Download and save the GPG key

      .. code:: console

         # wget -O- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5dc7680bc4378c471a7fa80f52fd40243e584a21" | gpg --dearmor | sudo tee /usr/share/keyrings/zextras.gpg > /dev/null

      Assign correct access permissions to the key

      .. code:: console

         # chmod 644 /usr/share/keyrings/zextras.gpg

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      Download and save the GPG key

      .. code:: console

         # wget -O- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5dc7680bc4378c471a7fa80f52fd40243e584a21" | gpg --dearmor | sudo tee /usr/share/keyrings/zextras.gpg > /dev/null

      Assign correct access permissions to the key

      .. code:: console

         # chmod 644 /usr/share/keyrings/zextras.gpg

   .. tab-item:: RHEL 8
      :sync: rhel8

      This step is not needed.

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      This step is not needed.
