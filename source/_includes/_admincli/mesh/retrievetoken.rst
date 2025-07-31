
Whenever you want to use Consul, the first operation is to retrieve
the *bootstrap-token*, to allow connection and interaction with the
service.

.. code:: console

   # service-discover bootstrap-token

.. hint:: You need to provide the cluster credential password, which
   is stored in :file:`/var/lib/service-discover/password`.

Export the token, which is a string similar to *e5a4966f-a83e-689d-618d-08a0fe7e695b*

.. code:: console

   # export CONSUL_HTTP_TOKEN=e5a4966f-a83e-689d-618d-08a0fe7e695b

You can automate the export process by using the following one-liner

.. code:: console

   # export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)
