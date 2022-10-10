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
           carbonio-user-management carbonio-files carbonio-advanced \
           carbonio-zal carbonio-docs-connector \
           carbonio-docs-editor
 
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-appserver \
           carbonio-user-management carbonio-files carbonio-advanced \
           carbonio-zal carbonio-docs-connector \
           carbonio-docs-editor

Execute the following tasks: make sure you keep at hand the data
configured on the other nodes (``SRV2_hostname``, ``LDAP_PWD``,
``MESH_CLUSTER_PWD``, and ``MTA_IP``).

#.  Bootstrap |carbonio|, using the data from previous tasks when required

   .. code:: console

      # carbonio-bootstrap

#. Copy the credentials from the |mesh| server node (SRV2) to the
   local server

   .. code:: console

      # scp root@[SRV2_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

   .. hint:: The ``SRV2_IP`` can be retrieved using command :command:`su -
      zextras -c "carbonio prov gas service-discover"`

#. Run |mesh| setup using ``MESH_CLUSTER_PWD``

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

#. Fix carbonio-mailbox token access
   
   .. code:: console

      # chmod a+r /etc/zextras/carbonio-mailbox/token

#. restart the mailbox process

   .. code:: console

      # su - zextras -c "zmmailboxdctl restart"

 
#. Run as the ``zextras user`` the command proposed during the |vs|
   installation, using ``SERVLET_PORT`` and ``VS_IP`` configured on
   SRV4. 

   .. code:: console

      zextras$ carbonio chats video-server add VS_IP port 8188 \
        servlet_port SERVLET_PORT secret VS_PWD

   .. hint:: ``VS_PWD`` was given as part of the command, but can be
      retrieved using this command.

      .. code:: console

         # grep -i -e nat_1_1 -e api_secret /etc/janus/janus.jcfg


#. Enable Chats and VideoServerRecording, issuing the commands as the ``zextras user``

   .. code:: console

      zextras$ carbonio config set global teamVideoServerRecordingEnabled true
      zextras$ carbonio config set cos default teamChatEnabled true

#. (optional) Activate the license as the ``zextras user``

   .. code:: console

      zextras$ carbonio core activate-license TOKEN
