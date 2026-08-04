There are a number of scenarios in which an existing |product| Node
must be removed from a |product| infrastructure within an
organisation, for example:

Lifecycle Completion
   The VM hosting the Node has fulfilled its purpose, such as
   completing a specific task, project, or testing phase.

Resource Optimisation
   Free up computing resources like CPU, memory, and storage that can
   be used for other purposes or tasks within an organisation.

Costs
   In cloud environments, disposing of unused or underutilised VMs
   reduces costs.

Obsolescence
   The Operating system or applications running on the VM are outdated or
   no longer supported.

Preliminaries
=============

Before starting the procedure described in the remainder of this
section, you need to:

#. Have CLI access to the new Node and to the Nodes featuring the
   Directory Server and the Mailstore & Provisioning Components

#. Identify which Node (or Nodes) should be removed or replaced and
   which Components they are equipped with

#. Install these Components on other Nodes

#. Take note of the FQDN of the Node to be removed, because it will
   be needed. It will be denoted as ``serverHostname`` in the procedure

Node Removal
============

You can now start the removal procedure. If you plan to
remove more than one Node, execute the following steps for each Node.

.. card:: Step 1, leave |mesh|

   On the Node that will be dismissed, generate a |mesh| token:

   .. code:: console

      # export CONSUL_HTTP_TOKEN=$(gpg -qdo - \
      /etc/zextras/service-discover/cluster-credentials.tar.gpg | \
      tar xOf - consul-acl-secret.json | jq .SecretID -r)

   Remove the Node from the cluster:

   .. code:: console

      # consul leave

.. card:: Step 2, remove the Node from the |product| infrastructure

   Log in to the Node on which the Mailstore & Provisioning Component is
   installed and remove the server from the infrastructure. As the
   ``zextras`` user, execute the command

   .. code:: console

      zextras$ carbonio prov ds serverHostname

..  card:: Step 3, verify removal

    Log in to the Node equipped with the Directory Server Component and
    dump the LDAP main database: as the ``zextras`` user, execute the
    command

    .. code:: console

       zextras$ /opt/zextras/libexec/zmslapcat /tmp/

    The output will be file :file:`/tmp/ldap.bak`; check that the file
    does no longer contain any reference to the old FQDN, i.e.,

    .. code:: console

       zextras$ grep serverHostname /tmp/ldap.bak

    .. hint:: The command can be run as either the ``root`` or
       ``zextras`` user.

    The output of the command should be empty, meaning that the old
    Node is not part of the |product| infrastructure anymore. You can
    now power off the Node and decommission it.

Additional Steps for Mailbox Nodes
===================================

If the node hosts mailbox services, perform the following steps **before** removing it from the infrastructure.

1. Obtain a Consul token:

   .. code-block:: bash

      export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)

2. Leave the Mesh

   .. code-block:: bash

      consul leave

3. Promote all accounts hosted on the server to another mailbox node.

Special Considerations
======================

Depending on your Carbonio deployment, node role, and product version, additional steps may be required before removing a node from the infrastructure.
The following sections describe scenarios that require extra actions beyond the standard node removal procedure. Review each one and apply the additional steps if it matches your environment.

1) Carbonio 25.6.0: Removing a Mailstore & Provisioning Node
-------------------------------------------------------------

Due to a known issue in **Carbonio 25.6.0**, multiple **ham**, **spam**, and **virus-quarantine** accounts may be created even though only one set is actively used.
Before removing the node, identify the accounts currently in use:

.. code-block:: bash

   carbonio prov gacf | grep <infrastructure-domain>

Replace ``<infrastructure-domain>`` with your infrastructure domain (for example, example.com).
Remove any unused training and quarantine accounts. If additional **GAL Sync** accounts are present, remove those that are no longer required. For example:

.. code-block:: bash

   carboniogsautil deleteAccount -a galsync.3fqydmw_@example.com

Remove references to the server from the following global configuration attributes:

.. code-block:: bash

   carbonio prov mcf -zimbraReverseProxyUpstreamEwsServers <serverHostname>
   carbonio prov mcf -zimbraReverseProxyAvailableLookupTargets <serverHostname>

From another **Mailstore & Provisioning** node, remove the server from the infrastructure:

.. code-block:: bash

   carbonio prov ds <serverHostname>

Finally, verify that no LDAP attributes still reference the removed server. On a **Carbonio Directory** node, run:

.. code-block:: bash

   /opt/zextras/libexec/zmslapcat /tmp/
   grep <serverHostname> /tmp/ldap.bak

If the hostname is still present in any LDAP attributes, remove or update the corresponding value using the appropriate carbonio prov command for the affected object.

2) Removing the First Installed MTA
------------------------------------

The first MTA installed in a Carbonio infrastructure is responsible for the periodic cleanup of the spam and ham training accounts.
Before removing the node, verify whether it performs this task:

.. code-block:: bash

   carboniolocalconfig zmtrainsa_cleanup_host

If the command returns:

.. code-block:: bash

   zmtrainsa_cleanup_host = true

assign the cleanup task to another operational MTA before decommissioning the server.
Log in to the target MTA as the zextras user and run:

.. code-block:: bash

   su - zextras
   carboniolocalconfig -e zmtrainsa_cleanup_host=true

3) Starting with Carbonio 26.3: Shared Memcached Service
---------------------------------------------------------

Starting with **Carbonio 26.3**, a single **memcached** instance can be shared by multiple Proxy nodes.
If the server hosting the shared memcached service is removed, install and configure the service on another node before completing the decommissioning process.
Install the package:

**Ubuntu**

.. code-block:: bash

   apt install carbonio-memcached

**Red Hat**

.. code-block:: bash

   dnf install carbonio-memcached

Run the pending setup:

.. code-block:: bash

   pending-setups -a

Finally, register the service on the new node:

.. code-block:: bash

   /opt/zextras/bin/carbonio prov -l ms $(carboniohostname) \
     +carbonioServiceEnabled memcached \
     +carbonioServiceInstalled memcached