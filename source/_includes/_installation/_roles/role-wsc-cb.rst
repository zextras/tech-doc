.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install postgresql-client carbonio-message-dispatcher \
           carbonio-ws-collaboration carbonio-notification-push \
           carbonio-push-connector service-discover-agent

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration carbonio-notification-push \
           carbonio-push-connector service-discover-agent

      Install PostgreSQL repository

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Install PostgreSQL client

      .. code:: console

         # dnf -y install postgresql16

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-message-broker \
           carbonio-message-dispatcher carbonio-ws-collaboration \
           carbonio-videoserver-advanced carbonio-videorecorder \
           carbonio-notification-push carbonio-push-connector \
           service-discover-agent

      Install PostgreSQL repository

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Install PostgreSQL client

      .. code:: console

         # dnf -y install postgresql16
