.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv5 - Advanced, AppServer, Files, and Docs

On this node, first install all the required packages for |file|, then
configure the various services needed.

.. note:: The *AppServer* Role is provided by the
   ``carbonio-advanced`` package; see section :ref:`core-comp` for
   more information.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-advanced \
           carbonio-user-management carbonio-files \
           carbonio-docs-connector carbonio-docs-editor

   .. tab-item:: RHEL
      :sync: rhel

      Make sure to respect the order of installation.

      .. code:: console

         # dnf install service-discover-agent 
         # dnf install carbonio-files
         # dnf install carbonio-user-management carbonio-advanced
         # dnf install carbonio-docs-connector carbonio-docs-editor

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

#. Run |mesh| setup using |meshsec|

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

#. Run as the ``zextras user`` the following command to configure the
   Video Recording, using |vsip| and |vspwd| configured on SRV4

   .. code:: console

      zextras$ carbonio chats video-server add VS_IP port 8188 \
        servlet_port 8090 secret VS_PWD

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
