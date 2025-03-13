Many organisations operate within secured network environments where
direct Internet access is restricted and blocked by firewall rules or
corporate policies.

Using an HTTP proxy allows administrators to control and monitor
outbound connections from the |product| server, ensuring that only
approved services and destinations are accessible.

In a scenario like this, configuring an HTTP proxy is mandatory for
|product| to function properly: this can be achieved using the
``zimbraHttpProxyURL`` attribute as follows.

.. note:: All commands in this section must be executed as the |zu|
   user.

First, login to the any Node installing the Proxy and check the
current configuration of the attribute.

.. code:: console

   zextras$ carbonio prov getConfig zimbraHttpProxyURL

If there is no output, |product| tries to use a direct connection to the
Internet, which in the scenario depicted above does not work, so we
need to configure the attribute as follows.

.. card:: Unauthenticated proxy

   .. code:: console

      zextras$ carbonio prov modifyConfig zimbraHttpProxyURL http://proxy.example.com:8080

   Replace ``http://proxy.example.com:8080`` with the actual proxy that
   needs to be used.

.. card:: Authenticated proxy

   .. code:: console

      zextras$ carbonio prov modifyConfig zimbraHttpProxyURL http://username:password@proxy.example.com:8080

   Replace  ``http://username:password@proxy.example.com:8080`` with
   the correct values

Finally, restart the service.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      Execute, as the |zu|

      .. code:: console

         zextras$ zmcontrol restart

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      Execute, as the |zu|

      .. code:: console

         zextras$ zmcontrol restart

   .. tab-item:: RHEL 8
      :sync: rhel8

      Execute, as the |zu|

      .. code:: console

         zextras$ zmcontrol restart

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      Execute, as the |ru|

      .. code:: console

         # systemctl start/stop/restart carbonio-proxy.target

.. code:: console

   zextras$
