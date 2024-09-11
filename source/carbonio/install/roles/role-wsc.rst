.. |epg| replace:: :bdg-info:`External PostgreSQL`

.. _role-wsc-install:

Workstream Collaboration
========================

The |WSC| Role is a multi-layered software that adds the video meeting and
recording functionalities to |product|.

|wsc| depends on two mandatory services: *Carbonio Message
Dispatcher*, which includes a database component, and *Carbonio
Message Broker*. Additional software provide optional services, like
push notifications and video recording.

.. note:: This Role can not be installed on the same node as |vs|.

.. _role-wsc-req:

Requirements
------------

The |wsc| Role is quite complex in terms of both internal architecture
and installation, therefore it requires to pay some attention while
installing it:

* All commands and all file editing activities must be executed as the
  ``root`` user, unless noted differently

* The **PostgreSQL client** must be installed on the Node

* The ``carbonio-user-management`` package must be installed in the
  |product| infrastructure (it is part on the
  :ref:`role-proxy-install` Role)

* Some ports must be forwarded to the Node on which |wsc| is
  installed, for |wsc| to work correctly. They are listed in
  :ref:`fw-ports` as well.

.. csv-table::
   :header: "Port", "Protocol", "Service"
   :widths: 10 10 80

   "5222", "TCP", "Message Dispatcher"

Install Packages
----------------

This section presents the procedure to install and configure all the
packages and the Node on which to install them. Please remember to
read section :ref:`role-wsc-req` above before starting the actual
package installation.

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-wsc-cb.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst

Configuration
-------------

If you want to enable mobile notification, you need to configure
mobile notifications and Push Notifications according
to the directions given below. In order to optimise the various
services, please refer to next Section :ref:`wsc-optimise`

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

   This service requires that two files be downloaded and copied in two
   directories:

   *  file :download:`/wscassets/service-account-file.json` must be saved
      under directory :file:`/etc/carbonio/notification-push/android`

   * file :download:`/wscassets/auth-key.p8` must be saved under
     directory :file:`/etc/carbonio/notification-push/ios`

   Next, configure them using the following commands

   .. code:: console

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/team-id" "X95YE8AZMB"

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/key-id" "DN8BH5LMKG"

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/topic" "com.zextras.chats"

.. _wsc-optimise:

Optimisations
-------------

.. card:: Configure Push Connector

   The following values, can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands that
   follow the table.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-push-connector/hikari/min-idle-connections", "10"
      "carbonio-push-connector/hikari/max-pool-size", "10"
      "carbonio-push-connector/hikari/idle-timeout", "10000"
      "carbonio-push-connector/hikari/leak-detection-threshold", "5000"

   To verify the current value of any key, use command

   .. code:: console

      # consul kv get -token-file="$CONSUL_TOKEN_PATH" "$KEY"

   To modify one of the values reported in the above table, use command

   .. code:: console

      # consul kv put -token-file="$CONSUL_TOKEN_PATH" "$KEY" "$VALUE"

   In both cases, ``$CONSUL_TOKEN_PATH`` is the |mesh| secret stored in
   file :file:`/var/lib/service-discover/password`, while ``$KEY`` and
   ``$VALUE`` are the key name and the new value, respectively.

   To apply the configuration changes, restart the service.

   .. code:: console

      # systemctl restart carbonio-push-connector

.. card:: Configure Push Notifications Database


   The following values, can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands that
   follow the table.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-notification-push/hikari/min-idle-connections", "10"
      "carbonio-notification-push/hikari/max-pool-size", "10"
      "carbonio-notification-push/hikari/idle-timeout", "10000"
      "carbonio-notification-push/hikari/leak-detection-threshold", "5000"

.. card:: Configure Connection Pool

   To modify the number of connection pool for this database, change the
   related property ``workers`` in section
   ``[outgoing_pools.rdbms.default]`` of file
   :file:`/etc/carbonio/message-dispatcher/mongooseim.toml`::

     [outgoing_pools.rdbms.default]
       scope = "global"
       strategy = "best_worker"
       workers = 1 # db connection pool numbers

   Then, restart the service.

   .. code:: console

      # systemctl restart carbonio-message-dispatcher

Enable |wsc|
------------

In order to enable WSC, execute the following command from the CLI as
the ``zextras`` user.

.. code:: console

   zextras$ carbonio prov mc default carbonioFeatureChatsEnabled TRUE

Troubleshooting & Checks
------------------------

This section presents a commands useful to check and verify the status
of of |wsc|.

WSC Status Check
~~~~~~~~~~~~~~~~

The following command will output a detailed status of |wsc| and of
all its dependencies.

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq

Broker & videoserver Check
~~~~~~~~~~~~~~~~~~~~~~~~~~

To make sure that videoserver and message broker are connected
successfully, check that in the carbonio-videoserver logs
(:command:`journalctl -u carbonio-videoserver`) you find the line::

  RabbitMQEventHandler: Connected successfullySetup of RabbitMQ event
  handler completed
