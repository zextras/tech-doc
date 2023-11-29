
To complete the procedure, repeat these tasks on **each of the other
Nodes**.

Login to one node, then copy the credentials from the *leader Node*.

.. code:: console

   # scp root@[LEADER_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
   /etc/zextras/service-discover/cluster-credentials.tar.gpg

Stop the *service-discover* service.

.. code:: console

   # systemctl stop service-discover

Remove the following two files:

.. code:: console

   # rm /etc/zextras/service-discover/config.json
   # rm /etc/zextras/service-discover/main.json


Remove also all certificates related to *service-discover*.

.. code:: console

   # rm /var/lib/service-discover/*.pem

Finally, run the |mesh| setup: take the ``MESH_SECRET`` password
defined on the leader node and put it in a variable

.. code:: console

   # read -s -p "Password:" MESH_SECRET

Run the setup

.. code:: console

   # service-discover setup $(hostname -i) --password=$MESH_SECRET

If the command succeeds, you can manually unset the password

.. code:: console

   # unset MESH_SECRET
