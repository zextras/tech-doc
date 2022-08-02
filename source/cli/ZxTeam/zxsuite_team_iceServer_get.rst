.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

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

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

.. code:: bash

   zxsuite team iceServer get

.. rubric:: Usage Example

.. code:: bash

   zxsuite team iceServer get cos default
