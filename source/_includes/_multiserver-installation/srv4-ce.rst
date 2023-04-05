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
	      carbonio-admin-ui carbonio-admin-console-ui \
	      carbonio-prometheus-node-exporter \
	      carbonio-prometheus-nginx-exporter

      .. tab-item:: RHEL
	 :sync: rhel

	 .. code:: console

	    # dnf install service-discover-agent carbonio-proxy \
	      carbonio-webui carbonio-files-ui \
	      carbonio-admin-ui carbonio-admin-console-ui \
	      carbonio-prometheus-node-exporter \
	      carbonio-prometheus-nginx-exporter

#. Bootstrap |carbonio|

   .. code:: console

      # carbonio-bootstrap

   In the bootstrap menu, use |srv2h|, AND |ldappwd| in
   the following items to complete successfully the bootstrap.

   * ``Ldap master host``: |srv2h|
   * ``Ldap Admin password``: |ldappwd|
   * ``Bind password for nginx ldap user``: |nginxpwd|

#.  Run |mesh| setup using |meshsec|

    .. code:: console

       # service-discover setup-wizard

   Since this node is not the |mesh| Server, the
   :file:`cluster-credentials.tar.gpg` file will be automatically
   downloaded.

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

   .. hint:: The **secret** needed to run the above command is stored
      in file :file:`/var/lib/service-discover/password` which is
      accessible only by the ``root`` user.

   #. Make sure the |monit| exporter's firewall ports (**9100** and
      **9113**) are open on the internal network, to allow the correct
      communication with the server, that will be installed on
      :bdg-secondary-line:`SRV-6`.


#. Enable ``Memcached`` access using the commands as the ``zextras`` user:

   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
      zextras$ zmmemcachedctl restart
      zextras$ zmproxyctl restart

   .. warning:: Since ``Memcached`` does not support authentication,
      make sure that the Memcached port (**11211**) is accessible only
      from internal, trusted networks.


.. card:: Values used in the next steps

   * |srv4ip| the IP address of the node
