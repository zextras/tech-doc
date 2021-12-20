
.. _pws_zextras_powerstore_attachment_indexing:

Attachment Indexing
===================

.. _pws_how_indexing_works:

How Indexing Works
------------------

Zextras Powerstore has a new :ref:`pws_external_content_extractor` to
index attachment contents. This way the resources do not have to
dedicate time reading the attachments.

The external content extractor works together with Zimbra’s default
engine. The main Zimbra indexing process analyzes the contents of an
item, splitting it into several parts based on the MIME parts of the
object. Next, Zimbra handles the indexing of *known*
contents — plaintext — and passes the datastream on to the Zextras
Powerstore handlers for all other content.

The indexing engine includes an indexing cache that speeds up the
indexing process of any content that has already been analyzed.
Datastreams over 10Kb are cached by default, and the cache hold 10000
entries, while smaller datastreams are not cached as the cache benefits
only apply to large datastreams.

.. _pws_indexed_formats:

Indexed Formats
---------------

.. dropdown:: Web
   :open:
          
   .. csv-table::
      :header: "Extension", "Parser", "Content-type"

      "``asp``", "``HtmlParser``", "application/x-asp"
      "``htm``", "``HtmlParser``", "application/xhtml+xml"
      "``html``", "``HtmlParser``", "application/xhtml+xml, text/html"
      "``shtml``", "``HtmlParser``", "application/xhtml+xml"
      "``xhtml``", "``HtmlParser``", "application/xhtml+xml"

.. dropdown:: Documents
   :open:

   .. csv-table::
      :header: "Extension", "Parser", "Content-type"

      "``rtf``", "``RTFParser``", "application/rtf"
      "``pdf``", "``PDFParser``", "application/pdf"
      "``pub``", "``OfficeParser``", "application/x-mspublisher"
      "``xls``", "``OfficeParser``", "application/vnd.ms-excel"
      "``xlt``", "``OfficeParser``", "application/vnd.ms-excel"
      "``xlw``", "``OfficeParser``", "application/vnd.ms-excel"
      "``ppt``", "``OfficeParser``", "application/vnd.ms-powerpoint"
      "``pps``", "``OfficeParser``", "application/vnd.ms-powerpoint"
      "``mpp``", "``OfficeParser``", "application/vnd.ms-project"
      "``doc``", "``OfficeParser``", "application/msword"
      "``dot``", "``OfficeParser``", "application/msword"
      "``msg``", "``OfficeParser``", "application/vnd.ms-outlook"
      "``vsd``", "``OfficeParser``", "application/vnd.visio"
      "``vst``", "``OfficeParser``", "application/vnd.visio"
      "``vss``", "``OfficeParser``", "application/vnd.visio"
      "``vsw``", "``OfficeParser``", "application/vnd.visio"
      "``xlsm``", "``OOXMLParser``", "application/vnd.ms-excel.sheet.macroenabled.12"
      "``pptm``", "``OOXMLParser``", "application/vnd.ms-powerpoint.presentation.macroenabled.12"
      "``xltx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.spreadsheetml.template"
      "``docx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "``potx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.presentationml.template"
      "``xlsx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "``pptx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "``xlam``", "``OOXMLParser``", "application/vnd.ms-excel.addin.macroenabled.12"
      "``docm``", "``OOXMLParser``", "application/vnd.ms-word.document.macroenabled.12"
      "``xltm``", "``OOXMLParser``", "application/vnd.ms-excel.template.macroenabled.12"
      "``dotx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
      "``ppsm``", "``OOXMLParser``", "application/vnd.ms-powerpoint.slideshow.macroenabled.12"
      "``ppam``", "``OOXMLParser``", "application/vnd.ms-powerpoint.addin.macroenabled.12"
      "``dotm``", "``OOXMLParser``", "application/vnd.ms-word.template.macroenabled.12"
      "``ppsx``", "``OOXMLParser``", "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
      "``odt``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.text"
      "``ods``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.spreadsheet"
      "``odp``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.presentation"
      "``odg``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.graphics"
      "``odc``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.chart"
      "``odf``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.formula"
      "``odi``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.image"
      "``odm``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.text-master"
      "``ott``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.text-template"
      "``ots``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.spreadsheet-template"
      "``otp``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.presentation-template",
      "``otg``",  "``OpenDocumentParser``", "application/vnd.oasis.opendocument.graphics-template",
      "``otc``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.chart-template",
      "``otf``","``OpenDocumentParser``", "application/vnd.oasis.opendocument.formula-template",
      "``oti``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.image-template",
      "``oth``", "``OpenDocumentParser``", "application/vnd.oasis.opendocument.text-web",
      "``sxw``", "``OpenDocumentParser``", "application/vnd.sun.xml.writer"

.. dropdown:: Packages and Archives
   :open:

   .. csv-table::
      :header: "Extension", "Parser", "Content-type"

      "``z``", "``CompressorParser``", "application/x-compress"
      "``bz``", "``CompressorParser``", "application/x-bzip"
      "``boz``", "``CompressorParser``", "application/x-bzip2"
      "``bz2``", "``CompressorParser``", "application/x-bzip2"
      "``gz``", "``CompressorParser``", "application/gzip"
      "``gz``", "``CompressorParser``", "application/x-gzip"
      "``gzip``", "``CompressorParser``", "application/x-gzip"
      "``xz``", "``CompressorParser``", "application/x-xz"
      "``tar``", "``PackageParser``", "application/x-tar"
      "``jar``", "``PackageParser``", "application/java-archive"
      "``7z``", "``PackageParser``", "application/x-7z-compressed"
      "``cpio``", "``PackageParser``", "application/x-cpio"
      "``zip``", "``PackageParser``", "application/zip"
      "``rar``", "``RarParser``", "application/x-rar-compressed"
      "``txt``", "``TXTParser``", "text/plain"

.. _pws_parser_controls:

Parser Controls
---------------

Parsers can be turned on or off by changing the related value to
``true`` or ``false`` via the ``zxsuite config`` CLI command.

.. csv-table::
   :header: "Attribute", "Parsers"

   "pdfParsingEnabled", "PDFParser"
   "odfParsingEnabled", "OpenDocumentParser"
   "archivesParsingEnabled", "CompressorParser, PackageParser, RarParser"
   "microsoftParsingEnabled", "OfficeParser, OOXMLParser, OldExcelParser"
   "rtfParsingEnabled", "RTFParser"

e.g. to disable PDF parsing run:

.. code:: bash

   zxsuite config server set server.example.com attribute pdfParsingEnabled value false

By default, all parsers are active.
