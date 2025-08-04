When a |Mesh| cluster falls and the election quorum is not met, you
may find a situation where no leader node exists and the following
error appears in the :file:`syslog` log file::

  No cluster leader


In a case like this, it is possible to forcefully elect a node as the
new leader and restore the cluster's functionality following this
procedure.

First, choose one of the |mesh| cluster's nodes that you want to be
the new leader. We call this node **newleader** in the remainder of
this procedure.

On all |mesh| nodes, except for *newleader*, stop the
:command:`service-discover` service

.. code:: console

   # systemctl status service-discover.service


On *newleader*, make a backup of :file:`peers.json` file:

.. code:: console

   # cp /var/lib/service-discover/data/raft/peers.json /root/peers.json.bak

Then, retrieve the ``id`` of the consul server

.. code:: console

   # cat /var/lib/service-discover/data/node-id

The output will be a string like::

  61f22310-97de-0965-4958-321840df66b6


Use this string to create a new
:file:`/var/lib/service-discover/data/raft/peers.json` with the
following content::

  {
    "id": "<consul_server_node_id>",
    "address": "<mesh_newleader_IP:8300",
    "non_voter": false
  }

.. note:: It is important that the ``non_voter`` attribute be set to
   ``false``.

The new file will therefore be similar to this::

   {
       "id": "61f22310-97de-0965-4958-321840df66b6",
       "address": "10.22.247.11:8300",
       "non_voter": false
   }

.. hint:: You can find further information about the format of file
   :file:`peers.json` inside file
   :file:`/var/lib/service-discover/data/raft/peers.info`.

Ensure the file has proper ownership:

.. code:: console

   # chown service-discover:service-discover /var/lib/service-discover/data/raft/peers.json

Now, on *newleader*, start the :command:`service-discover.service`,
then execute command

.. code:: console

   # consul members

The output will include the FQDN of *newleader* as the leader and only
member of the cluster. The same result can be seen from the
:ref:`mesh-gui`. This is correct, since the
:command:`service-discover` service has been stopped on all |mesh|
nodes at the beginning of the procedure.

To complete the procedure, and bring back the cluster to its full
efficiency, start the :command:`service-discover` service on the other
cluster nodes.

Once done, you can check on each |mesh| node that all cluster nodes
are alive.
