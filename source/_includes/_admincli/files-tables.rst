Using the |mesh| :ref:`kv interface <modify-kv>`, it is possible to
change a few |file| parameters, according to the following table.

.. csv-table::
   :header: "Key name", "Default value"
   :widths: 70, 30

   "carbonio-files/max-number-of-versions", "30"
   "carbonio-files/max-uploadable-size-in-mb", "50"

#. The maximum number of versions stored for each supported file (text
   and word processor documents, spreadsheets, presentations).  You
   can raise the default **30** number, but keep in mind that this
   implies that you need more storage to keep all versions.

#. The maximum size of a document, in megabytes, that can be
   uploaded. By default, the value **is not defined**, meaning that
   there is no limit to the size of a document.
