.. index:: remove Node,
.. index:: see: remove server; remove Node

.. _cli-remove-node:

=============================================
 Remove a Node From |product| Infrastructure
=============================================

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
   Directory Server and the Mailstore & Provisioning Roles

#. Identify which Node (or Nodes) should be removed or replaced and
   which Roles they are equipped with

#. Install these Roles on other Nodes

#. Take note of the FQDN of the Node to be removed, because it will
   be needed. It will be denoted as ``serverHostname`` in the procedure.

At this point you can start the removal procedure. If you plan to
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

.. card:: Step 2, Remove the Node from the |product| infrastructure

   Log in to the Node on which the Mailstore & Provisioning Role is
   installed and remove the server from the infrastructure. As the
   ``zextras`` user, execute the command

   .. code:: console

      zextras$ carbonio prov ds serverHostname


..  card:: Step 3, verify removal

    Log in to the Node equipped with the Directory Server Role and
    dump the LDAP main database: as the ``zextras`` user, execute the
    command

    .. code:: console

       zextras$ /opt/zextras/libexec/zmslapcat /tmp/

    The output will be file :file:`/tmp/ldap.bak`; check that the file
    does no longer contain any reference to the old FQDN, i.e.,

    .. code:: console

       zextras$ grep serveHostname /tmp/ldap.bak

    .. hint:: The command can be run as either the ``root`` or
       ``zextras`` user.

    The output of the command should be empty, meaning that the old
    Node is not part of the |product| infrastructure anymore. You can
    now power off the Node and decommission it.
