.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The password |dbadmpwd| created in the previous step for the
``carbonio_adm`` role in database is required in this step, in which
we configure the databases of |product| using a few commands. First,
we bootstrap the databases.

* |carbonio| Advanced
  
  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

* |file|

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

* |docs|
  
  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

Then restart the main mailbox process as the ``zextras`` user.

.. code:: console

   zextras$ zmcontrol stop
   zextras$ zmcontrol start
