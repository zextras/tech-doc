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
           carbonio-storages carbonio-user-management \
           carbonio-files carbonio-docs-connector \
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

   .. code:: console

      # carbonio-bootstrap

   In the bootstrap menu, use |srv2h|, |ldappwd|, and
   |nginxpwd| in the following items to complete successfully the
   bootstrap.

   * ``Ldap master host``: |srv2h|
   * ``Ldap Admin password``: |ldappwd|
   * ``Bind password for nginx ldap user``: |nginxpwd|

#. Copy the credentials from the |mesh| server node (SRV2) to the
   local server

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


#. Run as the ``zextras user`` the following command to configure the
   Video Recording, using |vsip|, |servletport| and |vspwd| configured
   on SRV4

   .. code:: console

      zextras$ carbonio chats video-server add VS_IP port 8188 \
        servlet_port SERVLET_PORT secret VS_PWD

#. Enable Chats and Video Recording, issuing the commands as the ``zextras user``

   .. code:: console

      zextras$ carbonio config set global teamVideoServerRecordingEnabled true
      zextras$ carbonio config set cos default teamChatEnabled true

#. (optional) Activate the license as the ``zextras user``

   .. code:: console

      zextras$ carbonio core activate-license TOKEN
