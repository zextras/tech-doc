.. _role-preview-install:

Preview
=======

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-preview-ce.rst

Bootstrap |carbonio|
--------------------

Launch the |carbonio| bootstrap process

.. code:: console

   # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from  the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_multiserver-installation/mesh-agent.rst

Configure Memcached
-------------------

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
