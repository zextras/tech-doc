.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv5 - Advanced, AppServer, Files, and Docs
   
On this node, first install all the required packages for |file|, then
configure the various services needed.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-appserver \
           carbonio-storages-ce carbonio-user-management \
           carbonio-files-ce carbonio-docs-connector-ce \
           carbonio-docs-editor
           
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install  service-discover-agent carbonio-appserver \
           carbonio-storages-ce carbonio-user-management
           carbonio-files-ce carbonio-docs-connector-ce \
           carbonio-docs-editor

Execute the following tasks: make sure you keep at hand the data
configured on the other nodes (``SRV2_hostname``, ``LDAP_PWD``,
``MESH_SECRET``, and ``MTA_IP``).

#. Bootstrap |carbonio|, using the data from previous tasks when required

   .. code:: console

      # carbonio-bootstrap

#. Copy credentials from the |mesh| server node (SRV2) to the local
   server

   .. code:: console

      # scp root@[SRV2_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

   .. hint:: The ``SRV2_IP`` can be retrieved using command :command:`su -
      zextras -c "carbonio prov gas service-discover"`

#. Run |mesh| setup using ``MESH_SECRET``

   .. code:: console

      # service-discover setup-wizard

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

#. Let |file| use Memcached. Edit file
   :file:`/etc/carbonio/files/config.properties` and search for
   section **# Nginx Lookup servers**.

   .. code-block:: apache
      :linenos:

      # Nginx Lookup servers
      nginxlookup.server.protocol=https 
      nginxlookup.server.urls=127.0.0.1 
      memcached.server.urls=127.0.0.1   

   Make sure that:
   
   * in line 2 protocol is **https**
   * in line 3 there is at least the current node's (SRV5) IP
   * in line 4 the SRV4_IP is written, to allow this node's access to Memcached

#. restart the |file| processes:

   .. code:: console

      # systemctl restart carbonio-files
      # systemctl restart carbonio-files-sidecar

