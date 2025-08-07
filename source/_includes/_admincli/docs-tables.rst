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
