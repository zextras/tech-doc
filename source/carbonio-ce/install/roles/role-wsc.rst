.. _role-wsc-install:

|wsc|
=====

The |wsc| Component adds the chat functionality to |product|.

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_components/component-wsc-ce.rst


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

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst


Dispatcher DB Migration
-----------------------

Initialise the message dispatcher

.. include:: /_includes/_installation/_components/dispatcher-migration.rst


Enable the |wsc| UI
-------------------

The |wsc| role is disabled by default, you can enable it either from
the |adminui| at COS level (please refer to Section
:ref:`cos-features`), or from the CLI at both COS and Account level by
running as the ``zextras`` user the command

.. code:: console

   zextras$ carbonio prov mc default carbonioFeatureWscEnabled TRUE

This command enables the chat for the ``default`` COS, but you can
enable it on selected COSes and Accounts.

Restart the service

.. code:: console

   # systemctl restart carbonio-ws-collaboration

Status Check
------------

After the installation, you can check the status of |wsc| and all its
dependencies by running command

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq

