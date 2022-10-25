
.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - proxy and vs

This node featurs the proxy, the ``*-ui`` files (i.e., the front-end
packages for |team|, |adminui|, and |file|), then the packages related to
|vs|. Since Proxy and |vs| are different roles, we separate their
installation and setup, so they can easily be installed on different
nodes.

These tasks need to be carried out for the Proxy.

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

   .. include:: /_includes/_installation/bootstrap.rst

   In the bootstrap menu, use ``SRV2_hostname``, AND ``LDAP_PWD`` in
   the following items to complete successfully the bootstrap.

   * ``Ldap master host``: ``SRV2_hostname``
   * ``Ldap Admin password``: ``LDAP_PWD``

#. Copy credentials from the |mesh| server node (SRV2) to the local
   server

   .. code:: console

      # scp root@[SRV2_hostname]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

#. Run |mesh| setup using ``MESH_SECRET``
   
   .. code:: console

      # service-discover setup-wizard

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

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

The video-recording feature is enabled by default, and recorded
sessions are stored in directory :file:`/var/lib/videorecorder/`. Make
sure that the directory has sufficient free space, otherwise recorded
videos can not be stored.

.. hint:: You can mount on that location a dedicated disk or partition
   and keep it monitored for space usage.

.. card::

   Values used in the next steps
   ^^^^

   * ``VS_IP``: the local IP address of this node

   * ``SERVLET_PORT``: the value of the `servlet port` configuration
     option saved in file
     :file:`/etc/carbonio/videoserver-recorder/recordingEnv`, needed when
     running the previous command
