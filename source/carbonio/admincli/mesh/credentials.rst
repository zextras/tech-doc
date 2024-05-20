
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

Hence, if you do not remember the password, log in as ``root`` to any
|mesh| *Server*, then read the
:file:`/var/lib/service-discover/password` file.

In case you want to change the secret, or you *need* to change it (for
example because it has been compromised, shared with or sent to the
wrong persons, or if one of the system administrators has left your
company), it is necessary to :ref:`mesh-reset`.

.. _mesh-reset:

Reset |mesh| Credentials
------------------------

On a Multi-Server, before starting the procedure it is necessary to
identify the **Leader Node**, on which to carry out some preliminary
tasks, then wipe the old secret, generate the new one, and finally set
up the other nodes by copying the credentials on the remaining nodes
and restart the service.

.. include:: /_includes/_admincli/mesh/leaderip.rst

           
Wipe Old Credentials
~~~~~~~~~~~~~~~~~~~~

Please take into account that the |mesh| service will be **offline**
for the whole duration of the procedure.

Before starting the procedure, we need to know important
information. Log in to Leader Node and execute command

.. include:: /_includes/_admincli/mesh-credentials-index.rst

.. include:: /_includes/_admincli/mesh/wipecredentials.rst

Generate New Credentials
~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/generatecredentials.rst

             
Set up Other Nodes
~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/othernodes.rst
