.. _add-appserver:

=================================
 Add an Additional AppServer Node
=================================

This section explains how to add an AppServer Node to an existing
|product| installation. This is useful when the number of mailboxes
grows and you need to scale up your infrastructure.

Preliminaries
-------------

Before attempting to install a new AppServer, please read carefully
the whole procedure in this page and make sure the following
requirements are satisfied.

* A |product| infrastructure is already operating correctly

* A new node is available, on which to install the AppServer, which
  satisfies the :ref:`Multi Server Requirements <multi-server-req>`
  and on which the :ref:`multi-server-preliminary` have already been
  executed. We will call this node **SRV11**.

* All commands **must be executed** as the ``root`` user

* Give the new node a meaningful name/FQDN. We will use
  `new-appserver.example.com` whenever necessary. 
  
The procedure to follow is straightforward and identical to the
:ref:`srv3-install` Node.

Install Packages
----------------

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-advanced

   .. tab-item:: RHEL
      :sync: rhel

      Make sure to respect the order of installation.

      .. code:: console

         # dnf install service-discover-agent
         # dnf install carbonio-advanced

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

At the end of the bootstrap you can verify the correct addition of the
node with this command

.. code:: console

   # su - zextras -c "carbonio prov gas mailbox"

The output should include the new node, for example::

   srv1.example.com
   srv2.example.com
   ...
   new-appservernode.example.com
   
Set up |mesh|
-------------

.. include:: /_includes/_multiserver-installation/mesh-agent.rst

Complete installation
---------------------

The last task to carry out is the restart of all services:

.. code:: console

   # su - zextras -c "zmcontrol restart"
