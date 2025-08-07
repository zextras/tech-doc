The token is encrypted and stored in file
:file:`/etc/zextras/service-discover/cluster-credentials.tar.gpg` and
can be retrieved with this command, which will output the token on the CLI

.. code:: console

   # gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r

For simplicity you can put the token in a local variable as follows

.. code:: console

   # export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)

You can then check the password with command

.. code:: console

   # echo $CONSUL_HTTP_TOKEN

The password will remain in memory until you exit the CLI session, but
you can explicitly delete it using command

.. code:: console

   # unset CONSUL_HTTP_TOKEN
