.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

This is the last configuration step and will set up the JDBC
connections with PostgreSQL.

.. code:: console

   # zxsuite config set global powerstoreMetadataDb '{"url":"jdbc:postgresql://127.0.0.1:20003/powerstore","user":"powerstore","password":"My-PowerStore-pwd98%"}'
   # zxsuite config set global activeSyncDb '{"url":"jdbc:postgresql://127.0.0.1:20003/activesync","user":"activesync","password":"My-Sync-pass-_#4"}'
   # zxsuite config set global abqMetadataDb '{"url":"jdbc:postgresql://127.0.0.1:20003/abq","user":"abq","password":"'My_AbQ-psw]4<"}'
   # zxsuite mobile doRestartService module
   # zxsuite powerstore doRestartService module
