=====================================
 |community| CLI new format proposal
=====================================

This is a proof of concept for the format of the CLI commands
featuring a few examples.

In all examples, I kept the same elements of the above asciidoc
code. The result is always right underneath the code.

.. warning:: Some code snippets may not match 100% their displayed
   version. Please bear with me, I was in a rush... :octicon:`flame`
   :octicon:`rocket` :octicon:`stopwatch`
   
..
   Current version
   ===============

   This is the current asciidoc version of command  :command:`zxsuite team addOwner`:

   .. code:: text

      [[team_addOwner]]

      ==== addOwner

      [caption=]
      ====
      zxsuite team addOwner _conversation_id_ _owner_ 
      ====

      PARAMETER LIST

      [col=2,3,2,2]
      |===
      |NAME                     |TYPE             |EXPECTED VALUES     |DEFAULT
      |*conversation_id*(M)     |String           | Group, Space, or  Channel ID   |
      |*owner*(M)               |Account Name     |                    |
      |===

      (M) == mandatory parameter, (O) == optional parameter

      .Example:
      [caption=]
      ----
      zxsuite team addOwner  aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com
      ----

      user2@example.com becomes an owner of the rooms with conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

   Examples
   ========

   .. rubric:: Example 1. This is a simple conversion.

   .. code:: rst

      .. _team-addowner:

      addOwner
      ========

      .. card::

         .. code:: bash

            zxsuite team addOwner _conversation_id_ _owner_

         .. rubric:: Parameter List

         \(M) == mandatory parameter, (O) == optional parameter

         .. csv-table:: 
            :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

            "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
            "*owner* (M)", "Account Name", " ", " "

      .. rubric:: Example

         .. code:: bash

            zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

         user2@example.com becomes an owner of the rooms with
         conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

   .. _team-addowner1:

   addOwner
   ========

   .. card::

      .. code:: bash

         zxsuite team addOwner _conversation_id_ _owner_

      .. rubric:: Parameter List

      \(M) == mandatory parameter, (O) == optional parameter

      .. csv-table:: 
         :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

         "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
         "*owner* (M)", "Account Name", " ", " "

      .. rubric:: Example

      .. code:: bash

         zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

      user2@example.com becomes an owner of the rooms with
      conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

   .. rubric:: Example 2. This is an elaborated example.

   .. code:: rst

      .. _team-addowner:

      addOwner
      ========

      .. grid::
         :gutter: 2

         .. grid-item-card::
            :columns: 6

            Syntax
            ^^^^^^
            .. code:: bash

               zxsuite team addOwner _conversation_id_ _owner_

            .. rubric:: Parameter List

            \(M) == mandatory parameter, (O) == optional parameter

            .. csv-table:: 
               :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

               "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
               "*owner* (M)", "Account Name", " ", " "

         .. grid-item-card::
            :columns: 6

             Example
             ^^^^^^^
            .. code:: bash

               zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

            user2@example.com becomes an owner of the rooms with
            conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

   .. _team-addowner2:

   addOwner (2)
   ============

   .. grid::
      :gutter: 2

      .. grid-item-card::
         :columns: 6

         Syntax.

         .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner.rst

      .. grid-item-card:: 
         :columns: 6

         Example.

         .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner_ex.rst

   .. rubric:: Example 3. Same as above but using two files


   .. code:: rst

      .. _team-addowner:

      addOwner
      ========

      .. grid::
         :gutter: 2

         .. grid-item-card::
            :columns: 6

            .. include:: /cli/ZxTeam/zxsuite_team_addOwner.rst

         .. grid-item-card:: Example
            :columns: 6

            .. include:: /cli/ZxTeam/zxsuite_team_addOwner_ex.rst

   The content of the two ``include::``\d files would be:

   .. grid::

      .. grid-item-card:: zxsuite_team_addOwner.rst

         .. code:: rst

            .. code:: bash

               zxsuite team addOwner _conversation_id_ _owner_

            .. rubric:: Parameter List

            \(M) == mandatory parameter, (O) == optional parameter

            .. csv-table:: 
               :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

               "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
               "*owner* (M)", "Account Name", " ", "

      .. grid-item-card:: zxsuite_team_addOwner_ex.rst

         .. code:: rst

            .. code:: bash

               zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

            user2@example.com becomes an owner of the rooms with
            conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

   .. rubric:: Example 4. Another elaborated example, using dropdowns.

   .. dropdown:: addOwner

      .. card::


         .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner.rst

         .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner_ex.rst

   .. dropdown:: addOwner

      .. grid::
         :gutter: 2

         .. grid-item-card::
            :columns: 6

            .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner.rst

         .. grid-item-card:: Example
            :columns: 6

            .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner_ex.rst

Proposal 1
==========

.. _zxsuite_team_addOwner:

.. card:: zxsuite_team_addOwner

   .. include:: /cli/ZxTeam/zxsuite_team_addOwner.rst

.. _zxsuite_team_clusterStatus:

.. card:: zxsuite_team_clusterStatus

   .. include:: /cli/ZxTeam/zxsuite_team_clusterStatus.rst

.. _zxsuite_team_doClearChatDB:

.. card:: zxsuite_team_doClearChatDB

   .. include:: /cli/ZxTeam/zxsuite_team_doClearChatDB.rst

.. _zxsuite_team_doConversationsMessagesCleanup:

.. card:: zxsuite_team_doConversationsMessagesCleanup

   .. include:: /cli/ZxTeam/zxsuite_team_doConversationsMessagesCleanup.rst

.. _zxsuite_team_doDeployTeamZimlet:

.. card:: zxsuite_team_doDeployTeamZimlet

   .. include:: /cli/ZxTeam/zxsuite_team_doDeployTeamZimlet.rst

.. _zxsuite_team_doImportChannels:

.. card:: zxsuite_team_doImportChannels

   .. include:: /cli/ZxTeam/zxsuite_team_doImportChannels.rst

.. _zxsuite_team_doMoveAllRooms:

.. card:: zxsuite_team_doMoveAllRooms

   .. include:: /cli/ZxTeam/zxsuite_team_doMoveAllRooms.rst

.. _zxsuite_team_doMoveRoom:

.. card:: zxsuite_team_doMoveRoom

   .. include:: /cli/ZxTeam/zxsuite_team_doMoveRoom.rst

.. _zxsuite_team_doRestartService:

.. card:: zxsuite_team_doRestartService

   .. include:: /cli/ZxTeam/zxsuite_team_doRestartService.rst

.. _zxsuite_team_doRoomsCleanup:

.. card:: zxsuite_team_doRoomsCleanup

   .. include:: /cli/ZxTeam/zxsuite_team_doRoomsCleanup.rst

.. _zxsuite_team_doStartService:

.. card:: zxsuite_team_doStartService

   .. include:: /cli/ZxTeam/zxsuite_team_doStartService.rst

.. _zxsuite_team_doStopService:

.. card:: zxsuite_team_doStopService

   .. include:: /cli/ZxTeam/zxsuite_team_doStopService.rst

.. _zxsuite_team_doUsersCleanup:

.. card:: zxsuite_team_doUsersCleanup

   .. include:: /cli/ZxTeam/zxsuite_team_doUsersCleanup.rst

.. _zxsuite_team_dumpSessions:

.. card:: zxsuite_team_dumpSessions

   .. include:: /cli/ZxTeam/zxsuite_team_dumpSessions.rst

.. _zxsuite_team_flushConversationsCache:

.. card:: zxsuite_team_flushConversationsCache

   .. include:: /cli/ZxTeam/zxsuite_team_flushConversationsCache.rst

.. _zxsuite_team_getServices:

.. card:: zxsuite_team_getServices

   .. include:: /cli/ZxTeam/zxsuite_team_getServices.rst

.. _zxsuite_team_iceServer_add:

.. card:: zxsuite_team_iceServer_add

   .. include:: /cli/ZxTeam/zxsuite_team_iceServer_add.rst

.. _zxsuite_team_iceServer_get:

.. card:: zxsuite_team_iceServer_get

   .. include:: /cli/ZxTeam/zxsuite_team_iceServer_get.rst

.. _zxsuite_team_iceServer_remove:

.. card:: zxsuite_team_iceServer_remove

   .. include:: /cli/ZxTeam/zxsuite_team_iceServer_remove.rst

.. _zxsuite_team_monitor:

.. card:: zxsuite_team_monitor

   .. include:: /cli/ZxTeam/zxsuite_team_monitor.rst

.. _zxsuite_team_rooms:

.. card:: zxsuite_team_rooms

   .. include:: /cli/ZxTeam/zxsuite_team_rooms.rst

.. _zxsuite_team_space_get:

.. card:: zxsuite_team_space_get

   .. include:: /cli/ZxTeam/zxsuite_team_space_get.rst

.. _zxsuite_team_video-server_add:

.. card:: zxsuite_team_video-server_add

   .. include:: /cli/ZxTeam/zxsuite_team_video-server_add.rst

.. _zxsuite_team_video-server_remove:

.. card:: zxsuite_team_video-server_remove

   .. include:: /cli/ZxTeam/zxsuite_team_video-server_remove.rst




Proposal 2 (with dropdowns)
===========================

.. _2zxsuite_team_addOwner:

.. dropdown:: zxsuite_team_addOwner

   .. include:: /cli/ZxTeam/zxsuite_team_addOwner.rst

.. _2zxsuite_team_clusterStatus:

.. dropdown:: zxsuite_team_clusterStatus

   .. include:: /cli/ZxTeam/zxsuite_team_clusterStatus.rst

.. _2zxsuite_team_doClearChatDB:

.. dropdown:: zxsuite_team_doClearChatDB

   .. include:: /cli/ZxTeam/zxsuite_team_doClearChatDB.rst

.. _2zxsuite_team_doConversationsMessagesCleanup:

.. dropdown:: zxsuite_team_doConversationsMessagesCleanup

   .. include:: /cli/ZxTeam/zxsuite_team_doConversationsMessagesCleanup.rst

.. _2zxsuite_team_doDeployTeamZimlet:

.. dropdown:: zxsuite_team_doDeployTeamZimlet

   .. include:: /cli/ZxTeam/zxsuite_team_doDeployTeamZimlet.rst

.. _2zxsuite_team_doImportChannels:

.. dropdown:: zxsuite_team_doImportChannels

   .. include:: /cli/ZxTeam/zxsuite_team_doImportChannels.rst

.. _2zxsuite_team_doMoveAllRooms:

.. dropdown:: zxsuite_team_doMoveAllRooms

   .. include:: /cli/ZxTeam/zxsuite_team_doMoveAllRooms.rst

.. _2zxsuite_team_doMoveRoom:

.. dropdown:: zxsuite_team_doMoveRoom

   .. include:: /cli/ZxTeam/zxsuite_team_doMoveRoom.rst

.. _2zxsuite_team_doRestartService:

.. dropdown:: zxsuite_team_doRestartService

   .. include:: /cli/ZxTeam/zxsuite_team_doRestartService.rst

.. _2zxsuite_team_doRoomsCleanup:

.. dropdown:: zxsuite_team_doRoomsCleanup

   .. include:: /cli/ZxTeam/zxsuite_team_doRoomsCleanup.rst

.. _2zxsuite_team_doStartService:

.. dropdown:: zxsuite_team_doStartService

   .. include:: /cli/ZxTeam/zxsuite_team_doStartService.rst

.. _2zxsuite_team_doStopService:

.. dropdown:: zxsuite_team_doStopService

   .. include:: /cli/ZxTeam/zxsuite_team_doStopService.rst

.. _2zxsuite_team_doUsersCleanup:

.. dropdown:: zxsuite_team_doUsersCleanup

   .. include:: /cli/ZxTeam/zxsuite_team_doUsersCleanup.rst

.. _2zxsuite_team_dumpSessions:

.. dropdown:: zxsuite_team_dumpSessions

   .. include:: /cli/ZxTeam/zxsuite_team_dumpSessions.rst

.. _2zxsuite_team_flushConversationsCache:

.. dropdown:: zxsuite_team_flushConversationsCache

   .. include:: /cli/ZxTeam/zxsuite_team_flushConversationsCache.rst

.. _2zxsuite_team_getServices:

.. dropdown:: zxsuite_team_getServices

   .. include:: /cli/ZxTeam/zxsuite_team_getServices.rst

.. _2zxsuite_team_iceServer_add:

.. dropdown:: zxsuite_team_iceServer_add

   .. include:: /cli/ZxTeam/zxsuite_team_iceServer_add.rst

.. _2zxsuite_team_iceServer_get:

.. dropdown:: zxsuite_team_iceServer_get

   .. include:: /cli/ZxTeam/zxsuite_team_iceServer_get.rst

.. _2zxsuite_team_iceServer_remove:

.. dropdown:: zxsuite_team_iceServer_remove

   .. include:: /cli/ZxTeam/zxsuite_team_iceServer_remove.rst

.. _2zxsuite_team_monitor:

.. dropdown:: zxsuite_team_monitor

   .. include:: /cli/ZxTeam/zxsuite_team_monitor.rst

.. _2zxsuite_team_rooms:

.. dropdown:: zxsuite_team_rooms

   .. include:: /cli/ZxTeam/zxsuite_team_rooms.rst

.. _2zxsuite_team_space_get:

.. dropdown:: zxsuite_team_space_get

   .. include:: /cli/ZxTeam/zxsuite_team_space_get.rst

.. _2zxsuite_team_video-server_add:

.. dropdown:: zxsuite_team_video-server_add

   .. include:: /cli/ZxTeam/zxsuite_team_video-server_add.rst

.. _2zxsuite_team_video-server_remove:

.. dropdown:: zxsuite_team_video-server_remove

   .. include:: /cli/ZxTeam/zxsuite_team_video-server_remove.rst


Conclusions
===========

Splitting content of a single CLI file in two as shown above would be useful for at
least two reasons:

#. reduce burden for extracting help from the commands' source code
   and producing rst to be included in the doc
#. avoid problems with sectioning
#. give doc team more flexibility in organising and reusing the
   content of the help files




