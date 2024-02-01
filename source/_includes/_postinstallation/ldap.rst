Securing LDAP
=============

LDAP passwords used by |product| use by default the **SHA-512**
algorithm. While this algorithm is secure and there exist no know
vulnerabilities, some institution may require some more secure
algorithm.

Since version **23.4.0**, |product| supports the storage of LDAP
password using the **Argon2** algorithm.

SHA-512 remains the default on |product| installation, but it is
possible to allow the the new algorithm by means of a simple procedure
in two steps.

Before starting the procedure, however, it is suggested to make a dump
of the LDAP database, using the directions and commands that can be
found in Upgrade's section :ref:`pre-upgrade`.

The first step of the procedure is up to the administrator and
requires to run as the ``zextras`` user the following script, which
takes care to enable the new Argon2 algorithm

.. code:: console

   zextras$ /opt/zextras/libexec/scripts/migrate20230217-AddArgon2.pl

Once the script has successfully completed, Argon2 will be used as
default for **new passwords**. From now on, passwords of all new LDAP
accounts will be stored using Argon2. Existing password, however,
will still use SHA-512.

The second step, indeed, is up to the users: the password of each user
will be stored using Argon2 only as soon as they change it.

.. hint:: The Administrator can force a user to change password from
   the |adminui| by enabling option `This user must change password`,
   that appears in tab `General` when editing a user under
   :menuselection:`Domains --> Accounts`. See section
   :ref:`ap-accounts` for details.
