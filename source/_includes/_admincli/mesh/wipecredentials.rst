
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
