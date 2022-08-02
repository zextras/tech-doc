.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Services
--------

Each Zextras Suite module is composed by multiple "services", each one
providing a specific set of features.

All modules include at least the ``module`` service, which governs the
entire module: stopping the service will stop the module, and disabling
the auto-start of this service will prevent the entire module to be
loaded when the mailboxd service starts.

.. _service_management:

Service Management
------------------

Services can be controlled via the Zextras CLI using the following
module commands:

-  ``getServices`` - lists all services and shows their status

-  ``doStartService [serviceName]`` - starts the *serviceName* service

-  ``doStopService [serviceName]`` - stops the *serviceName* service

-  ``doRestartService [serviceName]`` - restarts the *serviceName*
   service

The ``getServices`` command will show whether the module is ``running``
and if it can be started or stopped, e.g.::

   zimbra@mail:~$ zxsuite backup getServices

           services
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               backup-realtime
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               [...]

If a service cannot be started, the ``getServices`` command will also
display the reason::

   zimbra@mail:~$ zxsuite mobile getServices

   [...]
               anti-dos
                   could_not_start_because                                     anti-dos disabled
                   could_start                                                 false
                   could_stop                                                  false
                   running                                                     false

For each module, these are the available services. For each service,
the same sub-commands shown in the previous snippet are available
(i.e. ``could_not_start_because``, ``could_start``, ``could_stop``,
``running``).

.. grid::
   :gutter: 3

   .. grid-item-card:: Admin Services
      :columns: 6

      .. csv-table:: Admin Service List
         :header: "Service", "Description"

         "**module**", "the entire module"
         "**logging handles**", "Admin Logging (reports and auditing)"
         "**report-cron**", "handles the scheduling of Admin Report
         generation and distribution"
         "**admin-attributes-listener**", "handles instant
         configuration changes without service restarts"

   .. grid-item-card:: Mobile Services
      :columns: 6

      .. csv-table:: Mobile Service List
         :header: "Service", "Description"
                  
         "**module**", "the entire module"
         "**activesync**", "handles all Activesync features"
         "**autodiscover**", "handles the Autodiscovery feature"
         "**abq**", "handles the ABQ feature"
         "**anti-dos**", "handles the Mobile Anti DOS feature"

   .. grid-item-card:: Backup Services
      :columns: 6

      .. csv-table:: Backup Service List
         :header: "Service", "Description"
                  
         "**module**", "the entire module"
         "**backup-realtime**", "handles the RealTime Scanner and its
         features"
         "**purge-cron**", "handles the scheduling of the weekly
         Purge"
         "**smartscan-cron**", "handles the scheduling of the daily
         SmartScan"
         "**drive-realtime**", "handles the realtime backup of Zextras
         Drive items"
         "**backup-attributes-listener**", "handles instant
         configuration changes without service restarts"

   .. grid-item-card:: Powerstore Services
      :columns: 6

      .. csv-table:: Powerstore Service List
         :header: "Service", "Description"

         "**module**", "the entire module"
         "**powerstore-log**", "handles operation logging"
         "**store-manager-services**", "handles StoreManager override
         and third party storages"
         "**schedule-move-operations**", "handles the scheduling of
         the daily HSM move"
         "**indexer-manager**", "handles the internal indexer for mail
         attachments and files"
         "**powerstore-attribute-listener**", "handles instant
         configuration changes without service restarts"

   .. grid-item-card:: Team Services
      :columns: 6

      .. csv-table:: Team Service List
         :header: "Service", "Description"

         "**database**", "handles the Team HSQL DB"
         "**current-chat-services**", "handles Team services"
         "**module**", "the entire module"
         "**team-cluster-status**", "keeps track of all available Team
         API versions in the cluster"
         "**team-api**", "all private APIs"
         "**team-websocket**", "handles websockets needed for all
         connections"
         "**team-firebase-notifications**", "handles mobile
         notifications"
         "**team-meeting-manager**", "handles Instant Meetings"
         "**team-room-resolver**", "handles the resolution of Spaces
         and Channels across servers"
         "**team-websocket-handler**", "handles websocket creation and
         management"
         "**team-http-handler**", "handles http/s requests"
         "**team-audit-logger**", "handles the Audit Logging feature"
         "**team-clustering**", "handles clustering between Team
         instances in the same infrastructure"
         "**team-request-router**", "handles the routing of requests
         across servers"
         "**team-janus-pool**", "Handles Videoserver pooling"
         "**rooms-cleanup-service**", "handles the cleanup of empty
         and unused Spaces, Channels and Groups"

   .. grid-item-card:: Drive Services
      :columns: 6

      .. csv-table:: Drive Service List
         :header: "Service", "Description"

         "**module**", "the entire module"
         "**drive-register-api-service**", "handles private API
         registration"
         "**drive-websocket**", "handles all websockets needed by
         Drive"
         "**drive-preview**", "handles file preview generation"
         "**drive-index**", "handles file content indexing"
         "**drive-purge-tombstones**", "handles pruning of recently
         deleted files"
         "**drive-remove-nodes-marked-for-deletion**", "handles file
         deletion"
         "**drive-account-cleaner**", "cleans up the Drive HSQL
         database from accounts deleted from Zimbra"
         "**drive-request-service**", "handles private APIs"

   .. grid-item-card:: Auth Services

      .. csv-table:: Auth Service List
         :header: "Service", "Description"

         "**module**", "the module itself"
         "**auth-database**", "handles the Auth HSQL DB"
         "**auth-database-updater**", "handles database schema
         updates"
         "**user-gateway**", "*inactive*"
         "**login-assets**", "*inactive*"
         "**authorization-service**", "*inactive*"
         "**authentication-service**", "handles authentication
         features such as Mobile Passwords"
         "**key-manager**", "handles encryption keys and secrets"
         "**migrate-mobile-passwords**", "handles Mobile Password
         migrations from pre-Auth Zextras Suite versions"
