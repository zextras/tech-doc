
.. code:: bash

   zxsuite team iceServer get [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| account(O)      | String          | u               |                 |
|                 |                 | ser@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| cos(O)          | String          | default         |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Example

.. code:: bash

   zxsuite team iceServer get

.. rubric:: Example

.. code:: bash

   zxsuite team iceServer get cos default
