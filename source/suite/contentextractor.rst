.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _pws_external_content_extractor:

External Content Extractor
==========================

.. warning:: This feature is currently in beta, usage in production
   environment is not recommended.

The external content extractor detects and extracts metadata and text
from over a thousand different file types (such as PPT, XLS, and PDF).
All of these file types can be parsed through a single interface, making
it useful for search engine indexing, content analysis, translation, and
much more.

.. _pws_why_use_tika_server_as_content_extractor:

Why use Tika Server as Content Extractor?
-----------------------------------------

Zextras uses a Tika library that shares the same Java Virtual Machine
(JVM) as the mailbox. With the Tika server you can you can have multiple
Tika servers indexing the content separated from the mailbox. In case of
a crash of a Tika server, the mailbox JVM remains unaffected.

.. _pws_switching_to_the_tika_server:

Switching to the Tika Server
----------------------------

You can run Tika server as a `docker container
<https://github.com/apache/tika-docker>`_, on the same server as the
mailbox; or on separate servers accessible by Zimbra.

Tika Server Management
----------------------

.. grid::
   :gutter: 3

   .. grid-item-card:: Add a Tika Server
      :columns: 4

      You can add a Tika server by running the following command on the
      Command Line Interface (CLI).

      .. dropdown:: ``zxsuite powerstore Indexing content-extraction-tool add``
   
         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_Indexing_content-extraction-tool_add.rst

   .. grid-item-card:: List Tika Servers
      :columns: 4

      You can list all Tika servers by running the following command on the
      Command Line Interface (CLI).

      .. dropdown:: ``zxsuite powerstore Indexing content-extraction-tool list``

         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_Indexing_content-extraction-tool_list.rst


      A sample output lists all the running Tika servers with their
      addresses and the ports on which they are listening, for
      example::

        content-extraction-endpoints
                   http://test.example.com:9998/tika

   .. grid-item-card:: Remove a Tika Server
      :columns: 4

      You can remove a previously added Tika server by running the following
      command on the Command Line Interface (CLI).

      .. dropdown:: ``zxsuite powerstore Indexing content-extraction-tool remove``
   
         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_Indexing_content-extraction-tool_remove.rst

.. _pws_is_the_tika_server_running:

Is the Tika Server Running?
---------------------------

You can use the following methods to check if the Tika Server is
running.

.. grid::
   :gutter: 3

   .. grid-item-card:: From the Graphical User Interface (GUI)
      :columns: 6

      1. Send an email with a new attachment

      2. Search for the attachment

   .. grid-item-card:: From the CLI
      :columns: 6

      1. Navigate to :file:`/opt/zimbra/log`

      2. View the contents of :file:`mailbox.log`

         - You can use :command:`tail -f` to follow in real time the new
           messages in the file.
                
      Sample Output::

        2021-07-07 15:24:25,444 INFO [qtp413601558-41832:https://mail.example.com/service/soap/SearchRequest] [name=user@mail.example.com;mid=136;oip=192.168.0.10;port=33008;ua=ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4007;soapId=3084e510;] mailbox - Using http://test.example.com:9997/tika for content extraction
