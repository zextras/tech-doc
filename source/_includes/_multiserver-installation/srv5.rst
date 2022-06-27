.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv5 - Advanced, AppServer, Files, and Docs
   
On this node, first install all the required packages for |file|, and .

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-appserver \
           carbonio-user-management carbonio-files carbonio-advanced \
           carbonio-zal carbonio-docs-connector-ce \
           carbonio-docs-editor
 
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-appserver \
           carbonio-user-management carbonio-files carbonio-advanced \
           carbonio-zal carbonio-docs-connector-ce \
           carbonio-docs-editor

Execute the following tasks: make sure you keep at hand the data
configured on the other nodes (SRV2 hostname, LDAP password,
``MESH_CLUSTER_PWD``, and ``MTA_IP``).

#.  Bootstrap Carbonio, using SRV2 hostname, LDAP password, and
    ``MTA_IP`` when required.

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
      
#. restart the mailbox process

   .. code:: console

      # su - zextras -c "zmmailboxdctl restart"

 
#. Run the command proposed during the |vs| installation, using
   ``SERVLET_PORT`` and ``VS_IP`` configured on SRV4.

   .. code:: console

      # carbonio chats video-server add VS_IP port 8100 \
        servlet_port SERVLET_PORT secret VS_PWD


#. Enable Chats and VideoServerRecording

   .. code:: console

      # carbonio config set global teamVideoServerRecordingEnabled true
      # carbonio config set cos default teamChatEnabled true

#. (optional) Activate the license

   .. code:: console

      # carbonio core activate-license TOKEN
