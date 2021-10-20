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
and if it can be started or stopped, e.g.

::

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
display the reason:

::

   zimbra@mail:~$ zxsuite mobile getServices

   [...]
               anti-dos
                   could_not_start_because                                     anti-dos disabled
                   could_start                                                 false
                   could_stop                                                  false
                   running                                                     false

.. _backup_services:

Backup Services
---------------

::

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
               purge-cron
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               smartscan-cron
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-realtime
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               backup-attributes-listener
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true

.. table:: Backup Service List

   +----------------------+-----------------------------------------------+
   | Service              | Description                                   |
   +======================+===============================================+
   | ``module``           | the entire module                             |
   +----------------------+-----------------------------------------------+
   | ``backup-realtime``  | handles the RealTime Scanner and its features |
   +----------------------+-----------------------------------------------+
   | ``purge-cron``       | handles the scheduling of the weekly Purge    |
   +----------------------+-----------------------------------------------+
   | ``smartscan-cron``   | handles the scheduling of the daily SmartScan |
   +----------------------+-----------------------------------------------+
   | ``drive-realtime``   | handles the realtime backup of Zextras Drive  |
   |                      | items                                         |
   +----------------------+-----------------------------------------------+
   | ``backup-attributes- | handles instant configuration changes without |
   | listener``           | service restarts                              |
   +----------------------+-----------------------------------------------+

.. _mobile_services:

Mobile Services
---------------

::

   zimbra@mail:~$ zxsuite mobile getServices

           services
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               activesync
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               autodiscover
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               abq
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               anti-dos
                   could_not_start_because                                     anti-dos disabled
                   could_start                                                 false
                   could_stop                                                  false
                   running                                                     false

.. table:: Mobile Service List

   +----------------------+-----------------------------------------------+
   | Service              | Description                                   |
   +======================+===============================================+
   | ``module``           | the entire module                             |
   +----------------------+-----------------------------------------------+
   | ``activesync``       | handles all Activesync features               |
   +----------------------+-----------------------------------------------+
   | ``autodiscover``     | handles the Autodiscovery feature             |
   +----------------------+-----------------------------------------------+
   | ``abq``              | handles the ABQ feature                       |
   +----------------------+-----------------------------------------------+
   | ``anti-dos``         | handles the Mobile Anti DOS feature           |
   +----------------------+-----------------------------------------------+

.. _powerstore_services:

Powerstore Services
-------------------

::

   zimbra@mail:~$ zxsuite powerstore getServices

           services
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               powerstore-log
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               store-manager-service
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               schedule-move-operation
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               indexer-manager
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               powerstore-attribute-listeners
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true

.. table:: Powerstore Service List

   +----------------------+-----------------------------------------------+
   | Service              | Description                                   |
   +======================+===============================================+
   | ``module``           | the entire module                             |
   +----------------------+-----------------------------------------------+
   | ``powerstore-log``   | handles operation logging                     |
   +----------------------+-----------------------------------------------+
   | ``store-manager-serv | handles StoreManager override and third party |
   | ices``               | storages                                      |
   +----------------------+-----------------------------------------------+
   | ``schedule-move-oper | handles the scheduling of the daily HSM move  |
   | ations``             |                                               |
   +----------------------+-----------------------------------------------+
   | ``indexer-manager``  | handles the internal indexer for mail         |
   |                      | attachments and files                         |
   +----------------------+-----------------------------------------------+
   | ``powerstore-attribu | handles instant configuration changes without |
   | te-listener``        | service restarts                              |
   +----------------------+-----------------------------------------------+

.. _admin_services:

Admin Services
--------------

::

   zimbra@mail:~$ zxsuite admin getServices

           services
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               logging
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               report-cron
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               admin-attributes-listener
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true

.. table:: Admin Service List

   +----------------------+-----------------------------------------------+
   | Service              | Description                                   |
   +======================+===============================================+
   | ``module``           | the entire module                             |
   +----------------------+-----------------------------------------------+
   | ``logging``          | handles Admin Logging (reports and auditing)  |
   +----------------------+-----------------------------------------------+
   | ``report-cron``      | handles the scheduling of Admin Report        |
   |                      | generation and distribution                   |
   +----------------------+-----------------------------------------------+
   | ``admin-attributes-l | handles instant configuration changes without |
   | istener``            | service restarts                              |
   +----------------------+-----------------------------------------------+

.. _team_services:

Team Services
-------------

::

   zimbra@mail:~$ zxsuite team getServices

           services
               database
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               current-chat-services
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-cluster-status
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-api
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-websocket
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-firebase-notifications
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-meeting-manager
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-room-resolver
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-websocket-handler
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-http-handler
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-audit-logger
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-clustering
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-request-router
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               team-janus-pool
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               rooms-cleanup-service
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true

.. table:: Team Service List

   +----------------------+-----------------------------------------------+
   | Service              | Description                                   |
   +----------------------+-----------------------------------------------+
   | database             | handles the Team HSQL DB                      |
   +----------------------+-----------------------------------------------+
   | current-chat-service | handles Team services                         |
   | s                    |                                               |
   +----------------------+-----------------------------------------------+
   | module               | the entire module                             |
   +----------------------+-----------------------------------------------+
   | team-cluster-status  | keeps track of all available Team API         |
   |                      | versions in the cluster                       |
   +----------------------+-----------------------------------------------+
   | team-api             | handles all private APIs                      |
   +----------------------+-----------------------------------------------+
   | team-websocket       | handles websockets needed for all connections |
   +----------------------+-----------------------------------------------+
   | team-firebase-notifi | handles mobile notifications                  |
   | cations              |                                               |
   +----------------------+-----------------------------------------------+
   | team-meeting-manager | handles Instant Meetings                      |
   +----------------------+-----------------------------------------------+
   | team-room-resolver   | handles the resolution of Spaces and Channels |
   |                      | across servers                                |
   +----------------------+-----------------------------------------------+
   | team-websocket-handl | handles websocket creation and management     |
   | er                   |                                               |
   +----------------------+-----------------------------------------------+
   | team-http-handler    | handles http/s requests                       |
   +----------------------+-----------------------------------------------+
   | team-audit-logger    | handles the Audit Logging feature             |
   +----------------------+-----------------------------------------------+
   | team-clustering      | handles clustering between Team instances in  |
   |                      | the same infrastructure                       |
   +----------------------+-----------------------------------------------+
   | team-request-router  | handles the routing of requests across        |
   |                      | servers                                       |
   +----------------------+-----------------------------------------------+
   | team-janus-pool      | Handles Videoserver pooling                   |
   +----------------------+-----------------------------------------------+
   | rooms-cleanup-servic | handles the cleanup of empty and unused       |
   | e                    | Spaces, Channels and Groups                   |
   +----------------------+-----------------------------------------------+

.. _drive_services:

Drive Services
--------------

::

   [zimbra@mail ~]$ zxsuite drive getServices

           services
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-register-api-service
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-websocket
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-preview
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-index
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-purge-tombstones
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-remove-nodes-marked-for-deletion
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-account-cleaner
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               drive-request-service
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true

.. table:: Drive Service List

   +----------------------+-----------------------------------------------+
   | module               | the entire module                             |
   +----------------------+-----------------------------------------------+
   | drive-register-api-s | handles private API registration              |
   | ervice               |                                               |
   +----------------------+-----------------------------------------------+
   | drive-websocket      | handles all websockets needed by Drive        |
   +----------------------+-----------------------------------------------+
   | drive-preview        | handles file preview generation               |
   +----------------------+-----------------------------------------------+
   | drive-index          | handles file content indexing                 |
   +----------------------+-----------------------------------------------+
   | drive-purge-tombston | handles pruning of recently deleted files     |
   | es                   |                                               |
   +----------------------+-----------------------------------------------+
   | drive-remove-nodes-m | handles file deletion                         |
   | arked-for-deletion   |                                               |
   +----------------------+-----------------------------------------------+
   | drive-account-cleane | cleans up the Drive HSQL database from        |
   | r                    | accounts deleted from Zimbra                  |
   +----------------------+-----------------------------------------------+
   | drive-request-servic | handles private APIs                          |
   | e                    |                                               |
   +----------------------+-----------------------------------------------+

.. _auth_services:

Auth Services
-------------

::

   [zimbra@mail ~]$ zxsuite auth getServices

           services
               module
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               auth-database
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               auth-database-updater
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               user-gateway
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               login-assets
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               authorization-service
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               authentication-service
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               key-manager
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true
               migrate-mobile-passwords
                   could_start                                                 false
                   could_stop                                                  true
                   running                                                     true

.. table:: Auth Service List

   +----------------------+-----------------------------------------------+
   | module               | the module itself                             |
   +----------------------+-----------------------------------------------+
   | auth-database        | handles the Auth HSQL DB                      |
   +----------------------+-----------------------------------------------+
   | auth-database-update | handles database schema updates               |
   | r                    |                                               |
   +----------------------+-----------------------------------------------+
   | user-gateway         | *inactive*                                    |
   +----------------------+-----------------------------------------------+
   | login-assets         | *inactive*                                    |
   +----------------------+-----------------------------------------------+
   | authorization-servic | *inactive*                                    |
   | e                    |                                               |
   +----------------------+-----------------------------------------------+
   | authentication-servi | handles authentication features such as       |
   | ce                   | Mobile Passwords                              |
   +----------------------+-----------------------------------------------+
   | key-manager          | handles encryption keys and secrets           |
   +----------------------+-----------------------------------------------+
   | migrate-mobile-passw | handles Mobile Password migrations from       |
   | ords                 | pre-Auth Zextras Suite versions               |
   +----------------------+-----------------------------------------------+
