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

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
     carbonio_adm 127.78.0.10 20000

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


Enable the Workstream Collaboration UI
--------------------------------------

The |wsc| role is disabled by default, you can enable it  either from
the |adminui| or from the command line by running as the ``zextras`` user the
command

.. code:: console

   zextras$ carbonio prov mc default mc carbonioFeatureChatsEnabled TRUE

You can also enable it at COS level, allowing only certain users to
access it.

.. card:: Check status of |wsc|


   After the installation, you can check the status of and all its
   dependencies by running command

   .. code:: console

      # curl -v http://127.78.0.4:10000/health | jq
