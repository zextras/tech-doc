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
           carbonio-advanced carbonio-zal \
           carbonio-user-management \
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
      nginxlookup.server.urls=172.16.0.15
      memcached.server.urls=172.16.0.14

   Make sure that:

   * in line 2 protocol is **https**
   * in line 3 there must be the IP address of one AppServer, we use
     the current node's IP Address for simplicity
   * in line 4 |vsip| is written, to allow this node's access to
     Memcached, which is installed on the *Proxy Node*

#. Fix carbonio-mailbox token access

   .. code:: console

      # chmod a+r /etc/zextras/carbonio-mailbox/token

#. restart the mailbox process as the ``zextras`` user

   .. code:: console

      zextras$ zmcontrol stop
      zextras$ zmcontrol start

#. Run as the ``zextras user`` the following command to configure the
   Video Recording, using |vsip|, |servletport| and |vspwd| configured
   on SRV4

   .. code:: console

      zextras$ carbonio chats video-server add VS_IP port 8188 \
        servlet_port SERVLET_PORT secret VS_PWD

#. Enable |vs| at COS level, Video Recording, and the possibility for
   each user to record meetings.

   .. code:: console

      zextras$ carbonio config set cos default teamChatEnabled true
      zextras$ carbonio config set global teamVideoServerRecordingEnabled true
      zextras$ carbonio config set global teamMeetingRecordingEnabled true

   .. note:: In the commands above, the policy allows every user to
      record a meeting. It is however possible to enforce this policy
      at user or COS level, to allow only selected users or members of
      a COS to record meetings.

#. (optional) Activate the license as the ``zextras user``

   .. code:: console

      zextras$ carbonio core activate-license TOKEN
