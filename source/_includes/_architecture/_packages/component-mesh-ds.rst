.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages carbonio-user-management

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages carbonio-user-management

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages carbonio-user-management

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages carbonio-user-management

Please note:

* Unlike other client-server software (like e.g., PostgreSQL), the
  ``service-discover`` software on which |product| is based does not
  require the agent to be installed along the server, therefore the
  ``service-discover-agent`` package is needed only in the other
  Nodes

* Within a |product| Multi-Server installation, it is possible to
  install multiple |mesh| **servers**, provided they are in **odd**
  numbers, e.g., 1, 3, 5 (or even more), because they can always find
  a *quorum* and avoid deadlocks

* The ``carbonio-message-broker`` package is unique within a |product|
  infrastructure
