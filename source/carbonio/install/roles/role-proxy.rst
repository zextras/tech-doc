.. _role-proxy-install:

Proxy
=====

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-proxy.rst

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

Enable ``Memcached``
--------------------

To enable Memcached access, use these commands as the ``zextras`` user:

.. code:: console

   zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
   zextras$ zmmemcachedctl restart

.. warning:: Since ``Memcached`` does not support authentication,
   make sure that the Memcached port (**11211**) is accessible only
   from internal, trusted networks.
