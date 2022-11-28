.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _adminpanel:

=========
|adminui|
=========

|adminui| is the component that allows access to the administration
functionalities of |carbonio| and is installed by default from
|product| 22.11.0 onwards. It is not available for previous versions,
but can be installed after upgrading to that version, see
:ref:`upgrade-22-11`.

Like for every other component, it can be reached using a
:ref:`supported browser <browser_compatibility>` and point it to
https://mail.example.com:6071/login, replacing `mail.example.com` with
your domain.

To access the |adminui|, the default user is
``zextras@mail.example.com``, whose password should be changed after the
first installation using the command shown in :ref:`Create System User
<create-admin-user>`.

|adminui| allows to manage the |product| domains, mailstores,
accounts, |cos|, and privacy settings. The overall organisation of the
panel is similar to the others components: a the *Top Bar* allows
quick creation of a new domain or COS by clicking the |create| button,
while navigation items are on the left-hand column.




.. A dedicated *Administration Guide* featuring directions and
   advises to carry out the most common tasks will be added soon.

.. _ap-domains:

Domains
=======

The Domain page allows the management of domains and of related
settings, including individual accounts, user quota and
authentication, mailing lists, and more.

The following sections are available in the page: :ref:`global
settings <ap-theme>`, :ref:`domain details <ap-domain-details>`, and
:ref:`domain management <ap-manage-domains>`.

.. _ap-domain-new:

Create New Domain
-----------------

To create a new domain, fill in the form that opens upon clicking the
|create| button.

.. card::

   New Domain Options
   ^^^^

   Two types of options are available during the creation of a new
   domain:

   * General information

     The only mandatory data to supply it the domain name, which is its
     FQDN. All other data are optional and can be set at a later point.

     Important options that can be configured during the domain
     creation are the total number of accounts that can be managed for
     the domain and the e-mail quota. Also a description can be
     added.

   * GAL settings

     Except for the :abbr:`GAL (Global Access List )` mode, currently
     only **Internal**, it is possible to define the account used to
     synchronise GAL information, the mail server used, which must be
     on the same domain (or in a compatible one, i.e., in a valid
     alias URL, see Virtual Hosts below)

.. _ap-theme:

Global
------

Global settings concern the appearance of |product| and allow to
customise various option that will influence how the |product| web
interface appears to the web clients.

The first is the activation of the dark mode, while the other are
grouped as follows.


* **Title & Description** are the name of the client's tab and its
  tooltip.

  .. hint:: You can differentiate them for end User and Admin
     Panel user.

* **Logo** defines the logos used for the login page and the
  main |product|\'s GUI, in both the light and dark mode

  .. hint:: Each logo is a 240x120 pixel image in PNG or SVG format, saved on
     a *public URL*.

* **Favicon** is the URL of the favicon to be displayed, which
  must be in ICO format, 16x16 pixels

* **Background Login Page** is displayed during the login phase

  .. hint:: You can choose one JPG image, 2560x1440 pixels for
     light mode and one for dark mode. 800 KB is the maximum
     size allowed.

All customisations can be removed at one by clicking the
:bdg-danger-line:`RESET` button.

.. _ap-domain-details:

Domain Details
--------------

General Settings
~~~~~~~~~~~~~~~~

General setting influence the basic domain configuration; most of them
appear during :ref:`the creation of the domain
<ap-domain-new>`. Additional options allow to define the time zone,
the use of ``HTTP`` or ``HTTPS`` protocol (the former should be used in
test enviromnents only), and a mail server used for spam-relay
purposes.

Moreover, a default |cos| and its status can be attached to the domain.

GAL
~~~

Authentication
~~~~~~~~~~~~~~

Virtual Hosts
~~~~~~~~~~~~~

Mailbox Quota
~~~~~~~~~~~~~

Theme
~~~~~

These setting are the same that appear in the :ref:`Global Theme
<ap-theme>` section, but are domain-specific: if not defined, the
global theme settings will be applied.

.. _ap-manage-domains:

Manage Domains
--------------


.. provisional structure, to be un-commented while doc is being developed.



   Servers
   =======

   Global Servers
   --------------

   Server Details
   --------------

   Class of Services (COS)
   =======================


   Subscriptions
   =============

   Privacy
   =======

   Backup
   ======

   Here we can put the current backup documentation
