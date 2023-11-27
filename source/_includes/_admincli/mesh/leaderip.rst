
You need to identify the |mesh| *leader node* node and log into
it. While this is usually the Node on which the Directory Server is
installed, the actual leader might be different. to find the
correct IP,  log in to a Directory Server node and issue the
command as the ``zextras`` user

.. code:: console

   zextras$ carbonio prov gas service-discover

This will output all |mesh| servers: to make sure you are on the
leader node, use the following command

.. code:: console

   # wget http://127.0.0.1:8500/v1/status/leader -qO -

The output will be an IP address and a port, for example
**172.16.0.12:8300**. If this IP is different from the
`Directory Server`'s, log in to the latter on 172.16.0.12. 

.. note:: Even if you have installed multiple |mesh| Servers, *only
   one* is the leader.
