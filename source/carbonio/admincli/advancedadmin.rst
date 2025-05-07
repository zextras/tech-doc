.. _adv-admin:


Advanced Administration Tasks
=============================

In this section we describe and outline a few advanced tasks,
providing quick directions to carry them out.

Component-based Access Control
------------------------------

|product| uses a delegation mechanism to allow the principal
administrator to assign roles and permission to other users with the
purpose of sharing with them the administration tasks and duties,
electing them as either **Global** or **Delegated** Administrator, who
have different privileges to configure and manage these features.

In the context of the management of Anti-Virus and Anti-Spam
functionalities, each Administrator, either Global or Delegated, can
access with the personal account and be able to control and manage
them, according to permissions granted.


Server-side Management of E-mails
---------------------------------

|product|\'s |mta| (Postfix)  receives e-mail by means of the SMTP protocol and
forwards it to the correct e-mail queue according to the user's
username (this coincides with the user's e-mail address). In case of
an e-mail whose recipient is a distribution list (i.e., a mailing
list), the e-mail is forwarded to each of the members of the list.

Additional rules can be created directly on Postfix from
the CLI. Examples of restriction rules can be found directly in
Postfix documentation, for example in `Postfix Standard Configuration
Examples
<https://www.postfix.org/STANDARD_CONFIGURATION_README.html>`_. More
examples, depending on the use case, can be found in the official  `Postfix
documentation <https://www.postfix.org/documentation.html>`_.

.. _cli-attachments:

Server-side Attachment Management
---------------------------------

.. include:: /_includes/_admincli/attachments.rst

.. _cos-management:

Management of a COS
-------------------

Each account on |product| is assigned a |cos|, a global object that is
not restricted to a particular domain or set of domains.

The |cos| assigned to an account determines the default attributes
for that account and the features to be enabled or not for it. The COS
controls mailbox quotas, message lifetime, password restrictions,
attachment blocking, and server pool usage.

You can create and edit the classes of services via CLI and soon also
via the new |adminui|, in which the tasks of |cos| management will
feature an helpful wizard that guides the Administrator through the
creation process.

.. code:: console

   # carbonio prov createCos {name} [attribute value ...]


All the attributes that need to be customised can be either added at
the end of the base command above as ``[ attribute value ]`` pairs, or
at a later point with the following command:

.. code:: console

   # carbonio prov modifyCos {name} [attribute value ...]

.. _enable-smime:

S/MIME support
--------------

S/MIME support for all users can be enabled using command

.. code:: console

   zextras$ carbonio config set global enableSmimeEncryption TRUE

Users will then be able to upload certificates to be used for S/MIME
signing; setting it to ``false`` will prevent users from using the
feature.

Additionally, the command below enables the ability of the user to
verify the S/MIME signature.

.. code:: console

   zextras$ carbonio prov mcf carbonioSMIMESignatureVerificationEnabled TRUE

.. index:: Password policies; S/MIME

The access the S/MIME *Certificate Store* from within their Settings
page, users need to supply a password, which is different from the
S/MIME certificate's password. You can set various parameters of this
password from the CLI, by using the following command as the |zu|
user.

.. code:: console

   zextras$ carbonio config set global \
   encryptionPasswordPolicyAttribute <attribute> <value>

The list of all available attributes that can be customised can be
retrieved using command

.. code:: console

   zextras$ carbonio config get global \
   encryptionPasswordPolicyAttribute

The output of the above command is::

  global
        values

                attribute                                                   encryptionPasswordPolicyAttribute
                inheritedValue
                    minLength                                                       8
                    maxLength                                                       100
                    minUpperCase                                                    1
                    minLowerCase                                                    1
                    minDigits                                                       1
                    minPunctuation                                                  0
                    minAlphaChars                                                   0
                    minPunctuationOrDigitChars                                      0
                    requireAlphanumeric                                             true
                    allowedChars
                    allowedPunctuation
                    denyList
                inheritedFrom                                               default
                isInherited                                                 true
                modules
                        ZxCore

The attribute is available only at global level, meaning this password
policy is the same for all configured domains, CoS, and user on the
system.

.. _advcli-pset:

Pending-setups
--------------

.. include:: /_includes/_admincli/pendingsetups.rst

.. _upstream-proxy:

|product| and HTTP Proxy
------------------------

.. include:: /_includes/_admincli/http-proxy.rst

.. _freshclam-proxy:

Freshclam and HTTP Proxy
------------------------

.. include:: /_includes/_admincli/freshclam-proxy.rst

.. index:: Mobile devices; clean sync status
.. index:: see: Sync status, Mobile; Mobile devices; clean sync status

.. _pg-activesync:

Clean Activesync Status
-----------------------

The PostgreSQL ``active_sync`` table in the ``activesync`` database
contains the synchronisation status of mobile devices connected to
|product|. Since there is no mechanism in place to cleans this table,
it can grow significantly over time and occupy unnecessary space. The
simplest solution is to add a line to the |zu|'s ``crontab``.

.. hint:: Remember that ``active_sync`` is a **table** and
   ``activesync`` is the **database** containing it.

To edit the crontab, execute, as the |zu|

.. code:: console

   zextras$ crontab -e

Scroll to the very end of the file (after the comment ``ZEXTRAS-END --
DO NOT EDIT ANYTHING BETWEEN THIS LINE AND ZEXTRAS-START``) and add
this line::

  45 23 * * * /opt/zextras/bin/carbonio mobile doPurgeMobileState > /dev/null 2>&1

Save the file, then exit. This line will clear the ``state`` table
every day at **23:45** (**11:45PM**) from all the connections. The
command is completely transparent, as active connections will
immediately be restored in the table, so users will not notice any
service interruption.

.. hint:: You can change the time at which the script runs by
   modifying the *23* (hour) and *45* (minute) values.

However, in case of a lot of devices connecting, the table can become
so large that the :command:`carbonio mobile doPurgeMobileState` can
timeout and do not clean the table, so a different approach is needed.

This approach requires you to access the Database Node and execute
some SQL command directly on the database.

.. warning:: Please be careful when you act on the database, because
   wrong commands may have unexpected outcomes.

After you access the Database Node, become the ``postgresql`` user.

.. code:: console

   # su - postgres

Then access the PostgreSQL's client


.. code:: console

   # psql

From here, select the ``activesync`` database

.. code:: postgres-console

   postgres=# \c activesync

hen use the following query to retrieve the number of mobile devices
recorded in the table ``active_sync``.

.. code:: postgres

   select concat(extract(YEAR from last_modification), '-', extract(MONTH from last_modification)), count(*) from active_sync.state group by concat(extract(YEAR from last_modification), '-', extract(MONTH from last_modification)) order by concat ASC;

You will have an output similar to::

   concat  | count
  ---------+-------
   2024-1  |    41
   2024-10 |    55
   2024-11 |   165
   2024-12 |    89
   2024-2  |    10
   2024-3  |     7
   2024-4  |   273
   2024-5  |    68
   2024-6  |   190
   2024-7  |    33
   2024-8  |    90
   2024-9  |  1529
   2025-1  |   989
   2025-2  |   606
   2025-3  |    90
  (15 rows)

This output shows that the table holds the status of mobile devices
back to more than year. Old entries can be safely removed from the
table, because they can refer to devices no longer used or that never
connected recently. For example, to remove all entries of year 24,
execute the following query.

.. code:: postgres

   delete from active_sync.state where last_modification between '2024-01-01' and '2024-10-31';

.. hint:: Do not clean the entire table, otherwise all the mobile
   devices will need to re-sync.

You can now check the size of the table by running command

.. code:: postgres-console

   postgres=# \dt+ active_sync.*

If the size of the table is no longer as high as before, quit the
PostgreSQL cliend

.. code:: postgres-console

   postgres=# \q


As the ``postgres`` user, you can analyse the table using the command

.. code:: console

   $ vacuumdb -t active_sync.state -Z -v activesync

If the output is similar to the following one, the table is clean::

  vacuumdb: vacuuming database "activesync"
  INFO:  analyzing "active_sync.state"
  INFO:  "state": scanned 0 of 0 pages, containing 0 live rows and 0 dead rows; 0 rows in sample, 0 estimated total rows

Otherwise, if the number of dead rows is high, you can run the
command, as the ``postgres`` user

.. code:: console

   $ vacuumdb -t active_sync.state -f -v activesync

This command removes dead tuples (rows) to reduce the space used and
keep database performances at an optimal level.
