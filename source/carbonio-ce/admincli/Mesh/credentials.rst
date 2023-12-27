
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
company), it is necessary to Reset |mesh| credentials: in the
remainder, you can find step-by-step directions for 
:ref:`Single-Server <mesh-reset-single>` and for :ref:`Multi-Server
<mesh-reset-multi>` 

.. _mesh-reset-single:

Reset |mesh| Credentials on Single-Server
-----------------------------------------

.. include:: /_includes/_admincli/mesh/credentials-single.rst
           
Wipe Old Credentials
~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/wipecredentials.rst

Generate New Credentials
~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/generatecredentials.rst

.. _mesh-reset-multi:

Reset |mesh| Credentials on Multi-Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On a Multi-Server, before starting the procedure it is necessary to
identify the **Leader Node**, on which to carry out some preliminary
tasks, then wipe the old secret, generate the new one, and finally set
up the other nodes by copying the credentials on the remaining nodes
and restart the service.

Find Leader Node's IP Address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
.. include:: /_includes/_admincli/mesh/leaderip.rst
          
Wipe Old Credentials
~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/wipecredentials.rst

Generate New Credentials
~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/generatecredentials.rst

             
Set up Other Nodes
~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_admincli/mesh/othernodes.rst
