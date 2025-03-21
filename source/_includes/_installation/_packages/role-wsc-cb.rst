.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install postgresql-client carbonio-message-dispatcher \
           carbonio-ws-collaboration carbonio-push-connector \
           carbonio-notification-push

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install postgresql-client carbonio-message-dispatcher \
           carbonio-ws-collaboration carbonio-push-connector \
           carbonio-notification-push

   .. tab-item:: RHEL 8
      :sync: rhel8

      Add PostgreSQL repository

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Install packages

      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration postgresql16 \
           carbonio-push-connector carbonio-notification-push

   .. tab-item:: RHEL 9
      :sync: rhel9

      Add PostgreSQL repository

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Install packages
      
      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration postgresql16 \
           carbonio-push-connector carbonio-notification-push
