
To allow |pv| to operate correctly, you need to edit file
:file:`/etc/carbonio/preview/config.ini` in all Nodes featuring the
|pv| Component and search for variables
**nginx_lookup_servers_full_path_urls** and
**memcached_server_full_path_urls**, which are one after the other,
towards the end of the file.

.. code-block:: ini
   :linenos:


   nginx_lookup_server_full_path_urls = https://172.16.0.13:7072,https://172.16.0.23:7072
   memcached_server_full_path_urls = 172.16.0.12:11211,172.16.0.22:11211

Make sure that:

* in line 1, protocol is **https** and the IP addresses are the addresses
  of all the *Mailstore & Provisioning Node*, which are **172.16.0.13**
  and **172.16.0.23**

  * also specify the port used by Preview, **7072** for all IP addresses

* in line 2, the IP addresses (**172.16.0.12** and **172.16.0.22**) of
  all the *Proxy Nodes* are written, to allow access to Memcached

  * also specify the port used by Memcached, **11211** for all IP
    addresses
