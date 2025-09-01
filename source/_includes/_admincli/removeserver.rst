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

..
   #. in case you remove a Proxy Component or a Mailstore & Provisioning Component,
      check that the Preview Component is correctly configured. See Section
      :ref:`memcached-proxy` and :ref:`memcached-mp`, respectively, for
      directions.

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

       zextras$ grep serveHostname /tmp/ldap.bak

    .. hint:: The command can be run as either the ``root`` or
       ``zextras`` user.

    The output of the command should be empty, meaning that the old
    Node is not part of the |product| infrastructure anymore. You can
    now power off the Node and decommission it.

..
   .. _memcached-proxy:

   Configuration Fix for Proxy Removal
   ===================================

   In case you are removing from the infrastructure a Node which installs
   a Proxy, you need to adjust a configuration file on the Preview Node.

   This is required by the **memcached** configuration that supports the
   Preview Component and consists of replacing a configuration value with the
   IP address of the new Proxy Component.

   The procedure is slight different if you if you replace an
   existent Proxy with a new one or simply decommission one Proxy
   but keep an existing one (or more that one).

   .. card:: Replace a Proxy Node

      Supposing that the IP of the decommissioned Proxy Node is
      **172.16.0.12**, and the new one is **172.16.0.73**, you need to
      change in file :file:`/etc/carbonio/preview/config.ini` the line

      .. code-block:: ini

         memcached_server_full_path_urls = 172.16.0.12:11211

      into

      .. code-block:: ini

         memcached_server_full_path_urls = 172.16.0.73:11211

   .. card:: Do not replace a Proxy Node

      In case you decommission a Proxy Node without replacing it, you
      still need to edit file :file:`/etc/carbonio/preview/config.ini`,
      but you need to delete the IP of the decommissioned Proxy Node, for
      example (assuming you are decommissioning **172.16.0.12**)

      .. code-block:: ini

         memcached_server_full_path_urls = 172.16.0.12:11211,172.16.0.22:11211

      becomes

      .. code-block:: ini

         memcached_server_full_path_urls = 172.16.0.22:11211

   Please refer to Section :ref:`conf-memcached` in Preview Component's
   installation for details.

..
   .. _memcached-mp:

   Configuration Fix for Mailstore & Provisioning Removal
   ======================================================

   In case you are removing from the infrastructure a Node which installs
   a Mailstore & Provisioning, you need to adjust a configuration file on
   the Preview Node.

   This is required by the **memcached** configuration that supports the
   Mailstore & Provisioning Component and consists of replacing a
   configuration value with the IP address of the new Mailstore &
   Provisioning Component.

   The procedure is slight different if you if you replace an existent
   Mailstore & Provisioning with a new one or simply decommission one
   Mailstore & Provisioning but keep an existing one (or more that one).

   .. card:: Replace a Mailstore & Provisioning Node

      Supposing that the IP of the decommissioned Mailstore &
      Provisioning Node is **172.16.0.13**, and the new one is
      **172.16.0.58**, you need to change in file
      :file:`/etc/carbonio/preview/config.ini` the line

      .. code-block:: ini

         nginx_lookup_server_full_path_urls = https://172.16.0.13:7072

      into

      .. code-block:: ini

         nginx_lookup_server_full_path_urls = https://172.16.0.58:7072

   .. card:: Do not replace a Mailstore & Provisioning Node

      In case you decommission a Mailstore & Provisioning Node without
      replacing it, you still need to edit file
      :file:`/etc/carbonio/preview/config.ini`, but you need to delete
      the IP of the decommissioned Mailstore & Provisioning Node, for
      example (assuming you are decommissioning **172.16.0.13**)

      .. code-block:: ini

         nginx_lookup_server_full_path_urls = https://172.16.0.13:7072,https://172.16.0.23:7072

      becomes

      .. code-block:: ini

         nginx_lookup_server_full_path_urls = https://172.16.0.23:7072

   Please refer to Section :ref:`conf-memcached` in Preview Component's
   installation for details.
