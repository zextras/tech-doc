.. _wsc-adv:

================
 |wsc| Advanced
================

This section contains advanced |wsc| configuration and suggestions to
improve performances and optimise the Module.

.. _wsc_adv-conf:

|wsc| Configuration
===================

In this section we present advanced configuration options for |wsc|.

.. index:: Chats; global user search (CLI)

User Search Across Domains
--------------------------

Within a multi-domain |product| infrastructure, there are two
attributes that control how a user can search for users in other
domains: ``carbonioSearchAllDomainsByFeature`` and
``carbonioSearchSpecifiedDomainsByFeature``. Both available to the
**Global Administrator only**, the first one enables a user to search
for users in **all the domains** configured by using CLI command

.. code:: console

   zextras$ carbonio prov mcf carbonioSearchAllDomainsByFeature TRUE

.. seealso:: This option is available on the |adminui|
   (:menuselection:`Admin Panel --> Domains --> Global --> Settings`),
   please see the :ref:`dedicated box <wsc-user-search>` in the
   Domain's global settings.

.. index:: Chats; user search by domain (CLI)

The second attribute works only if
``carbonioSearchAllDomainsByFeature`` is set to ``FALSE`` and allows
only certain domains to be searched by a user, and can be configured
as follows

.. code:: console

   zextras$ carbonio prov md example.com carbonioSearchSpecifiedDomainsByFeature test.edu

This command allows a user of example.com to search for users in the
test.edu domain and start a chat with them.

.. seealso:: This option is available on the |adminui|
   (:menuselection:`Admin Panel --> Domains --> Details --> General
   Settings`).

.. index:: Chats; set read only

.. _wsc-chats-ro:

Set Legacy Chats Read Only
--------------------------

If you enabled |wsc|, to prevent user using the old Chats, you
can set it in *read-only* mode. By doing so, users will still able to
access the textual *Chats*, the *Spaces*, and the *Rooms*, but it
will not be possible to message users or create new Spaces and
Rooms. Additionally, the input bar at the bottom will be replaced by a
string *The application is in Read Only mode*.

To set the legacy Chats read-only, use the CLI command

.. code:: console

   zextras$ carbonio config set cos default teamReadOnlyEnabled true

.. index:: Chats; disable

.. _wsc-chats-dis:

Disable Legacy Chats
--------------------

To completely disable the legacy Chats, both textual and video, you
need to carry out tasks at different levels: global, COS, account, and
application.

.. hint:: All commands in this section, except where explicitly
   stated, must be executed as the |zu|.

We start by disabling the functionality on the whole infrastructure.

.. code:: console

   zextras$ carbonio config set global teamChatEnabled  false
   zextras$ carbonio config set global videoChatEnabled false

Then, disable the functionality on all CoSes in which it is
enabled with the following two one-liners.

.. code:: console

   zextras$ carbonio prov gac | while read cos; do echo "config set cos \"$cos\" teamChatEnabled false"; echo "config set cos \"$cos\" videoChatEnabled false";  done  | carbonio

.. code:: console

   zextras$ carbonio prov gac | while read cos; do echo "mc \"$cos\" carbonioFeatureWscEnabled FALSE"; done  | carbonio prov

Disable the functionality on all accounts in which it is enabled with
the following two one-liners.

.. code:: console

   zextras$ carbonio prov -l gaa | while read account; do echo "config set account \"$account\" teamChatEnabled false"; echo "config set account \"$account\" videoChatEnabled false";  done  | carbonio

.. code:: console

   zextras$ carbonio prov -l gaa | while read account; do echo "ma \"$account\" carbonioFeatureWscEnabled \"\""; done  | carbonio prov

On the node hosting the *Mailstore & Provisioning* Component, disable the
Chat's automatic start, then stop the service.

.. code:: console

   zextras$ carbonio config set global ZxChat_ModuleEnabledAtStartup false

.. code:: console

   zextras$ carbonio chats dostopservice module

At this point the Chats functionality is completely disabled. You can
now log in to the *Proxy* Node and remove the package providing Chats
as the |ru|:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubu

      .. code:: console

         # apt remove carbonio-chats-ui

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf remove carbonio-chats-ui

.. _wsc-optimise:

|wsc| Optimisations
===================

Once the :ref:`component-wsc-install` is operational, some tweaking can be
applied to its configuration to improve performances.

The remainder of this page contains a few tables that list the *Key
names* and the *default values* of some |wsc| configuration values
that you can modify. You can take these tables into account in case you
want to revert some values to their default after some unsatisfactory
change.


How to Modify Values
--------------------

Values can be changed by using, from any Node, the |mesh| kv
interface: you can access it using the :command:`consul` command from
the CLI.

* To verify the current value of any key, use command

  .. code:: console

     # consul kv get -token-file="$CONSUL_TOKEN_PATH" "$KEY"

* To modify one of the values reported in the tables below, use
  command

  .. code:: console

     # consul kv put -token-file="$CONSUL_TOKEN_PATH" "$KEY" "$VALUE"

In the commands, ``$CONSUL_TOKEN_PATH`` refers to an **environment
variable** that tells a command or a script **where to find the ACL token
file** needed to authenticate with |mesh| when performing operations
like reading or writing KV values, while ``$KEY`` and ``$VALUE`` are
the *key name* and the *new value*, respectively, as written in the
tables.

.. rubric:: Scenario:

To get the value of
**carbonio-ws-collaboration/hikari/leak-detection-threshold**,
``CONSUL_TOKEN_PATH`` must be valued to
:file:`/etc/carbonio/ws-collaboration/service-discover/token`.

.. rubric:: Example:

You can do this with:

.. code-block:: console
   :linenos:

   #export CONSUL_TOKEN_PATH=/etc/carbonio/ws-collaboration/service-discover/token
   #consul kv get -token-file="$CONSUL_TOKEN_PATH"  "carbonio-ws-collaboration/hikari/leak-detection-threshold"

In this case you will:

* Read the token from :file:`/etc/carbonio/ws-collaboration/service-discover/token`

* Use that token to authenticate the request to |mesh|

* Fetch the value of the KV key

If you need to change the value of the key the ``CONSUL_TOKEN_PATH``
variable should be passed in the same way.


Configuration tables
--------------------

The following tables are available to optimise Chats: :ref:`Push
Connector <wsc-pool-opt>`, :ref:`Push Notifications Database
<wsc-push-opt>`, and :ref:`the Chats Database <wsc-db-opt>`.

.. _wsc-pool-opt:

.. card:: Push Connector

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-push-connector/hikari/min-idle-connections", "10"
      "carbonio-push-connector/hikari/max-pool-size", "10"
      "carbonio-push-connector/hikari/idle-timeout", "10000"
      "carbonio-push-connector/hikari/leak-detection-threshold", "5000"

   Once you modify any of these changes, restart the service.

   .. code:: console

      # systemctl restart carbonio-push-connector

.. _wsc-push-opt:

.. card:: Configure Notifications Push Database

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-notification-push/hikari/min-idle-connections", "10"
      "carbonio-notification-push/hikari/max-pool-size", "10"
      "carbonio-notification-push/hikari/idle-timeout", "10000"
      "carbonio-notification-push/hikari/leak-detection-threshold", "5000"

   Once you modify any of these changes, restart the service.

   .. code:: console

      # systemctl restart carbonio-notification-push

.. _wsc-db-opt:

.. card:: Configure |wsc| Database

   .. csv-table::
      :header: "Key name", "Default value"
      :widths: 70, 30

      "carbonio-ws-collaboration/hikari/min-idle-connections", "10"
      "carbonio-ws-collaboration/hikari/max-lifetime", "600000"
      "carbonio-ws-collaboration/hikari/max-pool-size", "10"
      "carbonio-ws-collaboration/hikari/idle-timeout", "10000"
      "carbonio-ws-collaboration/hikari/leak-detection-threshold", "5000"

Modify Connection Pool
----------------------

This optimisation does not require access to the kv interface.
Instead, you need to edit file
:file:`/etc/carbonio/message-dispatcher/mongooseim.toml` and change
the value of ``workers`` in section
``[outgoing_pools.rdbms.default]``::

  [outgoing_pools.rdbms.default]
    scope = "global"
    strategy = "best_worker"
    workers = 10 # db connection pool numbers

Then, restart the service.

.. code:: console

   # systemctl restart carbonio-message-dispatcher
