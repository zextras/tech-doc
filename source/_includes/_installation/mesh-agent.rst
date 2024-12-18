|mesh| will install as an **agent**, that connects and communicates
with the server. The configuration for the agent is created by
launching command

.. code:: console

   # service-discover setup-wizard

This command will:

* ask for the IP address and netmask of the current Node

* ask for the |mesh| :ref:`secret <mesh-credentials>`, which is stored
  in file :file:`/var/lib/service-discover/password` on the *Directory
  Leader* Node (i.e., the node on which the Mesh server is installed)

  In case the password is lost or the credential file becomes
  corrupted and unusable, you can reset them using the procedure
  detailed in section :ref:`mesh-credentials`.

