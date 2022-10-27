.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv6 - AppServer - Advanced - Preview - Logger


On this node we show how to install the Preview, the Logger, and the
User Management.

.. hint:: We suggest that *Preview* and the |docs|-related packages be
   installed on different physical nodes.

First install all the necessary packages:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-appserver \
           carbonio-user-management carbonio-preview-ce \
           carbonio-logger

   .. tab-item:: RHEL
      :sync: rhel

      On RHEL system, the Preview is currently not available. Make
      sure to respect the order of installation
      
      .. code:: console

         # dnf install service-discover-agent carbonio-appserver
         # dnf install carbonio-user-management 
         # dnf install carbonio-logger

Execute the following tasks.

#. Bootstrap |carbonio|

   .. code:: console

      # carbonio-bootstrap

   In the bootstrap menu, use |srv2h|, and |ldappwd| in
   the following items to complete successfully the bootstrap.

   * ``Ldap master host``: |srv2h|
   * ``Ldap Admin password``: |ldappwd|

#. Copy credentials from the |mesh| server node (SRV2) to the local
   server.

   .. code:: console

      # scp root@[SRV2_hostname]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

#. Run |mesh| setup using |meshsec|

   .. code:: console

      # service-discover setup-wizard

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

   
#. Let |pv| use Memcached. Edit file
   :file:`/etc/carbonio/preview/config.ini` and search for section
   **#Nginx Lookup servers**. 

   .. code-block:: ini
      :linenos:

      nginx_lookup_server_full_path_urls = https://127.0.0.1:7072 #<<--- must be the address of the application server. for a single server it's ok
      memcached_server_full_path_urls = 127.0.0.1:11211           #<<--- must be the address of the memcached server. for a single server it's ok

   Make sure that:

   * in line 1 protocol is **https** and the IP address the current
     node's (SRV6) IP
   * in line 2 there is the Memcached node's (SRV5) IP

#. Restart the |pv| process

   .. code:: console

      # systemctl restart carbonio-preview
      # systemctl restart carbonio-preview-sidecar

#. As last task, restart the mailbox process

   .. code:: console

      # su - zextras -c "zmmailboxdctl restart"

To configure the Logger, please refer to Section :ref:`logger_node_config`.
