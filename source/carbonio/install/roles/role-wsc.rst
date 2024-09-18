
.. _role-wsc-install:

|wsc|
=====

|cwsc| Role is a multi-layered software that adds the video meeting
and recording functionalities to |product|.

This Role can currently be installed only manually, so please read
Sections :ref:`role-wsc-limits` and :ref:`role-wsc-req` below.

If you plan to install this Role in an existing |product|
infrastructure, please read carefully Section :ref:`wsc-install`.

|wsc| depends on two mandatory services: *Carbonio Message
Dispatcher*, which includes a database component, and *Carbonio
Message Broker*. Additional software provide optional services, like
push notifications and video recording.

.. _role-wsc-limits:

Limitations
-----------

In the current release |release|, the following limitation apply to
the installation of the |wsc| Role

* It must be installed manually, there is no Ansible support for the
  installation
* It can not be installed on the same node as |vs|
* Data from the legacy Chats module can not be exported to new |wsc|
  Role

.. _role-wsc-req:

Requirements
------------

The |wsc| Role is quite complex in terms of both internal architecture
and installation, therefore it requires to pay some attention while
installing it:

* All commands and all file editing activities must be executed as the
  ``root`` user, unless noted differently

* The ``carbonio-user-management`` package must be installed in the
  |product| infrastructure (it is part on the
  :ref:`role-proxy-install` Role)

* The :ref:`role-files-install` Role must be installed in the
  |product| infrastructure

* |cwsc| requires that some ports be forwarded on this and on the
  Proxy Nodes. They are listed in :ref:`fw-ports` as well.

.. csv-table::
   :header: "Port", "Protocol", "Node" "Service"
   :widths: 10 10 10 70

   "5222", "TCP", "|wsc|", "Message Dispatcher"
   "20000-40000", "UDP", "Proxy", "Audio & video streaming"

.. _wsc-install:

Installation
------------

The directions in the reminder of this page apply to a new installation
of |product|. If you already have an existing |product|
infrastructure, the procedure is very similar, but you have to take
into account the following points:

* The |vs| or Chats modules may be already installed within the
  infrastructure, but you can keep them: the |wsc| does not share any
  component with them

* There is a *Database preparation* step to carry out on the **Database
  Node** before starting the |wsc| installation: please follow the
  instructions to Section :ref:`role-wsc-db-install`

Now, depending on how you plan to install |wsc|, the procedure
slightly changes.

If you plan to install |wsc| on a dedicated Node, make sure that you
install :ref:`role-vs-wsc-install` on another dedicated Node, then
follow the installation procedure as it described below, starting from
the next section, :ref:`role-wsc-packages`.

If you plan to install |wsc| on an existing Node, the following
adjustments apply to the procedure.

#. In Section :ref:`role-wsc-packages`, remove package
   :file:`service-discover-agent` from the list of packages to be
   installed

#. Skip Sections :ref:`role-wsc-bootstrap` and :ref:`role-wsc-mesh`

#. Install package :file:`carbonio-ws-collaboration-ui` on the
   :ref:`role-proxy-install` Node

#. Install the :ref:`role-vs-wsc-install` Role on a dedicated Node or
   in any Node that does not feature :ref:`role-vs-install`, because
   they are not compatible

.. _role-wsc-packages:

Install Packages
----------------

This section presents the procedure to install and configure all the
packages and the Node on which to install them. Please remember to
read section :ref:`role-wsc-req` above before starting the actual
package installation.

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-wsc-cb.rst

.. _role-wsc-bootstrap:

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

.. _role-wsc-mesh:

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst

Migrate dispatcher
-------------------

Initialise the message dispatcher

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
     carbonio_adm 127.78.0.10 20000

Restart the service

.. code:: console

   # systemctl restart carbonio-message-dispatcher

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

   This service requires two files that will be provided by the |zx|
   Sales representative. They must be saved on the |wsc| Node as
   follows:

   * file `service-account-file.json` must be saved under directory
     :file:`/etc/carbonio/notification-push/android`

   * file `wscassets/auth-key.p8` must be saved under directory
     :file:`/etc/carbonio/notification-push/ios`

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

   The following values can be modified via the |mesh| interface (see
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

   The following values can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands
   presented above.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-notification-push/hikari/min-idle-connections", "10"
      "carbonio-notification-push/hikari/max-pool-size", "10"
      "carbonio-notification-push/hikari/idle-timeout", "10000"
      "carbonio-notification-push/hikari/leak-detection-threshold", "5000"

.. card:: Configure |wsc| Database

   The following values can be modified via the |mesh| interface (see
   Section :ref:`mesh-gui`) or via the CLI, using the commands
   presented above.

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-ws-collaboration/hikari/min-idle-connections", "10"
      "carbonio-ws-collaboration/hikari/max-pool-size", "10"
      "carbonio-ws-collaboration/hikari/idle-timeout", "10000"
      "carbonio-ws-collaboration/hikari/leak-detection-threshold", "5000"

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

You need to allow each user to use |wsc|,  either from the |adminui|
or running from the CLI the following command as the ``zextras`` user,
replacing the e-mail address with the one of the user.

.. code:: console

   zextras$ carbonio prov ma john@example.com default carbonioFeatureChatsEnabled TRUE

Troubleshooting & Checks
------------------------

WSC Status Check
~~~~~~~~~~~~~~~~

The following command will output a detailed status of |wsc| and of
all its dependencies.

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq
