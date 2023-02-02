.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _auth-credential:

Credential Management
=====================

Within |suite|, a **credential** is something that allows access to
one of its services or modules.

|suite| Auth’s Credential Management system allows to create dedicated
passwords for different services such as Exchange ActiveSync devices,
Mobile Applications (e.g., Team and Drive) or the Zimbra WebClient
itself.

It is also possible to share the access to a service with other
colleagues, team members, or even third-party persons by simply creating
a new authentication means (e.g., a QR code for mobile access) for the
service, without the need to share the password. Once the access for
these persons is not needed anymore, it suffices to delete the
authentication means to revoke the access.

This also implies, as an additional advantage, that users are able to
decide who can have access to the same services they use, providing a
high level of granularity also at user level.

In the remainder of this section, we show a few common and relevant
tasks that an administrator can carry out.

.. _services_supported:

Services supported
------------------

Zextras Auth allows to create or update custom passwords for the
following services:

.. csv-table::
   
   "EAS", "Mobile Password"
   "WebUI", "Zextras Auth Login Page"
   "WebAdminUI", "Admin Console"
   "MobileApp", "Zextras Mobile Apps"
   "ZmWebUI", "Standard Zimbra Login Page"
   "Dav", "Zextras LDAP Address Book"
   "Smtp", "SMTP Authentication"
   "Imap", "IMAP Authentication"
   "Pop3", "POP3 Authentication"


Administrators can combine these services to set up multiple basic to
complex scenarios, including:

- enable only WebAccess

- enable IMAP without SMTP

- enable IMAP/SMTP only for managed client (pre-setup without the
  user)

- create SMTP password that are not enabled for Web/Soap/Imap access,
  to be used for automation or external services

See the next section for a few examples.

.. _add_new_credentials:

Add new credentials
-------------------

Administrators can set the password of any user account on the command
line when they create the credentials. **In no other circumstances**
they have access to the password, not even for changing it.

New credentials for each of the active authentication services can be
added using the :ref:`zxsuite auth credential add
<zxsuite_auth_credential_add>` command:

.. code:: console

   # zxsuite auth credential add john@example.com [param VALUE[,VALUE]]

By default, this command uses **EAS** (Exchange ActiveSync) as
``service``. Multiple services can be added as comma separated list.
Some examples follow, the first includes a commented output.

#. create a password and a label for user john\@example.com who can
   access service eas (mobile password).

   .. code:: bash

      # zxsuite auth credential add john@example.com password 'easpass' label "Smartphone" service eas
      Credential correctly added

      list
         generated 0 
         created 1620892109473  
         label Smartphone 
         id aKcLK 
         services EAS 
         hash 6Fs6knbW1+fJmWMB1nKoCgLFPy+IGsuZGtmkW0NzV4A= 
         enabled true 
         algorithm SHA256 
      text_data
         auth_method password
         password easpass 
         user john@example.com

   -  ``generated`` - whether the credential was randomly generated or not,
      0 true and 1 means false

   -  ``created`` - the creation timestamp

   -  ``label`` - the label, useful to remember the purpose or user of the
      credentials

   -  ``id`` - the unique ID, which is mandatory to edit or update the
      credentials

   -  ``services`` - the services for which access is allowed

   -  ``hash`` - the hashed credential itself

   -  ``enabled`` - whether the credential can be actually used or not

   -  ``algorithm`` - the hashing algorithm used

   -  ``password`` - the password assigned or randomly generated. As
      mentioned, this is the **only** occasion that the administrator can
      see a user’s password

#. Create a password for jane\@example.com, that can be used only for Web
   Access (both ClassicUI and Zextras Login Page)

   .. code:: console

      # zxsuite auth credential add jane@example.com password \
        'SecretPassword!' label "Web access" service ZmWebUI,WebUI

#. Create a password for alice\@example.com that can be used only for
   IMAP and POP3 download (no SMTP)

   .. code:: console

      # zxsuite auth credential add alice@example.com password \
        'LocalClient' service imap,pop3

#. Create a password for bob\@example.com/SMTP_Service_Credential can be
   used to enable SMTP for an external client

   .. code:: console

      # zxsuite auth credential add bob@example.com password \
      'SMTP_Service_Credential' service smtp

An important parameter is ``qrcode``, to create a new QR code to be
used by mobile devices, provided QR code support :ref:`has been
enabled <auth_qr-code-req>`. Used together with the ``--json`` switch,
it will show the QR code’s payload as well. An example is:

.. code:: console

   # zxsuite auth credential add charles@example.com password \
     'SMTP_Service_Credential' qrcode true service smtp

.. _list_existing_credentials:

List existing Credentials
-------------------------

System Administrators can view an extended list of all credentials
active on an account by using the :ref:`zxsuite auth credential list
<zxsuite_auth_credential_list>` command:

.. code:: console

   # zxsuite auth credential list john@example.com

.. note::

   The ``zxsuite auth credential list`` does not give access to the
   user’s password.

The output of this command can be quite long, because it shows all the
credentials configured on an account, including a number of additional
information. Let’s see an example and which are the relevant
information:

.. code:: console

   # zxsuite auth credential list john@example.com

           values
                   generated           1
                   created             Tue 04 May 2021 at 08:39:41
                   label               MobilePassword 1
                   id                  5llDP 
                   services            SMTP,IMAP 
                   hash                W6q6hvf10TcPasPL+Oy96iHWO7SrjZBDHfaldt6ZxQk=
                   enabled             true
                   algorithm           SHA256

                   generated           0
                   created             Wed 05 May 2021 at 17:53:38
                   label               My Label
                   id                  Fr2jM 
                   services            EAS 
                   hash                +Crk6YcPL7IapCg6xfT6oXWP977uTeZdJTVQDQZd+Io=
                   enabled             true
                   algorithm           SHA256

-  is the **id** of the credentials, which is unique and necessary to
   edit the credential—​see next section

-  the service(s) for which the credential is valid.

.. _editing_a_credential:

Editing a Credential
--------------------

While usually the credential (password) itself cannot be edited, the
System Administrator can update its label and properties, including
the services for which it is valid, by using the :ref:`zxsuite auth
credential update <zxsuite_auth_credential_update>` command:

.. code:: console

   # zxsuite auth credential update *john@example.com* *f51as* \
     [param VALUE[,VALUE]]

Building on the above example, we want to change the label of credential
id **Fr2jM** belonging to user john\@example.com. This can be achieved
with:

.. code:: console

   # zxsuite auth credential update john@example.com Fr2jM label "New Label"

The successful credential update will be displayed as output of the
previous command, reporting all credential’s properties:

.. code:: 

   Credential Fr2jM updated

           values
                   generated           0
                   created             Wed 05 May 2021 at 17:53:38
                   label               New Label
                   id                  Fr2jM
                   services            EAS
                   hash                +Crk6YcPL7IapCg6xfT6oXWP977uTeZdJTVQDQZd+Io=
                   enabled             true
                   algorithm           SHA256
