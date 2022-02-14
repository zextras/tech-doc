
.. still to do:

   * licensing, URLS and Ports: move to Admin --> Carbonio admin?
   * browser compatibility: factor out and move to sotware
     requirements
   * chats administration: ?

.. _chats:

======
|team|
======

|team| integrates a fully fledged corporate instant messaging
platform inside |carbonio|, including Group and Corporate
Messaging, File Sharing, Screen Sharing and informal Video Chat
capabilities.

.. _chats_browser_compatibility:

Browser compatibility
=====================

.. should browser compatibility be mentioned only once for all
   modules?

The following list shows which browsers are known to fully support all
Zextras features.

.. csv-table::
   :header: "Browser", "Version", "OS", "Supported"
   :file: _includes/browsercompatibility.csv
          
Items marked as ":fa:`check-circle;sd-text-warning` Limited" are only
supported on the browser’s two previous stable releases.

Firefox users must be sure to be running at least version 66 of the
browser to be able to use the Screen Sharing feature.

.. _chats_urls_and_ports:

URLs and Ports
==============

To build URLs and links like those used for External Shares, |team|
uses the default settings for the domain of the account in use - the
``zimbraPublicServiceHostname`` property is used for the URL itself
while the ``zimbraPublicServicePort`` property is used for the port.

Should any of the two not be set up, the system will always fall back
to the ``zimbraServiceHostname`` and ``zimbraMailPort`` or
``zimbraMailSSLPort`` server-level properties.

For Video Chats and Instant Meetings, the following rules apply:

-  |team| will work through firewalls and NATs as long as the peers can
   communicate each with the other - either directly or through a TURN
   server (which together with proper network rules is usually the
   solution to any WebRTC connection problem).

-  When no TURN server is set up, a default STUN server is used so
   clients should be able to send outbound traffic to ports 19305/19307.
   The actual P2P connection is established between the clients on a
   random unreserved port between 1 and 65535 based on the client
   configuration and network.

- The default handshake/negotiation port used by most TURN servers is
   3478 (incoming, UDP), but a different port can be used as long as
   it is properly set up> on the |team| side the port is specified
   when adding the TURN server and the clients clients will be
   instructed to connect through it. The default P2P connection range
   when using a TURN server is 49152-65535 (usually configurable on
   the TURN side) so clients should be able to send data to that port
   range to the TURN server.

   -  Most TURN servers can also be configured to use TCP insted of UDP.
      
.. _chats_administration:

|team| administration
=====================

.. verify section
   
|team| features can be enabled and disabled from the "Team" section of
Accounts and Classes of Service in the Zimbra Administration Console.

The same options are also available via the ``zxsuite config`` command
line utility:

.. csv-table::
   :header: "Feature", "Property", "Available in"

   "Enable «Advanced» features", "``teamChatEnabled``","COS, account"
   "Enable the chat history", "``historyEnabled``", "global, server,
   COS, account"
   "Enable Video Chat","``videoChatEnabled``", "global, server, COS,
   account"
   "Enable user presence", "``teamHideUserPresenceUpdates``", "global,
   server, COS, account"
   "Enable *read receipt* for sent
   messages","``teamHideMessageReads``", "global, server, COS,
   account"

.. keeping this warning commented since it will be moved to Mobile
   APPs section
   
   .. warning:: In order for mobile message delivery to work, the
      |carbonio| server must be able to communicate with the
      ``notifications.zextras.com`` service on port 443

.. keeping section commented since it will be moved to Mobile
   APPs section
   .. _chats_notifications_on_android_devices:

   Notifications on Android Devices
   --------------------------------

   Several Android devices manufacturers have strict default settings on
   which apps can display notifications, sometimes causing the
   |team| App not to be able to notify new messages.

   To make sure that your device allows all required notifications, follow
   these steps:

   .. card::

      1. Log out from the app;

      2. Access the device’s Settings, then enter the "Apps &
         Notifications"\ :sup:`1` menu;

      3. Select the *Team* app from the list of all installed apps;

      4. Enter the "Notifications":sup:`1` section;

      5. Enable the notifications (first option on the top);

      6. Enable the banner notification on the "Chat", "Group" and "Spaces
         & Channels" subsections;

      7. Log back in, notifications should now work;

      .. note:: Entries marked as (:sup:`1`) might have a different
         name depending on your device’s manufacturer and UI.

.. _chats_user_interface:

User Interface
==============

.. summarise current content

   

.. chats

Chats
=====


.. spaces

Spaces
======

..   Meeting rooms

Meeting Rooms
=============

Owner
   The user who own the Meeting Room. Owner is the first Moderator of
   the room and cannot be removed.

Moderator
   User that has been flagged to manage a Meeting Room. Depending on
   the room managed, the functionality that the Moderator manages can
   change. More in general, an Moderator can add or remove
   participants, manage the waiting room approvarls, delete a planned
   meeting, mute users inside rooms.

Internal Guest
   Internal user temporary added to a Room. An example can be internal
   users invited on a room associated to a conversation where user is
   not a member, or a User invited to a Personal Room

External Guest
   An user without an account on the infrastructure that joins a
   Meeting room. At the moment the only Rooms joinable from this kind
   of users are Personal Room and Planned Meeting.

..
   .. _chats_zextras_team_cli:

   |team| CLI
   ================

   This section contains the index of all ``zxsuite team`` commands. Full
   reference can be found in the dedicated section
   :ref:`zextras_team_full_cli`.

   :ref:`addOwner <zxsuite_team_addOwner>`
   :octicon:`dash` :ref:`clusterStatus <zxsuite_team_clusterStatus>`
   :octicon:`dash` :ref:`doClearChatDB <zxsuite_team_doClearChatDB>`
   :octicon:`dash` :ref:`doConversationsMessagesCleanup <zxsuite_team_doConversationsMessagesCleanup>`
   :octicon:`dash` :ref:`doDeployTeamZimlet <zxsuite_team_doDeployTeamZimlet>`
   :octicon:`dash` :ref:`doImportChannels <zxsuite_team_doImportChannels>`
   :octicon:`dash` :ref:`doMoveAllRooms <zxsuite_team_doMoveAllRooms>`
   :octicon:`dash` :ref:`doMoveRoom <zxsuite_team_doMoveRoom>`
   :octicon:`dash` :ref:`doRestartService <zxsuite_team_doRestartService>`
   :octicon:`dash` :ref:`doRoomsCleanup <zxsuite_team_doRoomsCleanup>`
   :octicon:`dash` :ref:`doStartService <zxsuite_team_doStartService>`
   :octicon:`dash` :ref:`doStopService <zxsuite_team_doStopService>`
   :octicon:`dash` :ref:`doUsersCleanup <zxsuite_team_doUsersCleanup>`
   :octicon:`dash` :ref:`dumpSessions <zxsuite_team_dumpSessions>`
   :octicon:`dash` :ref:`flushConversationsCache <zxsuite_team_flushConversationsCache>`
   :octicon:`dash` :ref:`getServices <zxsuite_team_getServices>`
   :octicon:`dash` :ref:`iceServer add <zxsuite_team_iceServer_add>`
   :octicon:`dash` :ref:`iceServer get <zxsuite_team_iceServer_get>`
   :octicon:`dash` :ref:`iceServer remove <zxsuite_team_iceServer_remove>`
   :octicon:`dash` :ref:`monitor <zxsuite_team_monitor>`
   :octicon:`dash` :ref:`rooms <zxsuite_team_rooms>`
   :octicon:`dash` :ref:`space get <zxsuite_team_space_get>`
   :octicon:`dash` :ref:`video-server add <zxsuite_team_video-server_add>`
   :octicon:`dash` :ref:`video-server remove <zxsuite_team_video-server_remove>`
