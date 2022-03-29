.. _mesh-external-services:

Integration of External Services
--------------------------------

Within an enterprise infrastructure, part of the infrastructure can be
either outsourced, hosted in a branch office in a different city or
country, or even supplied by a third party service provider. Typical
examples include a central data center in the company's HQ or the use
of services by a third-party provider.

|mesh| proves useful in these situations, allowing to securely connect
a |product| installation to external services.

Scenario and Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~

The remainder of this section illustrates how to configure |mesh| in a
scenario involving a Multi-Server installation on which we will
install two |file| nodes and allow them to access an external service
hosting the PostgreSQL database on which |file| rely. Additionally,
one node is elected as a **terminating gateway**, i.e., the local
gateway that cluster services need to contact to access an external
resource, which in our scenario is the database.

The setup requires to access the command line on the gateway to
configure it, because the process requires manual file editing and
running commands. No setup or configuration is necessary on the |file|
nodes, as they will reach the database exclusively through the
terminating gateway.

.. note:: All commands must be executed on the node elected as
   **terminating gateway**, unless stated differently.

Before reading further, make sure that |mesh| is correctly installed
(see :ref:`mesh_single_install` or
:ref:`mesh_multi_install`). Moreover, although it is not required, we
highly suggest to use the |mesh| Administration Interface to better
keep track of the configuration and changes. Please check
:ref:`mesh-gui` for directions on how to configure and reach it.

Finally, keep the **cluster credential password** at hand, because it
is required for token generation.

Let's now start with the procedure, in which we first set up |mesh|,
then install |file|.

Security and Setup
~~~~~~~~~~~~~~~~~~

The initial setup requires to complete a few steps.

#. Create a dedicated **user**

   .. code:: console

      # groupadd -r 'carbonio-gateway'
      # useradd -r -M -g 'carbonio-gateway' -s /sbin/nologin 'carbonio-gateway'

#. Define **policies**. It is necessary to make |mesh| aware of the
   services to be routed, which in our scenario is the database for
   |file|, :bdg:`carbonio-files-db`.

   First, create a directory that will store all the configuration.

   .. code:: console

      # mkdir -p /etc/carbonio/gateway/service-discover/

   Then edit file
   :file:`/etc/carbonio/gateway/service-discover/policies.json` and
   paste in it this content.

   .. code:: json

      {
        "key_prefix": [
          {
            "carbonio-gateway/": {
              "policy": "read"
            }
          }
        ],
        "node_prefix": [
          {
            "": {
              "policy": "read"
            }
          }
        ],
        "service": [
          {
            "carbonio-gateway": {
              "policy": "write"
            },
            "carbonio-files-db": {
              "policy": "write"
            }
          }
        ]
      }

   Finally, let ``consul`` pick up the new policy.

   .. code:: console

      # consul acl policy create -name "carbonio-gateway-policy" -description "Policy for carbonio-gateway" -rules  @/etc/carbonio/gateway/service-discover/policies.json

#. Export a new **bootstrap token**, which is the one that allows to
   execute ``consul`` commands and access its APIs. To extract the
   bootstrap token, execute the following command and then type the
   **cluster credential password**.

   .. code:: console

      # export CONSUL_HTTP_TOKEN=$(service-discover bootstrap-token --setup)

#. Generate a new **token**, which is associated to the policy and
   will be the only one needed to communicate with the external
   database.

   .. code:: console

      # consul acl token create -format json -policy-name carbonio-gateway-policy -description "Token for carbonio-gateway" | jq -r '.SecretID' > /etc/carbonio/gateway/service-discover/token

      # chown carbonio-gateway:carbonio-gateway -R /etc/carbonio/gateway

Definition of the External service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To operate properly, the gateway must be aware of the exact location
of the remote service, therefore we define both the external service
and how the terminating gateway can reach it and allow |file| nodes
access to it.

There is yet no CLI command for this, but we can use the APIs for this
purpose. Create file
:file:`/etc/carbonio/gateway/service-discover/carbonio-files-db-external.json`
with content

.. code:: json

   {
     "Address": "external-database.example.com",
     "Node": "external-files-db-node",
     "NodeMeta": {
       "external-node": "true",
       "external-probe": "true"
     },
     "Service": {
       "ID": "carbonio-gateway",
       "Port": 5432,
       "Service": "carbonio-files-db"
     }
   }

.. note:: Replace the value of **Address** with the actual URL of the
   external service.

Then, execute a ``curl`` request to register the external service.

.. code:: console

   # curl --request PUT --header "X-Consul-Token: ${CONSUL_HTTP_TOKEN}" --data @carbonio-files-db-external.json http://localhost:8500/v1/catalog/register

Services Routing
~~~~~~~~~~~~~~~~

Now that the terminating gateway and the service have been defined and
registered, it is time to let |mesh| know the list of the services
that can use the gateway.

To do so, place in file
:file:`/etc/carbonio/gateway/service-discover/gateway-config.hcl` the
following content, which defines a carbonio-gateway as a terminating
gateway for the ``carbonio-files-db`` service.

.. code:: yaml

   Kind = "terminating-gateway"
   Name = "carbonio-gateway"
   Services = [
    {
      Name = "carbonio-files-db"
      #CAFile = "/etc/carbonio/external-db-ca.pem"
      #SNI = "external-db.local"
    }
   ]

.. hint:: In case more services use the same gateway, you can append
   them to the file.

There are two commented entries in the file: they are optional and may
not be specified at all in the configuration.

**CAFile**
   A specific SSL certificate for the service. This is usually not
   necessary, unless some very specific and complex scenario is set
   up. Indeed, it is ``consul`` that take charge of encrypting all the
   traffic among the nodes and with the external resources: services
   and clients contact ``consul`` on **localhost**, so it is safe that
   they talk in plain text with it. Data received from ``consul`` on
   localhost are immediately SSL-encrypted, before leaving the node.

**SNI**
   The Server Name Indication is an additional layer of security on
   top of TLS, used to prevent name mismatch. In the common case that
   a single web server hosts many domains each with its own SSL
   certificate, whenever a client request is received, it may not be
   yet known by the web server which is the exact domain the client is
   trying to access, because the HTTPS TSL/SSL handshake takes place
   before the client send the actual HTTP request for the domain. This
   may cause the client to receive the wrong certificate and possibly
   terminate the secure connection. Using a SNI avoids this problem,
   because it allows to send the domain name right in the SSL/TSL
   handshake.

Make sure to write the configuration, by issuing the following
command.

.. code:: console

   # consul config write /etc/carbonio/gateway/service-discover/gateway-config.hcl

At this point, we are almost done: configuration of |mesh| has now
been completed. Let's now go through the last few tasks.

Systemd Service
~~~~~~~~~~~~~~~

Now, create a ``systemd`` unit to control whether the carbonio gateway
is enabled or not and therefore whether access to the external DB is
allowed. Create file
:file:`/lib/systemd/system/carbonio-gateway.service` and configure it
with these content.

.. code:: Ini

   [Unit]
   Description=Carbonio gateway for external services
   Documentation=https://docs.zextras.com/
   Requires=network-online.target
   After=network-online.target

   [Service]
   Type=simple
   ExecStart=/usr/bin/consul connect envoy \
       -token-file /etc/carbonio/gateway/service-discover/token \
       -admin-bind localhost:0 \
       -gateway=terminating \
       -register -service carbonio-gateway
   Restart=on-failure
   RestartSec=15
   User=carbonio-gateway
   KillMode=process
   KillSignal=SIGKILL
   LimitNOFILE=65536
   TimeoutSec=120
   TimeoutStopSec=120

   [Install]
   WantedBy=multi-user.target

.. hint:: You can modify the ``ExecStart`` option by adding ``-- -l
   debug`` at the end to produce more verbose logs. The option should
   then look like::

     ExecStart=/usr/bin/consul connect envoy \
       -token-file /etc/carbonio/gateway/service-discover/token \
       -admin-bind localhost:0 \
       -gateway=terminating \
       -register -service carbonio-gateway -- -l debug

Once saved the file, reload ``systemd`` to make it aware of the new unit file, then
enable the new ``carbonio-gateway`` service.

.. code:: console

   # systemctl daemon-reload
   # systemctl enable carbonio-gateway

Configuration of carbonio-files-db
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: This step only applies when like in our scenario, the
   external resource is a database.

The configuration of the database, which includes transferring the DB
credentials to |mesh| and create the DB's, is usually done by the
:command:`carbonio-files-db-bootstrap` script. However, since the
*carbonio-files-db* package is not installed, this task must be done
manually using these commands.

.. code:: console

   # consul kv put carbonio-files/db-name <database-name>
   # consul kv put carbonio-files/db-username <username>
   # consul kv put carbonio-files/db-password <password>

On the external node on which the database is installed, create a
``postgres`` superuser with password **ScrtPsw987^2** (use a password
of your choice).

.. code:: bash

   # sudo -u postgres psql
   # CREATE ROLE "carbonio-files-adm" WITH LOGIN SUPERUSER encrypted password 'ScrtPsw987^2';CREATE DATABASE "carbonio-files-adm" owner "carbonio-files-adm";
   # \q

|file| Nodes Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~

The installation of |File| is slightly different from the standard
one. In particular, make sure that after the installation, the package
:bdg:`carbonio-files-db` is **not** installed on any node. In our
scenario, indeed, the database functionalities are not provided by
that package, but by the external service. Hence, to avoid conflicts,
you need to uninstall it.

* Install package ``carbonio-files-ui`` on each *Proxy Node*.

  .. code:: bash

     # apt install carbonio-files-ui

* Install these packages on both Nodes on which |file| should run. We
  suggest to install them on the two *Stores Nodes*.

   .. code:: bash

      # apt install carbonio-storages-ce carbonio-files-ce carbonio-user-management

   The installation will end with message::

     ======================================================
     Carbonio Files installed successfully!
     You must run pending-setups to configure it correctly.
     ======================================================

   Hence, execute :command:`pending-setups`

   .. code:: bash

      # pending-setups

Remove Services From Catalog
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When the external resource is not needed anymore, for example because
the database is brought in the company's data center, it is
straightforward to remove the configuration of the services.

* Stop the systemd unit service and delete the configuration
  file

  .. code:: console

     # systemd stop carbonio-gateway
     # systemd disable carbonio-gateway
     # rm /lib/systemd/system/carbonio-gateway.service

* Remove the gateway configuration.

  .. code:: console

     # consul config delete -kind terminating-gateway -name carbonio-gateway
     # curl --request PUT --header "X-Consul-Token: ${CONSUL_HTTP_TOKEN}" http://localhost:8500/v1/agent/service/deregister/carbonio-gateway
     # curl --request PUT --header "X-Consul-Token: ${CONSUL_HTTP_TOKEN}" http://localhost:8500/v1/agent/service/deregister/carbonio-files-db

Now you can install the *carbonio-files-db* package on any node and it
will be immediately available to the |file| nodes.
