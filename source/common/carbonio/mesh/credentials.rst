.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mesh-credentials:

|mesh| Credentials
==================

The credentials used by |mesh| are stored in file
:file:`/etc/zextras/service-discover/cluster-credentials.tar.gpg`,
which is a *tar* archive that has been encrypted with GPG. The *tar*
archive contains:

* The bootstrap token
* The |mesh| internal :abbr:`CA (Certificate Authority)` and its
  corresponding private key
* The encryption keys

.. warning:: If the file
   :file:`/etc/zextras/service-discover/cluster-credentials.tar.gpg`
   becomes compromised, the security of the whole infrastructure will
   be compromised as well.

The file with the |mesh| credentials must be present and accessible
during various administration activities: |product| setup and upgrade,
when running :command:`pending-setups`, and while carrying out other
minor tasks that involve |product| components.

The file mentioned above is GPG-encrypted using a **secret** (which is
nothing more than another password), that is stored in
:file:`/var/lib/service-discover/password` and is accessible only by
the ``root`` user. The **secret** is needed when running the
:command:`pending-setups` command and during the Service Discover
installation wizard.

Hence, if you do not remember the password, log in as ``root`` to your
Single-Server |product|, while if you are on a Multi-Server, log in to
any |mesh| *Server*, then read the
:file:`/var/lib/service-discover/password` file.

In case you want to change the secret, or you *need* to change it (for
example because it has been compromised, shared with or sent to the
wrong persons, or if one of the system administrators has left your
company), it is necessary to :ref:`mesh-reset`.

.. _mesh-reset:

Regenerate |mesh| Secret
------------------------

In case the secret needs to be changed, there is one important
information to know beforehand: the *reset index* value, which is
always an **integer**.

.. card::

   Retrieve the reset index
   ^^^^

   Simply execute the command

   .. code:: console

      # consul acl bootstrap

   The output will always be similar to::

     Failed ACL bootstrapping: Unexpected response code: 403 (Permission denied: ACL bootstrap no longer allowed (reset index: 908))

   The *reset index value** is the last bit of the output *(reset
   index: 908)*: in our case **908**, which is the current index and
   is needed in the procedure below.


Before attempting the recover, be prepared for a downtime of the
|mesh| service for the whole duration of the procedure.

The procedure is the same for Single-Server and Multi-Server, but on
the Multi-Server there are more steps to carry out.

.. card::

   Preliminary Tasks
   ^^^^

   In case of a Single-Server node, log in to it and skip to Step 1
   below.

   On a Multi-Server, you need to identify the |mesh| *leader node*
   node and log into it. If you followed the
   :ref:`multiserver-installation`, this is the `Directory-Server`
   node, whose IP address is retrieved using the command below.

   .. code:: console

      # carbonio prov gas service-discover

   To make sure you are on the leader node, use the following command.

   .. code:: console

      # wget http://127.0.0.1:8500/v1/status/leader -qO -

   The output will be an IP address and a port, for example
   **192.168.56.101:8300**. If this IP is different from the
   `Directory Server`'s, log in to the latter on (192.168.56.101). We
   will denote this IP with |leaderip|.

   .. note:: Even if you have installed multiple |mesh| Servers, *only
      one* is the leader.
      
.. card::

   Step 1. Wipe Old Credentials
   ^^^^

   The first task, to be executed as the ``service-discover`` user on
   the *leader node*, is to write the current **reset index** to a file,
   to allow a new ACL token to be generated. As described in the
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

.. card::

   Step 2. Generate New Credentials
   ^^^^

   Run the setup as a *first instance*.

   .. code:: console

      # service-discover setup LEADER_IP --first-instance --password=MESH_SECRET

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

   Multi-Server Tasks
   ^^^^

   On a Multi-Server, you need to carry out all the steps below on
   **each of the other nodes**.
   
   Login to one node, then copy the credentials from the |leaderip|.

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

   Finally, run the |mesh| setup.
   
   .. code:: console

      # service-discover setup $(hostname -i) --password=MESH_SECRET
