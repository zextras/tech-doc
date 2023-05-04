.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv6 - AppServer - Advanced - Preview - Monitoring


On this node we install the Preview, the User Management, and advanced
services.

.. hint:: We suggest that *Preview* and the |docs|-related packages be
   installed on different physical nodes.

First install all the necessary packages:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent \
           carbonio-user-management carbonio-advanced \
           carbonio-preview carbonio-prometheus

   .. tab-item:: RHEL
      :sync: rhel

      Make sure to respect the order of installation.

      .. code:: console

         # dnf install service-discover-agent
         # dnf install carbonio-user-management carbonio-advanced
         # dnf install carbonio-preview carbonio-prometheus

Execute the following tasks.

#. Bootstrap |carbonio|

   .. code:: console

      # carbonio-bootstrap

   In the bootstrap menu, use |srv2h|, and |ldappwd| in
   the following  items to complete successfully the bootstrap.

   * ``Ldap master host``: |srv2h|
   * ``Ldap Admin password``: |ldappwd|

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


#. If you want that the |monit| be reachable from outside the
   local network, allow access to port **9090** on this node.

   .. this should not be necessary 
      #. Make sure the |monit| exporter's firewall ports (**9100** and
      **9115**) are open on the internal network, to allow the correct
      communication with the server

#. Let |pv| use Memcached. Edit file
   :file:`/etc/carbonio/preview/config.ini` and search for
   section **# Nginx Lookup servers**.

   .. code-block:: ini
      :linenos:

      nginx_lookup_server_full_path_urls = https://172.16.0.16:7072
      memcached_server_full_path_urls = 172.16.0.14:11211

   Make sure that:

   * in line 1 protocol is **https** and the IP address is the address
     of one AppServer, we use the current node's IP Address for
     simplicity
   * in line 1, make also sure to specify the port used by Preview,
     **7072**
   * in line 2 |vsip| is written, to allow this node's access to
     Memcached, which is installed on the *Proxy Node*

#. Restart the |pv| process

   .. code:: console

      # systemctl restart carbonio-preview
      # systemctl restart carbonio-preview-sidecar

#. As last task, restart the mailbox process as the ``zextras`` user

   .. code:: console

      zextras$ zmcontrol stop
      zextras$ zmcontrol start

