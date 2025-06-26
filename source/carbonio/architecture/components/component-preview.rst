.. _component-preview-install:

Preview
=======

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_packages/component-preview.rst

Bootstrap |carbonio|
--------------------

Launch the |carbonio| bootstrap process

.. code:: console

   # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from  the first Mesh & Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh & Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

.. _conf-memcached:

Configure Memcached
-------------------

.. include:: /_includes/_installation/_components/memcached.rst

.. note:: In case you have multiple Mailstore & Provisioning or Proxy Nodes,
   add all of them as a comma-separated list, for example::

     nginx_lookup_server_full_path_urls = https://172.16.0.13:7072,https://172.16.0.23:7072
     memcached_server_full_path_urls = 172.16.0.12:11211,172.16.0.22:11211
