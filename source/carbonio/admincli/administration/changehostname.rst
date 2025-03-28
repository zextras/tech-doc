.. index:: change hostname

.. _change-hostname:

Change the |product| Hostname
=============================

This guide helps you in changing the hostnames of a |product|
infrastructure, whether a Single-Server or Multi Node. The procedure
may become quite long in the case of a Multi-Node, please go through
the whole section before proceeding with the actual
procedures. Indeed, depending on the number and type of Nodes that you
need to rename, different procedure should be applied to each Node.

.. _change-hostname-req:

Requirements & Limitations
--------------------------

You need to take into account the following requirements during the
procedure.

#. Ensure you have administrative access to each Node.

#. Update the **A**, **MX**, and **PTR** DNS records to reflect the
   new hostname before starting.

#. Verify the new hostname is resolvable using :command:`nslookup` or
   :command:`dig`

#. During the hostname change, every node must be resolvable by both
   the old and the new hostname

#. All commands in the procedures must be executed as the |ru| unless
   stated differently

#. Always start the procedure from the Node which installs the **Mesh
   & Directory** Role

#. The procedures are valid only for a change of hostname, not for a
   change in the domain name (i.e., of the FQDN)

Infrastructure Examples
-----------------------

To cover most use cases, we take into account the following scenarios
on which we apply the procedure. All other cases can be traced back to
either of them. In the Multi-Node setups, except for the Node
featuring the **Mesh & Directory** Role (and the **Directory
Replica**, if present), it is not relevant which Roles are installed
on each Node.

.. card:: Example A, Single-Server

   This is a Single-Server, Single Node setup. Simply refer to Section
   :ref:`hostname-ds` below.

.. card:: Example B, **3 Nodes** setup.

   #. Node 1 is the Directory Server with hostname ``srv1.example.com``

   #. Nodes 2 and 3 have hostnames ``srv2.example.com`` and
      ``srv3.example.com``, respectively.

   In this setup, we change name to **Node 1 only**, which will be
   called ``node1.example.com``. You need to execute procedure
   :ref:`hostname-ds` on Node 1 and procedure
   :ref:`hostname-no-change` on Nodes 2 and 3.

.. card:: Example C, **5 Nodes** setup.

   #. Node 1 is the Directory Server with hostname
      ``srv1.example.com``

   #. Nodes 2, 3, 4, and 5 have hostnames ``srv2.example.com``,
      ``srv3.example.com``, ``srv4.example.com``, and
      ``srv5.example.com``, respectively.

   In this setup, we change name to **Node 1**, **Node 2**, and **Node
   5**, which will be called ``node1.example.com``,
   ``node2.example.com``, and ``node5.example.com``, respectively. You
   need to execute procedure :ref:`hostname-ds` on Node 1, procedure
   :ref:`hostname-no-change` on Nodes 3 and 4, and procedure
   :ref:`hostname-other` on Nodes 2 and 5.

.. card:: Example D, setup with *Directory Replica* Role

   If one or more *Directory Replica* Roles are installed within your
   infrastructure, there are slight changes to the procedures
   described below. Please refer to Section :ref:`hostname-replica`
   for more information.

.. _hostname-ds:

Change Hostname to Mesh & Directory Node
----------------------------------------

.. warning:: Remember to start the procedure if and only if you have
   satisfied the :ref:`change-hostname-req`.

This procedure must be used on the Node featuring the **Mesh &
Directory** Role **only**.

.. include:: /_includes/_admincli/hostname-ds.rst

.. _hostname-other:

Change Hostname of Other Nodes
------------------------------

This procedure applies to all nodes that **do not** feature the **Mesh
& Directory** Role, that is, **Node 1** in Scenario **B** and **Nodes
1, 2, and 5** in Scenario **C**.

.. include:: /_includes/_admincli/keep-hostname.rst

.. include:: /_includes/_admincli/hostname-ds.rst

.. _hostname-no-change:

Nodes Keeping Their Hostname
----------------------------

Even if a Node keeps its hostname (this is the case for Nodes 2 and 3
in scenarios **B** and Nodes 3 and 4 in **C**), nonetheless you need to let the
Node know that the Master LDAP server (i.e., the *Mesh & Directory*
Node) has changed hostname. This can be achieved by executing the
following commands, as the |zu|.

.. include:: /_includes/_admincli/keep-hostname.rst

.. _hostname-replica:

Tasks for the Directory Replica Role
------------------------------------

If your infrastructure features a **Directory Replica**, you need to
carry out these tasks **on all Nodes**. Depending if you change
hostname on the *Mesh & Directory* Node only or also on the Replica,
the commands to execute slightly differ.

#. If you change hostname  **only the Mesh & Directory**, execute

   .. code:: console

      zextras$ carbonio prov ms <hostname> zimbraLdapMasterURL ldap://node1.example.com:389

   Replace ``<hostname>`` with the actual hostname of the Node on
   which you are executing the command.

#. If you change also the hostname of the **Directory Replica**,
   assuming its new hostname is ``replica1.example.com`` execute also

   .. code:: console

      zextras$ carbonio prov ms <hostname> zimbraLdapURL ldap://replica1.example.com:389

   Replace ``<hostname>`` with the actual hostname of the Node on
   which you are executing the command.

In both cases, when you executed the commands, restart all services

.. card:: Attributes ``zimbraLdapMasterURL`` and ``zimbraLdapURL``

   * ``zimbraLdapMasterURL`` ensures that write operations are
     consistently directed to the correct Directory Server, preserving
     data integrity

   * ``zimbraLdapURL`` ensures that the system can still authenticate
     users and access LDAP data even if one of the replicas is down.

     
   In a Single-Server |product| setup, these values are typically the
   same. In a Multi-Server setup with LDAP replication, they will
   differ, with ``zimbraLdapURL`` listing all replicas and
   ``zimbraLdapMasterURL`` pointing only to the master.
