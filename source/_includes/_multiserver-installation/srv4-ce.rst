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

   .. include:: /_includes/_installation/bootstrap.rst

   In the bootstrap menu, use ``SRV2_hostname``, AND ``LDAP_PWD`` in
   the following items to complete successfully the bootstrap.

   * ``Ldap master host``: ``SRV2_hostname``
   * ``Ldap Admin password``: ``LDAP_PWD``

#. Copy credentials from the |mesh| server node (SRV2) to the local
   server

   .. code:: console

      # scp root@[SRV2_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

   .. hint:: the SRV2_IP can be retrieved using command :command:`su -
      zextras -c "carbonio prov gas service-discover"`

#.  Run |mesh| setup using ``MESH_SECRET``
   
    .. code:: console

       # service-discover setup-wizard --first-instance

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

.. card::

   Values used in the next steps
   ^^^^
    
   * ``VS_IP``: the IP address of this node

   * the command suggested during the |vs| installation (to be used on
     SRV5)

   * ``SERVLET_PORT``: the value of the `servlet port` configuration
     option saved in file
     :file:`/etc/carbonio/videoserver-recorder/recordingEnv`, needed when
     running the previous command

  
