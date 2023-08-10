.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


Package installation
++++++++++++++++++++

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-preview \
         carbonio-files carbonio-docs-connector \
         carbonio-docs-editor

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-preview \
         carbonio-files carbonio-docs-connector \
         carbonio-docs-editor


Bootstrap |carbonio|.
+++++++++++++++++++++

Launch the |carbonio| bootstrap process

   .. code:: console

      # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from SRV1.

.. include:: /_includes/_multiserver-installation/bootstrap-passwords.rst


Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh-agent.rst

Configure Memcached
+++++++++++++++++++

TO allow |pv| to operate correctly, you need to edit file
:file:`/etc/carbonio/preview/config.ini` and search for variables
**nginx_lookup_servers_full_path_urls** and
**memcached_server_full_path_urls**, which are one after the other,
towards the end of the file.

   .. code-block:: ini
      :linenos:

      nginx_lookup_server_full_path_urls = https://172.16.0.13:7072
      memcached_server_full_path_urls = 172.16.0.12:11211

   Make sure that:

   * in line 1, protocol is **https** and the IP address is the address
     of the AppServer, which is SRV3's *172.16.0.13*
   * in line 1, make also sure to specify the port used by Preview, **7072**
   * in line 2, SRV2's IP (*172.16.0.12*) is written, to allow access
     to Memcached, which is installed on the *Proxy Node*
