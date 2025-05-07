.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
     carbonio_adm 127.78.0.10 20000

Restart the service

.. code:: console

   # systemctl restart carbonio-message-dispatcher
