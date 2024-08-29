.. |userp| replace:: :file:`user_provisioning.csv`
                      
.. _migration-other:

=============================
 From Generic E-mail Systems
=============================

The migration to |product| from a generic e-mail system requires a
number of manual steps to be carried out on both the **Source** and
**Destination** systems to be able to migrate correctly
everything.

There are two different ways to proceed, depending on whether the User
Account provisioning can be done automatically or not, that influence
the *Phase 1* of the migration process.

Since this is quite a long procedure, please read carefully the
reminder of this section before attempting the migration, to
understand which data, files and their format are needed.

Requirements and Limitations
============================

There are theoretically no limitations when migrating from a generic
e-mail system, provided you can export suitable text files when
required.

These files are CSV or ICS files with a precise format: they will be
then processed using the scripts that we provide to import Users,
Calendars, Contact, E-mails in the **Destination**. Make sure that the
format of the files reflect the examples, to prevent any possible
error while processing the files.

Phase 1, Provisioning
=====================

This phases is divided into two steps, as shown in
:numref:`fig-migration`: Accounts provisioning and |dl| provisioning,
while the |CoS| provisioning is an empty step, as generic e-mail systems
do not have CoS.

Step 1-1, Domains and Accounts
------------------------------

This step can be automatically done when using :ref:`Auto
provisioning <ad-auto>`: please refer to that section to set it up,
then skip to :ref:`Phase 2 <mig-other-2>`.

.. note:: The linked Auto provisioning article describes the use of AD
   for provisioning, but also any generic LDAP is supported: The procedure is
   analogous to the AD, with appropriate changes to the search
   filters, bind domains, and the port.

If you prefer to proceed manually, you need first to create on
|carbonio| the **domain** that will be imported and modify, according
to your preferences its **default COS**, that will be applied to all
users in the domain. You can refer to section :ref:`ap-domain-new` and
:ref:`ap_cos`, respectively, for directions.

.. hint:: Make sure that all the desired settings for both the domain
   and the default COS have correct values.

Then, you need to export manually the accounts from the **Source** and
import them in the **Destination**, you have three options. For each
of them you need to create a CSV text file with suitable content that
you later import. The difference between the files in the three
alternatives described below is the data contained, which determines
how users will then access their account on the first login.

We will call this file |userp|; it must contain the following data
**for each user** to be migrated: e-mail address (which serves as
username), password, given name, surname, and display name. Other
values are needed, depending on the option chosen. Depending on the
**Source**, you should be able to export these date using a script or
some tool provided by the e-mail system.

File |userp| must then be copied on the **Destination** to be
processed. We assume this file will be stored as
:file:`/tmp/user_provisioning.csv`.

Option 1
~~~~~~~~

All users will receive the same password and they will need to provide
a new password on the first login.

The CSV file must have the following structure::

  email_1@example.io,givenName,Surname,DisplayName
  email_2@example.io,givenName,Surname,DisplayName
  email_3@example.io,givenName,Surname,DisplayName

As the ``zextras`` user, execute the following script, which will
create a command file that will be fed to :command:`carbonio` later:

.. dropdown:: User Account Migration Script - Option 1
   :open:
         
   :download:`/scripts/option1.sh`

   .. literalinclude:: /scripts/option1.sh

Once the script has been successfully executed, it will output file
:file:`user_provisioning.cmd`, which can be given to :command:`carbonio` as
input.

.. code:: console

   zextras$ carbonio prov -f user_provisioning.cmd

Option 2
~~~~~~~~

An empty password is created for all users, which are enabled for
password recovery. A recovery address e-mail must be set up for each
user.

The CSV file must have the following structure::

  email_1@example.io,givenName,Surname,DisplayName,recovery_address1@domain.com
  email_2@example.io,givenName,Surname,DisplayName,recovery_address2@domain.com
  email_3@example.io,givenName,Surname,DisplayName,recovery_address3@domain.com

As the ``zextras`` user, execute the following script, which will
create a command file that will be fed to :command:`carbonio` later:

.. dropdown:: User Account Migration Script - Option 2
   :open:
         
   :download:`/scripts/option2.sh`

   .. literalinclude:: /scripts/option2.sh

Once the script has been successfully executed, it will output file
:file:`user_provisioning.cmd`, which can be given to :command:`carbonio` as
input.

.. code:: console

   zextras$ carbonio prov -f user_provisioning.cmd

Option 3
~~~~~~~~

The actual password of each user is set in the CSV file.

The CSV file must have the following structure::

  email_1@example.io,password1,givenName,Surname,DisplayName
  email_1@example.io,password2,givenName,Surname,DisplayName
  email_1@example.io,password3,givenName,Surname,DisplayName

As the ``zextras`` user, execute the following script, which will
create a command file that will be fed to :command:`carbonio` later:

.. dropdown:: User Account Migration Script - Option 3
   :open:
         
   :download:`/scripts/option3.sh`

   .. literalinclude:: /scripts/option3.sh

.. _mig-other-2:

Once the script has been successfully executed, it will output file
:file:`user_provisioning.cmd`, which can be given to :command:`carbonio` as
input.

.. code:: console

   zextras$ carbonio prov -f user_provisioning.cmd

Step 1-2, Distribution Lists
----------------------------

To import |dl|\s, you need to export them in a CSV file,
called :file:`dl_provisioning.csv`, that has this format::
  
  distibution_list1@example.io,Description1,Name1,email_1@example.io,email_2@example.io,
  distibution_list2@example.io,Description2,Name2,email_2@example.io,email_4@example.io,email_5@example.io
  distibution_list3@example.io,Description3,Name3,email_3@example.io,email_6@example.io,email_7@example.io,email_8@example.io

The first three fields are parsed as the Distribution List's address,
Description, and Name, respectively, and they are reflected in the
|adminui|. All remaining fields, whose number may vary, are the e-mail
addresses that are member of the Distribution List.

As the ``zextras`` user, execute the following script, which will
create a command file that will be fed to :command:`carbonio` later:

.. dropdown:: |dl|\s Migration Script
   :open:
         
   :download:`/scripts/dl.sh`

   .. literalinclude:: /scripts/dl.sh

Once the script has been successfully executed, it will output file
:file:`user_provisioning.cmd`, which can be given to :command:`carbonio` as
input.

.. code:: console

   zextras$ carbonio prov -f dl_provisioning.cmd

Alternatively, you can create manually each Distribution List as
follows. Taking the first list from the :file:`dl_provisioning.csv`
file above as example, as the ``zextras`` user, enter the |carbonio|
shell with command :command:`carbonio`, then issue the following
commands.

.. code:: console

   carbonio> prov cdl distibution_list1@example.io displayName Name1 \
   description Description1
   carbonio> prov adlm email_1@example.io
   carbonio> prov adlm email_2@example.io
   
Phase 2, Data
=============

This Phase is divided into three steps, which require an external tool
to migrate all e-mails and exported files for Calendars and Contacts.

Step 2-1, Emails
----------------

.. include:: /_includes/_migration/imapsync.rst

Step 2-2, Calendars
-------------------

.. include:: /_includes/_migration/calendars.rst

Step 2-3, Calendars
-------------------

.. include:: /_includes/_migration/contacts.rst
             
Phase 3, Shares
===============

Public shares migration is not supported when the **Source** is no
Zextras-compatible platform.

Phase 4, Files
==============

Migration of |file| items is not supported when the **Source** is no
Zextras-compatible platform. Users need to download they file from the
**Source** and manually upload them to the **Destination**.
