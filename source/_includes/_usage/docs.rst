.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|Docs| is based on a heavily customised LibreOffice online package
that adds to |product| ability for all persons in the organisation to
collaborate in editing different types of documents, including text
documents, word processors, spreadsheets, and presentations.

The integration of |docs| with items stored in |file| and with email
attachments is seamless and handled by a dedicated |docs| component.

Whenever one wants to edit a document, a connection to a |docs| server
instance starts, a copy of the file is retrieved and rendered in the
user's browser. When changes are made, only changes to the client are
sent back, in order to keep the accuracy and fidelity of the document
between client and server, while at the same time reducing the
bandwidth use to the bare minimum.

Every document can be shown in either a read-only mode, with a
simplified |gui| limited to the viewing functionalities, or in edit
(read/write) mode with a full |gui|.

Key Features
------------

The most used key features of |docs| are:

* To view and to edit documents, both in single-use and collaborative
  mode
  
* The same functionalities of a LibreOffice desktop software are supported

* Support of collaborative editing features from any modern browser,
  with no additional or third-party plugin needed

* Compatibility with Microsoft Office documents
  
* Interoperability across platforms and operating systems
  
* Preservation of layout and formatting of documents saved in
  different formats or file types:

  * text documents (odt, docx, doc, txt, rft and more)
  * spreadsheets (ods, xlsx, xls) 
  * presentations (odp, pptx, ppt)

* Ability to save the same file in different format or file type.

* Support to export documents as PDF files

* Preview of PDF files

* Limited |gui| for read-only documents, full |gui| to support
  all read and write  documents

.. _install-fonts:

Custom Fonts for |docs|
-----------------------

|docs| can pick up any font that is installed in standard system
directory fonts, like :file:`/usr/share/fonts`. Hence, to install a
font family, simply use the package manager. For example, to install
the Roboto fonts, use the command:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt-get install fonts-roboto

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install fonts-roboto


Once done, restart |docs|.

.. code:: console

   # systemctl restart carbonio-docs-editor.service

The fonts will now be available for use in |docs|.


