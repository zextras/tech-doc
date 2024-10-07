.. _role-wsc-install:

|wsc|
=====

The |wsc| Role adds the chat functionality to |product|.

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-wsc-ce.rst


Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst


Migrate dispatcher
-------------------

Initialise the message dispatcher

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
     carbonio_adm 127.78.0.10 20000

Restart the service

.. code:: console

   # systemctl restart carbonio-message-dispatcher


Enable the |wsc| UI
-------------------

The |wsc| role is disabled by default, you can enable it either from
the |adminui| or from the command line by running as the ``zextras``
user the command

.. code:: console

   zextras$ carbonio prov mc default carbonioFeatureChatsEnabled TRUE

This command enables the chat for the ``default`` COS, but you can
enable it only on selected COSes.

Restart the service

.. code:: console

   # systemctl restart carbonio-ws-collaboration

Status Check
------------

After the installation, you can check the status of |wsc| and all its
dependencies by running command

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq

