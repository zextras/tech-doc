
::

   zxsuite core apply-patch *service* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **ser           | String          |                 |                 |
| vice**\ (M)     |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| hosts(O)        | String[,..]     |                 | all_servers     |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite core apply-patch proxy nginx1.example.com,nginx2.example.com

applies the latest patch available for the proxy service on
nginx1.example.com and nginx2.example.com, based on their version

.. rubric:: Usage Example

::

   zxsuite core apply-patch proxy all_servers

applies the latest patch available for the proxy service on all servers
with proxy service enabled, based on their version
