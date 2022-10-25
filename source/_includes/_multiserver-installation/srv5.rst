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

      Make sure to respect the order of installation.

      .. code:: console

         # yum install service-discover-agent carbonio-appserver
         # yum install carbonio-files
         # yum install carbonio-user-management carbonio-advanced carbonio-zal
         # yum install carbonio-docs-connector carbonio-docs-editor

Execute the following tasks.

#. Bootstrap |carbonio|

   .. include:: /_includes/_installation/bootstrap.rst

   In the bootstrap menu, use ``SRV2_hostname``, ``LDAP_PWD``, and
   ``NGINX_PWD`` in the following items to complete successfully the
   bootstrap.

   * ``Ldap master host``: ``SRV2_hostname``
   * ``Ldap Admin password``: ``LDAP_PWD``
   * ``Bind password for nginx ldap user``: ``NGINX_PWD``

#. Copy the credentials from the |mesh| server node (SRV2) to the
   local server

   .. code:: console

      # scp root@[SRV2_hostname]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

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
