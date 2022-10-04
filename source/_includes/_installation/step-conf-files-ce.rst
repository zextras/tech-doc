.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The password created in the previous step for the ``carbonio_adm``
role in database is required in this step, in which we bootstrap the
databases of |product|, which requires a few commands to be executed:

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1
   # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
   # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1
   # su - zextras
   # zmmailboxdctl restart
