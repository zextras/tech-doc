In |product|, services are managed using ``systemd``, which replaces
the old ``zmcontrol`` command. In this page we present some of the
most common :command:`systemctl` commands, the interface to ``systemd``

.. rubric:: Verify the status of all services

.. code:: console

   # systemctl list-units "carbonio*"

.. rubric:: List of all |product| unit files

.. code:: console

   # systemctl list-unit-files "carbonio*"

.. rubric:: To start all the main |product| services on a node

.. code-block:: bash

   # systemctl start carbonio.target

This command is similar to the discontinued ``zmcontrol start``
command: it brings up all |product| Components on that Node (like
Directory Server, Proxy, MTA, and so on.)  in the correct order.

.. rubric:: To stop all the main |product| services on a node

.. code-block:: bash

   # systemctl stop carbonio.target

This command is similar to the discontinued ``zmcontrol stop``
command: it brings down all core |product| Components on that Node in
the correct order.

.. rubric:: Enable Target at Boot

.. code-block:: bash

   # systemctl enable carbonio-directory-server.target

.. rubric:: Disable a Target (prevents autostart)

.. code-block:: bash

   # systemctl disable carbonio-appserver.target

.. rubric:: Monitor a Target or Service

.. code-block:: bash

   # systemctl status carbonio-proxy.target

.. code-block:: bash

   # journalctl -u carbonio-nginx.service

.. rubric:: Inspect Dependencies

.. code-block:: bash

   # systemctl list-dependencies carbonio-mta.target
   # systemctl show carbonio-mta.target

.. rubric:: Manage other services

Some additional services (like preview generation, real-time documentation editing, chats, etc.)
are already systemd-native and can be started or stopped individually, like this:

.. code-block:: bash

   # systemctl start carbonio-preview.service
   # systemctl stop carbonio-preview.service

   # systemctl start carbonio-docs-editor.service
   # systemctl stop carbonio-docs-editor.service

   # systemctl start carbonio-ws-collaboration.service
   # systemctl stop carbonio-ws-collaboration.service

   ..
