=======================
 Rejoin |mesh| Cluster
=======================

When a member of a |mesh| cluster stays offline for a longer time than
the value of ``server_rejoin_age_max``, it will be unable to rejoin the cluster
cluster and the following error appears in syslog::

  refusing to rejoin cluster because server has been offline for more than the configured server_rejoin_age_max

.. hint:: You can use the command :command:`journalctl -u
   service-discover.service -f` to check the log and see new log
   message as they are produced, in real time.

A typical scenario for this error is when the Node, on which the
member is installed, is restored from an old snapshot.

A viable solution is quite easy and requires a few commands from
the CLI.

First, delete the following file.

.. code:: console

   # rm /var/lib/service-discover/data/server_metadata.json

Then restart the ``service-discover`` daemon

.. code:: console

   # systemctl restart service-discovery
   
If the command is successful, this message appears in syslog::

  Join cluster completed.
  
To make sure that the |mesh|  agent is synchronised with the other
members, issue the following commands.

.. code:: console

   # consul members
   
.. code:: console

   # consul catalog services 
