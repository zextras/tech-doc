.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mesh-reset:

Regenerate |mesh| Credentials
=============================

Whenever a problem arises in the |mesh| ACL system and the
service-discover stops working, it is necessary to regenerate the
credentials to be able to continue using |mesh|.

.. card::

   Scenario
   ^^^^

   In this sample scenario, the command :command:`consul acl
   bootstrap` will terminate with an error message similar to::

     Failed ACL bootstrapping: Unexpected response code: 403 (Permission denied: ACL bootstrap no longer allowed (reset index: 908))

   This can happen, for example, when the **cluster credential
   password** of file
   :file:`/etc/zextras/service-discover/cluster-credentials.tar.gpg`
   is unaccessible (for example, because the password has been lost),
   but the procedure below may apply whenever the above-mentioned
   error message appears.

   It is important to take note of the index number, that is the last
   bit of the output *(reset index: 908)*: ``908`` is the current
   index and is needed in the procedure below.


Before attempting the recover, be prepared for a downtime of the
|mesh| service for the whole duration of the procedure.

The procedure is the same for Single-Server and Multi-Server, but on
the Multi-Server there are a few more steps to carry out.

.. card::

   Preliminary Tasks
   ^^^^

   In case of a Single-Server node, log in to it and skip to the next
   step.

   On a Multi-Server, you need to identify the |mesh| *leader node*
   node and log into it. Most of the times, this is the
   `Directory-Server` node, whose IP address is retrieved using the
   command below.

   .. code:: console

      # zmprov gas service-discover

   To make sure you are on the leader, use the following command.

   .. code:: console

      # wget http://127.0.0.1:8500/v1/status/leader -qO -

   The output will be an IP address and a port, for example
   **192.168.56.101:8300**. If this IP is different from the
   `Directory Server`'s, log in to the latter on (192.168.56.101).

   .. note:: All the commands must be run on the *leader node*, unless
      differently specified.

.. card::

   Step 1. Wipe Old Credentials
   ^^^^

   The first task, to be executed as the ``service-discover`` user, is
   to write the current **reset index** to a file, to allow a new ACL
   token to be generated. As described in the Scenario above, the
   value is **908** (change it according to the output you receive), so we need to execute:

   .. code:: console

      # sudo -u service-discover bash -c "echo 908 > /var/lib/service-discover/data/acl-bootstrap-reset"

   Then stop the *service discover* service.

   .. code:: console

      # systemctl stop service-discover


   Finally, remove all certificates related to  *service discover*.

   .. code:: console

      # rm /var/lib/service-discover/*.pem

.. card::

   Step 2. Generate New Credentials
   ^^^^

   Run the setup as a *first instance*.

   .. code:: console

      # service-discover setup 192.168.56.101 --first-instance --password=MESH_CLUSTER_PWD

   This is essentially the same command as the one used during the
   configuration of |mesh|, the only difference being that in this
   case we use the explicit IP address and run it as *first instance*.

   Optionally, verify the ACL token using the commands

   .. code:: console

      # export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)
      # consul members
        Node              Address              Status  Type    Build  Protocol  DC   Segment
        mail.example.com  192.168.56.101:8301  alive   server  1.9.3  2

   On a Single-Server the procedure has been completed. Make sure to
   store the new credentials in a safe place!

.. card::

   Multi-Server Final Task
   ^^^^

   On a Multi-Server, you need to copy the credentials file on all
   other nodes, for example using :command:`scp`. The commands to be
   used are mentioned in every node of the
   :ref:`multiserver-installation`.

   Finally, log in to all other nodes and repeat on *each of them* the
   setup using the following commands

   .. code:: console

      # rm /var/lib/service-discover/*pem
      # service-discover setup $(hostname -i) --password=MESH_CLUSTER_PWD
