.. _docs-file:

|docs| and Files
================

This page contains a few tables that list the *Key names* and the
*default values* of some |docs| and |file| configuration values that
you can modify. You can take these tables into account in case you
want to revert some values to their default after some unsatisfactory
change.

.. _modify-kv:

How to Modify Values
--------------------

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

In the commands, ``$CONSUL_TOKEN_PATH`` is the |mesh| secret stored on
the **Directory Service server**, while ``$KEY`` and ``$VALUE`` are
the *key name* and the *new value*, respectively, as written in the
tables.

.. hint:: The |mesh| token can be retrieved using the procedure
   described in section :ref:`ts-token`.

.. _docs-opt:

Docs Configuration tables
-------------------------

The following table shows the keys and their default values to
configure the maximum file size of documents that |docs| can manage
and open.

.. _docs-sizeopt:

.. card:: File sizes

   The following values can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands
   presented in the :ref:`previous section <modify-kv>`.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-docs-connector/max-file-size-in-mb/document", "50"
      "carbonio-docs-connector/max-file-size-in-mb/presentation", "100"
      "carbonio-docs-connector/max-file-size-in-mb/spreadsheet", "10"

.. _files-opt:

Files Configuration
-------------------

The following table shows how to modify the maximum number of versions
for each document stored in |file|.

.. _files-max-versions:

.. card:: Maximum number of versions

   Using the |mesh| :ref:`kv interface <modify-kv>`, it is possible
   to change the maximum number of versions stored for each supported
   file (text and word processor documents, spreadsheets,
   presentations).

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-files/max-number-of-versions", "30"

   You can raise the default **30** number, but keep in mind that this
   implies that you need more storage to keep all versions.
