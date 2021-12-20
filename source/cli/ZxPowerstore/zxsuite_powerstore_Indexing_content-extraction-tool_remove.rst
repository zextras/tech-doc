
::

   zxsuite powerstore Indexing content-extraction-tool remove *endpoint*
   [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **              | String          |                 |                 |
| endpoint**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| server(O)       | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| global(O)       | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

Remove tika endpoint for this mailbox store:

.. rubric:: Usage Example

::

   zxsuite powerstore Indexing content-extraction-tool remove http://tika-server.example.com:9998/tika

Remove tika endpoint for mailbox store store1.example.com:

.. rubric:: Usage Example

::

   zxsuite powerstore Indexing content-extraction-tool remove http://tika-server.example.com:9998/tika server store1.example.com

Remove tika endpoint used by all mailbox stores that don’t have any
endpoint specified:

.. rubric:: Usage Example

::

   zxsuite powerstore Indexing content-extraction-tool remove http://tika-server.example.com:9998/tika global true
