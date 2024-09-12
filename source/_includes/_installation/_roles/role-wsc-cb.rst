.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install postgresql-client carbonio-message-broker \
           carbonio-message-dispatcher carbonio-ws-collaboration \
           carbonio-notification-push carbonio-push-connector \
           service-discover-agent

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-message-broker \
           carbonio-message-dispatcher carbonio-ws-collaboration \
           carbonio-notification-push carbonio-push-connector \
           service-discover-agent

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

After the installation, make sure that the |vs| `public` IP address
(i.e., the one that will accept incoming connections to the |vs|) is
present in the configuration file :file:`/etc/janus/janus.jcfg` and
add it if missing: find the variable ``nat_1_1_mapping`` and add it,
for example::

  nat_1_1_mapping = "93.184.216.34"

Then, restart the service


.. code:: console

   # systemctl restart
