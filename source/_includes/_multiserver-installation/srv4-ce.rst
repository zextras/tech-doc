.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - proxy and vs
   
This node featurs the Proxy, and all the ``*-ui`` files (i.e., the
front-end packages for |file| and |adminui|) will be installed here.

#. Install packages

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-agent carbonio-proxy \ 
              carbonio-webui carbonio-files-ui \
              carbonio-admin-ui carbonio-admin-console-ui

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install service-discover-agent carbonio-proxy \
              carbonio-webui carbonio-files-ui \
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

#.  Run |mesh| setup using |meshsec|
   
    .. code:: console

       # service-discover setup-wizard

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

#. Enable ``Memcached`` access using the commands as the ``zextras`` user:

   .. code:: console
             
      zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
      zextras$ zmmemcachedctl restart
      zextras$ zmproxyctl restart

   .. warning:: Since ``Memcached`` does not support authentication,
      make sure that the Memcached port (**11211**) is accessible only
      from internal, trusted networks.

