
If you want to enable mobile notification, you need to configure
mobile notifications and Push Notifications according
to the directions given below.

.. card:: Configure mobile notifications

   The following lines must be added to file
   :file:`/etc/carbonio/message-dispatcher/mongooseim.toml` to properly
   allow notication push::

     [outgoing_pools.http.http_pool.connection]
       host = "http://127.78.0.10:20001"
       request_timeout = 5000

     [modules.mod_event_pusher.http]
       [[modules.mod_event_pusher.http.handlers]]
         pool_name = "http_pool"
         path = "/notifications"

   Then, restart the service.

   .. code:: console

      # systemctl restart carbonio-message-dispatcher

.. card:: Configure Push Notifications

   This service requires two files that will be provided by the |zx|
   Sales representative. They must be saved on the |wsc| Node as
   follows:

   * file `service-account-file.json` must be saved under directory
     :file:`/etc/carbonio/notification-push/android`

   * file `auth-key.p8` must be saved under directory
     :file:`/etc/carbonio/notification-push/ios`

   Next, configure them using the following commands

   .. code:: console

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/team-id" "X95YE8AZMB"

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/key-id" "DN8BH5LMKG"

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/topic" "com.zextras.chats"
