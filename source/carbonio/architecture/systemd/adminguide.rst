``Systemd`` Usage Guide For Administrators
==========================================

With ``systemd``, managing Carbonio services becomes more intuitive
and powerful. These are the most common commands.

**Start All Services**

.. code-block:: bash

   # systemctl start carbonio-directory-server.target carbonio-appserver.target carbonio-proxy.target carbonio-mta.target

**Stop All Services**

.. code-block:: bash

   # systemctl stop carbonio-directory-server.target carbonio-appserver.target carbonio-proxy.target carbonio-mta.target

**Disable a Target (prevents autostart)**

.. code-block:: bash

   # systemctl disable carbonio-appserver.target

**Monitor a Target or Service**

.. code-block:: bash

   # systemctl status carbonio-proxy.target
   
.. code-block:: bash
  
   # journalctl -u carbonio-nginx.service

**Enable Target at Boot**

.. code-block:: bash

   # systemctl enable carbonio-directory-server.target

**Inspect Dependencies**

.. code-block:: bash

   # systemctl list-dependencies carbonio-mta.target
   # systemctl show carbonio-mta.target

**Visualize Boot Sequence**

.. code-block:: bash

   # systemd-analyze plot > boot.svg
   # systemd-analyze critical-chain carbonio-directory-server.target
