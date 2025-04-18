.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      Install packages

      .. code:: console

         # apt install postgresql-client-16 carbonio-message-dispatcher \
           carbonio-ws-collaboration carbonio-push-connector \
           carbonio-notification-push

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      Install packages

      .. code:: console

         # apt install postgresql-client-16 \
           carbonio-message-dispatcher carbonio-ws-collaboration \
           carbonio-push-connector carbonio-notification-push

   .. tab-item:: RHEL 8
      :sync: rhel8

      Install packages

      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration postgresql16 \
           carbonio-push-connector carbonio-notification-push

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      Install packages

      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration postgresql16 \
           carbonio-push-connector carbonio-notification-push
