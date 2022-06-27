.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv3 - MTA - mailsystem
   
On this node, install the packages

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-mta
 
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-mta

These following tasks must be executed to configure the MTA.

#. Bootstrap Carbonio, using SRV2 hostname and LDAP password when required.

   .. code:: console

      # carbonio-bootstrap

#. Copy credentials from the Service-Discover server node (SRV2) to the
   local server.

   .. code:: console

      # scp root@[SRV2_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

   .. hint:: the SRV2_IP can be retrieved using command :command:`su -
      zextras -c "zmprov gas service-discover"`

#. Run |mesh| setup using the password created on SRV2
   (``MESH_CLUSTER_PWD``).

   .. code:: console

      # service-discover setup-wizard
