.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - proxy and vs
   
On this node you need to install the proxy, the ``*-ui`` files (i.e.,
the front-end packages for |team| and |file|, then the packages
related to |vs|. Since Proxy and |vs| are different roles, we separate
their installation and setup, so they can easily be installed on
different nodes.

These tasks need to be carried out for the Proxy.

#. install packages

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-agent carbonio-proxy \ 
              carbonio-webui carbonio-files-ui carbonio-chats-ui 

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install service-discover-agent carbonio-proxy \
              carbonio-webui carbonio-files-ui carbonio-chats-ui

#.  Bootstrap Carbonio, using SRV2 hostname and LDAP password when
    required.

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

To set up the |vs|, these are the necessary tasks.

#. Install packages

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install carbonio-videoserver carbonio-videoserver-recorder
 
      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install carbonio-videoserver carbonio-videoserver-recorder


#. Enable and start the service with the commands
   
   .. code:: console
   
      # systemctl enable videoserver.service 
      # systemctl start  videoserver.service

#. Enable ``Memcached`` access using the commands

   .. code:: console
             
      # carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
      # zmmemcachedctl restart
      # zmproxyctl restart

   .. warning:: Since ``Memcached`` does not support authentication,
      make sure that the Memcached port (**11211**) is accessible only
      from internal, trusted networks.

The video-recording feature is enabled by default, and recorded
sessions are stored in directory :file:`/var/lib/videorecorder/`. Make
sure that the directory has sufficient free space, otherwise recorded
videos can not be stored.

.. hint:: You can mount on that location a dedicated disk or partition
   and keep it monitored for space usage.
