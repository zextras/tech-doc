.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv4 - proxy and vs

This node featurs the proxy, the ``*-ui`` files (i.e., the front-end
packages for |team|, |adminui|, and |file|), then the packages related to
|vs|. Since Proxy and |vs| are different roles, we separate their
installation and setup, so they can easily be installed on different
nodes.

.. card::

   Proxy Installation and Node Setup
   ^^^^^

   The proxy functionality requires no configuration, so we can just
   install the packages and configure the node only.

   #. Install packages

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install service-discover-agent carbonio-proxy \
                 carbonio-webui carbonio-files-ui carbonio-chats-ui \
                 carbonio-admin-ui carbonio-admin-console-ui

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install service-discover-agent carbonio-proxy \
                 carbonio-webui carbonio-files-ui carbonio-chats-ui \
                 carbonio-admin-ui carbonio-admin-console-ui

   #. Bootstrap |carbonio|

      .. code:: console

         # carbonio-bootstrap

      In the bootstrap menu, use |srv2h|, AND |ldappwd| in
      the following items to complete successfully the bootstrap.

      * ``Ldap master host``: |srv2h|
      * ``Ldap Admin password``: |ldappwd|

   #. Copy credentials from the |mesh| server node (SRV2) to the local
      server

      .. code:: console

         # scp root@[SRV2_hostname]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
           /etc/zextras/service-discover/cluster-credentials.tar.gpg

   #. Run |mesh| setup using |meshsec|

      .. code:: console

         # service-discover setup-wizard

   #. Complete |mesh| setup

      .. code:: console

         # pending-setups -a

      .. hint:: The **secret** needed to run the above command is stored
         in file :file:`/var/lib/service-discover/password` which is
         accessible only by the ``root`` user.

.. card::

   |vs| and Video Recording
   ^^^^^

   It is possible to install the |vs| without the Video Recording
   feature. If you wish to do so, follow the procedure below, but
   *skip the last step*, labelled **[Video Recording]**.

   #. Install |vs| package

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install carbonio-videoserver

         .. tab-item:: RHEL
            :sync: rhel

            Before starting the procedure, install Fedora's epel-repository.

            .. code:: console

               # yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

            Then, install the packages.

            .. code:: console

               # dnf install carbonio-videoserver

      After the installation, make sure that the |vs| `public` IP address
      (i.e., the one that will accept incoming connections to the |vs|)
      is present in the configuration file :file:`/etc/janus/janus.jcfg`
      and add it if missing.

   #. Enable and start the service with the commands

      .. code:: console

         # systemctl enable videoserver.service
         # systemctl start  videoserver.service

   #. Enable ``Memcached`` access using the commands as the ``zextras`` user:

      .. code:: console

         zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
         zextras$ zmmemcachedctl restart
         zextras$ zmproxyctl restart

      .. warning:: Since ``Memcached`` does not support authentication,
         make sure that the Memcached port (**11211**) is accessible only
         from internal, trusted networks.

   #. **[Video Recording]** To implement this feature, install package

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install carbonio-videoserver-recorder

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install carbonio-videoserver-recorder


      The video-recording feature is enabled by default, and does not
      require configuration on this node, but in the next one. Indeed,
      it requires a node which installs the ``carbonio-appserver``
      packages. The recorded sessions will be stored on that node, in
      directory :file:`/var/lib/videorecorder/`. Make sure that the
      directory has sufficient free space, otherwise recorded videos
      can not be stored.

      .. hint:: You can mount on that location a dedicated disk or
         partition and keep it monitored for space usage.

.. card::

   Values used in the next steps
   ^^^^

   * |vsip| the local IP address of this node

   * |vspwd| the password of the |vs|, that can be retrieved by
     running as the ``root`` user the command :command:`grep -i -e
     nat_1_1 -e api_secret /etc/janus/janus.jcfg`


   * |servletport| the value of the `servlet port` configuration
     option saved in file
     :file:`/etc/carbonio/videoserver-recorder/recordingEnv`, needed
     when running the previous command
