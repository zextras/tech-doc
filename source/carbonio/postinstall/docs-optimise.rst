.. _docs-optimise:

DOCS Optimisations
==================

Once the :ref:`role-docs-install` is operational, some tweaking can be
applied to its configuration to improve performances.

The remainder of this page contains a few tables that list the *Key
names* and the *default values* of some |docs| configuration values
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

Configuration tables
--------------------

The following table is available to configure the maximum file size of
documents that |docs| can manage and open.

.. _docs-sizeopt:

.. card:: File sizes

   The following values can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands that
   follow the table.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-docs-connector/max-file-size-in-mb/document", "50"
      "carbonio-docs-connector/max-file-size-in-mb/presentation", "100"
      "carbonio-docs-connector/max-file-size-in-mb/spreadsheet", "10"
