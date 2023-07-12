|mesh| will install as an **agent**, that connects and communicates
with the server. The configuration for the agent is created by
launching command

.. code:: console

   # service-discover setup-wizard

This command will:

* ask for the IP address and netmask of the current Node

* ask for the |mesh| :ref:`secret <mesh-credentials>`, which is stored
  in file :file:`/var/lib/service-discover/password` on SRV1

After the configuration has completed successfully, run the following
command, again using the *secret*.

.. code:: console

   # pending-setups -a

