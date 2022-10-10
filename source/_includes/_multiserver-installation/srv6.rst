.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv6 - AppServer - Advanced - Preview - Logger


On this node we install the Preview, the Logger, the User Management,
and advanced services.

.. hint:: We suggest that *Preview* and the |docs|-related packages be
   installed on different physical nodes.

First install all the necessary packages:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-appserver \
           carbonio-user-management carbonio-preview \
           carbonio-advanced carbonio-zal  carbonio-logger

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-appserver \
           carbonio-user-management carbonio-preview \
           carbonio-advanced carbonio-zal  carbonio-logger

Execute the following tasks: make sure you keep at hand the data
configured on the other nodes (``SRV2_hostname``, ``LDAP_PWD``,
``MESH_CLUSTER_PWD``, and ``MTA_IP``).

#. Bootstrap |carbonio|, using the data from previous tasks when
   required
   
   .. code:: console

      # carbonio-bootstrap

#. Copy credentials from the |mesh| server node (SRV2) to the local
   server.

   .. code:: console

      # scp root@[SRV2_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

   .. hint:: the SRV2_IP can be retrieved using command :command:`su -
      zextras -c "carbonio prov gas service-discover"`

#. Run |mesh| setup using ``MESH_CLUSTER_PWD``

   .. code:: console

      # service-discover setup-wizard

#. Fix carbonio-mailbox token access

   .. code:: console

      # chmod a+r /etc/zextras/carbonio-mailbox/token

#. Let |pv| use Memcached. Edit file
   :file:`/etc/carbonio/preview/config.ini` and search for
   section **# Nginx Lookup servers**.

   .. code-block:: ini
      :linenos:

      nginx_lookup_server_full_path_urls = https://127.0.0.1:7072 #<<--- must be the address of the application server. for a single server it's ok
      memcached_server_full_path_urls = 127.0.0.1:11211           #<<--- must be the address of the memcached server. for a single server it's ok

   Make sure that:

   * in line 1 protocol is **https** and the IP address the current
     node's (SRV6) IP
   * in line 2 there is the Memcached node's (SRV5) IP

#. Restart the mailbox process

   .. code:: console

      # su - zextras -c "zmmailboxdctl restart"
