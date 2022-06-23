.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The final steps is to bootstrap |file|\'s DB (replacing the example
password **My-Files-pwd01$** with the chosen one):

.. code:: console

   # PGPASSWORD=My-Files-pwd01$ carbonio-files-db-bootstrap carbonio-files-adm 127.0.0.1
