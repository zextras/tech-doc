
.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages
 
   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages
 
   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages

Please note:

* Unlike other client-server software (like e.g., PostgreSQL), the
  ``service-discover`` software on which |product| is based does not
  require the agent to be installed along the server, therefore the
  ``service-discover-agent`` package is needed only in the other
  nodes

* The ``carbonio-message-broker`` package is unique within a |product|
  infrastructure
