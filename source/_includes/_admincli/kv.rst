Values can be changed by using, from any Node, the |mesh| kv
interface: you can access it using the :command:`consul` command from
the CLI.

* To verify the current value of any key, use command

  .. code:: console

     # consul kv get -token="$CONSUL_TOKEN_PATH" "$KEY"

* To modify one of the values reported in the tables below, use
  command

  .. code:: console

     # consul kv put -token="$CONSUL_TOKEN_PATH" "$KEY" "$VALUE"

  When changing any of this values, they are immediately picked up by
  the system, without the need to restart any services.

In the commands, ``$CONSUL_TOKEN_PATH`` is the |mesh| bootstrap token
stored on the **Directory Service server**, while ``$KEY`` and
``$VALUE`` are the *key name* and the *new value*, respectively, as
written in the tables.

.. hint:: The |mesh| bootstrap token can be retrieved using the
   procedure described in section :ref:`mesh-token`.
