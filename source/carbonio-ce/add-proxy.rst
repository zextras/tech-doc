.. _add-proxy:

==================
 Add a Proxy Node
==================

This section explains how to add a Proxy Node to an existing
|product| installation. This is useful when the number of mailboxes
grows and you need to scale up your infrastructure.

Preliminaries
-------------

Before attempting to install a new Proxy Node, please read carefully
the whole procedure in this page and make sure the following
requirements are satisfied.

* A |product| infrastructure is already operating correctly

* A new node is available, which satisfies the :ref:`Multi Server
  Requirements <multi-server-req>` and on which the
  :ref:`multi-server-preliminary` have already been executed. We will
  call this node *SRV12.example.com*.

* All commands **must be executed** as the ``root`` user

Installation Scenarios
----------------------

.. include:: _includes/_multiserver-installation/scenario-proxy.rst

Install Packages
----------------

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-proxy \
         carbonio-webui carbonio-files-ui

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent
         # dnf install carbonio-proxy carbonio-webui \
         carbonio-files-ui

Bootstrap |carbonio|
--------------------

Launch the |carbonio| bootstrap process

   .. code:: console

      # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from SRV1.

* ``Ldap master host`` is the FQDN of SRV1, srv1.example.com
* ``Ldap Admin password`` is obtained from SRV1 using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s zimbra_ldap_password"

* ``Bind password for nginx ldap user`` is obtained from SRV1
  using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s ldap_nginx_password"

Set up |mesh|
-------------

.. include:: /_includes/_multiserver-installation/mesh-agent.rst

Enable ``Memcached``
--------------------

To enable Memcached access, use these commands as the ``zextras`` user:

.. code:: console

   zextras$ carbonio prov ms $(zmhostname) zimbraMemcachedBindAddress $(hostname -i)
   zextras$ zmmemcachedctl restart
   zextras$ zmproxyctl restart

.. warning:: Since ``Memcached`` does not support authentication,
   make sure that the Memcached port (**11211**) is accessible only
   from internal, trusted networks.

Complete Installation
---------------------

The last task to carry out is the restart of all services

.. code:: console

   # su - zextras -c "zmcontrol restart"

To make sure that the Node was added correctly, use this command:

.. code:: console

   # su - zextras -c "carbonio prov gas proxy"

The output should include the new node, for example::

   srv1.example.com
   srv2.example.com
   ...
   srv11.example.com

To check whether all the services are running, use command

.. code:: console

   # su - zextras -c "zmcontrol status"
