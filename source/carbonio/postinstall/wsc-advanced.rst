.. _wsc-adv:

==============
 WSC Advanced
==============

This section contains advanced |wsc| configuration and suggestions to
improve performances and optimise the Module.

.. _wsc_adv-conf:

WSC Configuration
=================

In this section we present advanced configuration options for |wsc|.

.. index:: WSC; user search by CLI

User Search Across Domains
--------------------------

In a multi-domain |product| infrastructure, Administrators can decide
on which domains a user can be found when starting a new chat.

The search on all domains can be activated with CLI command

.. code:: console

   zextras$ carbonio prov mcf carbonioSearchAllDomainsByFeature TRUE

To allow users to search other users only on their domain, use
``FALSE`` instead of ``TRUE``.

.. seealso:: This option is available on the |adminui|, please see the
   :ref:`dedicated box <wsc-user-search>` in the Domain's global
   settings.

.. _wsc-chats-ro:

Set Legacy Chat Read Only
-------------------------

If you enabled |WSC|, to prevent user using the old Chats, you
can set it in *read-only* mode. By doing so, users will still able to
access the textual *Chats*, the *Spaces*, and the *Rooms*, but it
will not be possible to message users or create new Spaces and
Rooms. Additionally, the input bar at the bottom will be replaced by a
string *The application is in Read Only mode*.

To set the legacy Chats read-only,, use the CLI command

.. code:: console

   zextras$ carbonio config set cos default teamReadOnlyEnabled true

.. _wsc-optimise:

WSC Optimisations
=================

Once the :ref:`role-wsc-install` is operational, some tweaking can be
applied to its configuration to improve performances.

The remainder of this page contains a few tables that list the *Key
names* and the *default values* of some |WSC| configuration values
that you can modify. You can take these tables into account in case you
want to revert some values to their default after some unsatisfactory
change.


How to Modify Values
--------------------

Values can be changed by using, from any Node, the |mesh| kv
interface: you can access it using the :command:`consul` command from
the CLI.

* To verify the current value of any key, use command

  .. code:: console

     # consul kv get -token-file="$CONSUL_TOKEN_PATH" "$KEY"

* To modify one of the values reported in the tables below, use
  command

  .. code:: console

     # consul kv put -token-file="$CONSUL_TOKEN_PATH" "$KEY" "$VALUE"

In the commands, ``$CONSUL_TOKEN_PATH`` is the |mesh| secret stored on
the **Directory Service server**, while ``$KEY`` and ``$VALUE`` are
the *key name* and the *new value*, respectively, as written in the
tables.

.. hint:: The |mesh| token can be retrieved using the procedure
   described in section :ref:`ts-token`.

Configuration table
-------------------

The following table shows the values available to modify the WSC database.

.. _wsc-db-opt:
      
.. card:: Configure |wsc| Database

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-ws-collaboration/hikari/min-idle-connections", "10"
      "carbonio-ws-collaboration/hikari/max-pool-size", "10"
      "carbonio-ws-collaboration/hikari/idle-timeout", "10000"
      "carbonio-ws-collaboration/hikari/leak-detection-threshold", "5000"

Modify Connection Pool
----------------------

This optimisation does not require access to the kv interface.
Instead, you need to edit file
:file:`/etc/carbonio/message-dispatcher/mongooseim.toml` and change
the value of ``workers`` in section
``[outgoing_pools.rdbms.default]``::

  [outgoing_pools.rdbms.default]
    scope = "global"
    strategy = "best_worker"
    workers = 10 # db connection pool numbers

Then, restart the service.

.. code:: console

   # systemctl restart carbonio-message-dispatcher
