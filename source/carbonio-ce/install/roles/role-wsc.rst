.. _role-wsc-install:

Workstream Collaboration  :bdg-danger:`BETA`
============================================

The WSC Role adds the chat functionality to |product|. It is currently
in :bdg-danger:`BETA` version, hence it may still lack some
functionalities and may not work 100% properly.

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-wsc-ce.rst


Migrate dispatcher
-------------------

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration carbonio_adm 127.78.0.10

Bootstrap |product|
-------------------

.. include:: /_includes/_multiserver-installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_multiserver-installation/mesh.rst
