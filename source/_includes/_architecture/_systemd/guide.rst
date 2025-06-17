
In Carbonio, services are now managed using ``systemd``, which replaces the old ``zmcontrol`` command.  
These are the most common commands:

**To start all the main Carbonio services on a node** (like directory, mail, proxy, etc.) at once, you can use:

.. code-block:: bash

   # systemctl start carbonio.target 

This is similar to what ``zmcontrol start`` did before.  
It brings up all core Carbonio components on that machine in the right order.

**To stop all the main Carbonio services on a node** (like directory, proxy, web, etc.) at once, you can use:

.. code-block:: bash

   # systemctl stop carbonio.target

This is similar to what ``zmcontrol stop`` did before.  
It brings down all core Carbonio components on that machine in the right order.

**Enable Target at Boot**

.. code-block:: bash

   # systemctl enable carbonio-directory-server.target

**Disable a Target (prevents autostart)**

.. code-block:: bash

   # systemctl disable carbonio-appserver.target

**Monitor a Target or Service**

.. code-block:: bash

   # systemctl status carbonio-proxy.target
   
.. code-block:: bash
  
   # journalctl -u carbonio-nginx.service

**Inspect Dependencies**

.. code-block:: bash

   # systemctl list-dependencies carbonio-mta.target
   # systemctl show carbonio-mta.target

**Manage other services**

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



