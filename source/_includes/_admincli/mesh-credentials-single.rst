
Please take into account that the |mesh| service will be **offline**
for the whole duration of the procedure.

.. The procedure is the same for Single-Server and Multi-Server, but on
   the Multi-Server there are more steps to carry out.

Before starting the procedure, we need to know important
information. Log in to the Single-Server and execute command

.. include:: /_includes/_admincli/mesh-credentials-index.rst
            
Wipe Old Credentials
~~~~~~~~~~~~~~~~~~~~

The first task, to be executed as the ``service-discover`` user, is
to write the current **reset index** to a file, to allow a new ACL
token to be generated. As described in the scenario above, the
value is **908** (change it according to the output you receive),
so we need to execute

.. code:: console

   # sudo -u service-discover bash -c "echo 908 > /var/lib/service-discover/data/acl-bootstrap-reset"

Then stop the *service-discover* service

.. code:: console

   # systemctl stop service-discover

Remove the following two files

.. code:: console

   # rm /etc/zextras/service-discover/config.json
   # rm /etc/zextras/service-discover/main.json

Finally, remove all certificates related to *service-discover*

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
