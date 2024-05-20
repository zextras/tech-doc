.. _role-proxy-install:

Proxy
=====

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-proxy-ce.rst

Bootstrap |carbonio|
--------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Enable ``Memcached``
--------------------

To enable Memcached access, use these two commands

#. Common to Ubuntu and RHEL
   
   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)

#. Different on **RHEL 9** 
   
   .. tab-set::

      .. tab-item:: Ubuntu 20.04

         As the ``zextras`` user

         .. code:: console

            zextras$ zmmemcachedctl restart

      .. tab-item:: Ubuntu 22.04

         As the ``zextras`` user

         .. code:: console

            zextras$ zmmemcachedctl restart

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
