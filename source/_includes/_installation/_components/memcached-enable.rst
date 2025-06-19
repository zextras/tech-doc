To enable Memcached access, use these two commands

#. Common to Ubuntu and RHEL

   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)

#. Different on **RHEL 9**

   .. tab-set::

      .. tab-item:: Ubuntu 22.04

         As the ``zextras`` user

         .. code:: console

            zextras$ zmmemcachedctl restart

      .. tab-item:: Ubuntu 24.04

         As the ``root`` user

         .. code:: console

            # systemctl restart carbonio-memcached.service

      .. tab-item:: RHEL 8

         As the ``zextras`` user

         .. code:: console

            zextras$ zmmemcachedctl restart

      .. tab-item:: RHEL 9

         As the ``root`` user

         .. code:: console

            # systemctl restart carbonio-memcached.service

.. warning:: Since ``Memcached`` does not support authentication,
   make sure that the Memcached port (**11211**) is accessible only
   from internal, trusted networks.
