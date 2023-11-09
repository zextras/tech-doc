.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv2 - Directory Server, Mesh Server, DB connection


.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-mta \
         carbonio-proxy carbonio-webui carbonio-files-ui \
         carbonio-chats-ui carbonio-tasks-ui \
         carbonio-user-management 

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-mta \
         carbonio-proxy carbonio-webui carbonio-files-ui \
         carbonio-chats-ui carbonio-tasks-ui \
         carbonio-user-management

The following tasks must be executed to configure the MTA.

Bootstrap |carbonio|
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



Enable ``Memcached``
++++++++++++++++++++

To enable Memcached access, use these commands as the ``zextras`` user:


.. code:: console

   zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
   zextras$ zmmemcachedctl restart
   zextras$ zmproxyctl restart

.. warning:: Since ``Memcached`` does not support authentication,
   make sure that the Memcached port (**11211**) is accessible only
   from internal, trusted networks.
