
To allow |pv| to operate correctly, you need to edit file
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
  of the *Mailstore & Provisioning Node*, which is **172.16.0.13**

  * also specify the port used by Preview, **7072**

* in line 2, the IP (*172.16.0.12*) of the *Proxy Node* is written, to
  allow access to Memcached

  * also specify the port used by Memcached, **11211**

* in case you have multiple Mailstore & Provisioning or Proxy Nodes,
  add all of them as a comma-separated list, for example::

    nginx_lookup_server_full_path_urls = https://172.16.0.13:7072,https://172.16.0.23:7072
    memcached_server_full_path_urls = 172.16.0.12:11211,172.16.0.22:11211
