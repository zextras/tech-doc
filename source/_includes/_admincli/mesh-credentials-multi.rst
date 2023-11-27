.. card:: Find Leader Node's IP Address
   
   You need to identify the |mesh| *leader node* node and log into
   it. While this is usually the Node on which the Directory Server is
   installed, the actual leader might be different. to find the
   correct IP,  log in to a Directory Server node and issue the
   command as the ``zextras`` user

   .. code:: console

      zextras$ carbonio prov gas service-discover

   This will output all |mesh| servers: to make sure you are on the
   leader node, use the following command.

   .. code:: console

      # wget http://127.0.0.1:8500/v1/status/leader -qO -

   The output will be an IP address and a port, for example
   **172.16.0.12:8300**. If this IP is different from the
   `Directory Server`'s, log in to the latter on 172.16.0.12. 

   .. note:: Even if you have installed multiple |mesh| Servers, *only
      one* is the leader.

Wipe Old Credentials
~~~~~~~~~~~~~~~~~~~~

The first task, to be executed as the ``service-discover`` user on
the *leader node*, is to write the current **reset index** to a
file, to allow a new ACL token to be generated. As described in the
Scenario above, the value is **908** (change it according to the
output you receive), so we need to execute:

.. code:: console

   # sudo -u service-discover bash -c "echo 908 > /var/lib/service-discover/data/acl-bootstrap-reset"

Then stop the *service-discover* service.

.. code:: console

   # systemctl stop service-discover

Remove the following two files:

.. code:: console

   # rm /etc/zextras/service-discover/config.json
   # rm /etc/zextras/service-discover/main.json


Finally, remove all certificates related to  *service-discover*.

.. code:: console

   # rm /var/lib/service-discover/*.pem

Generate New Credentials
~~~~~~~~~~~~~~~~~~~~~~~~

The first task to be done is to define a new, robust password,
which we put in a temporary variable, for improved
security. Remember to store the password in a safe place, in case
you need it in the future.

.. code:: console

   # read -s -p "Password:" MESH_SECRET

.. note:: The password is accessible to the user (``root``) **in
   the current terminal only**. No one else can access it and it
   will be deleted upon logging out.

Run the setup as a *first instance*.

.. code:: console

   # service-discover setup LEADER_IP --first-instance --password=$MESH_SECRET

This is essentially the same command as the one used during the
configuration of |mesh|, the only difference being that in this
case we use the explicit IP address and run it as *first instance*.

If the command succeeds, you can manually unset the password

.. code:: console

   # unset MESH_SECRET

Optionally, verify the ACL token using the commands

.. code:: console

   # export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)
   # consul members
     Node              Address              Status  Type    Build  Protocol  DC   Segment
     mail.example.com  192.168.56.101:8301  alive   server  1.9.3  2

Copy New Credentials to Other Nodes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
