.. card:: |wsc| migration

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
        carbonio_adm 127.0.0.1


   Restart the service

   .. code:: console

      # systemctl restart carbonio-message-dispatcher
