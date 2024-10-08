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

In the commands, ``$CONSUL_TOKEN_PATH`` is the |mesh| secret stored in
file :file:`/var/lib/service-discover/password` on the **Directory
Service server**, while ``$KEY`` and ``$VALUE`` are the *key name* and
the *new value*, respectively, as written in the tables.

Configuration tables
--------------------

The following table are available to optimise |wsc|: :ref:`Push
Connector <wsc-pool-opt>`, :ref:`Push Notifications Database
<wsc-push-opt>`, and :ref:`the WSC databases <wsc-db-opt>`.

.. _wsc-pool-opt:

.. card:: Push Connector 

   The following values can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands that
   follow the table.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-push-connector/hikari/min-idle-connections", "10"
      "carbonio-push-connector/hikari/max-pool-size", "10"
      "carbonio-push-connector/hikari/idle-timeout", "10000"
      "carbonio-push-connector/hikari/leak-detection-threshold", "5000"

   Once you modify any of these changes, restart the service.

   .. code:: console

      # systemctl restart carbonio-push-connector

.. _wsc-push-opt:

.. card:: Configure Push Notifications Database

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-notification-push/hikari/min-idle-connections", "10"
      "carbonio-notification-push/hikari/max-pool-size", "10"
      "carbonio-notification-push/hikari/idle-timeout", "10000"
      "carbonio-notification-push/hikari/leak-detection-threshold", "5000"

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
