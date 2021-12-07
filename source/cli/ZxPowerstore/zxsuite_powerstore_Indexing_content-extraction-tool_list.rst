
::

   zxsuite powerstore Indexing content-extraction-tool list [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| server(O)       | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| global(O)       | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

List tika endpoints for this mailbox store:

.. rubric:: Usage Example

::

   zxsuite powerstore Indexing content-extraction-tool list

List tika endpoints for mailbox store store1.example.com:

.. rubric:: Usage Example

::

   zxsuite powerstore Indexing content-extraction-tool list server store1.example.com

List tika endpoints for all mailbox stores that don’t have any endpoint
specified:

.. rubric:: Usage Example

::

   zxsuite powerstore Indexing content-extraction-tool list global true
