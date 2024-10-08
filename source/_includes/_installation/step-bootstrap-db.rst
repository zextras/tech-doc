.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The password |dbadmpwd| created for the ``carbonio_adm`` role is
required in this step, in which we configure the databases required by
|product|, by running the following commands.

.. card:: |file|

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap \
        carbonio_adm 127.0.0.1

.. card:: |task|

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-tasks-db-bootstrap \
        carbonio_adm 127.0.0.1

.. card:: |wsc|

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-ws-collaboration-db-bootstrap \
        carbonio_adm 127.0.0.1

.. card:: |wsc| Dispatcher

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-db-bootstrap \
        carbonio_adm 127.0.0.1

.. card:: |wsc| migration

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
        carbonio_adm 127.78.0.10 20000

When you're done, restart the main mailbox process as the ``zextras``
user.

.. code:: console

   zextras$ zmcontrol stop
   zextras$ zmcontrol start
