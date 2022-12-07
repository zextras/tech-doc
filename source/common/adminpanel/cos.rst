
A |cos| determines which items can be accessed by a web client and
how, setting default for a number of options. A users that belongs to
that COS may later change some of these options from the
:ref:`settings-comp` page on the web client.

To create a COS, click the :bdg-primary-line:`CREATE NEW COS` button
and enter a name. You can then configure all the options from the
left-hand side menu.

Features
~~~~~~~~

*Features* are settings that allow the user to access the most used
functionalities of |product|. 

Preferences
~~~~~~~~~~~

*Preferences* consist of options for the various modules, in
particular about the appearance of |product| to web clients (for
example, if e-mails are displayed as conversations, or the calendar
shows a month or a work week) and governs the behaviour of some tasks
carried out by the user, whether new e-mail contacts are added
automatically to Contacts, or how often to check for new e-mails.

Server Pools
~~~~~~~~~~~~

In this page it is possible to select on which servers new users can
be added to the COS.

.. note:: If only one server has been defined, no choice is possible.

Advanced
~~~~~~~~


The *Advanced* Option allow to configure the user quota, data sources,
proxy settings, passwords, and more.

The **user quota**, is a set of options that limit how much space a
user can occupy on the server, or how many contacts he can have. It
also encompasses the option to send periodic notifications when the
user space raises over a given threshold.

The **Data sources**, also called *polling intervals*, allows to
define of often to contact the |product| infrastructure to update
e-mails and calendar. One option allows also to define the shortest
interval for polling, that will be used if no other one is configured.

**Proxy settings** are used to allow domains to be proxyed.

The **Password** settings permit to tune the length, characters, and
duration of the user passwords. It is also possible to reject common
passwords.

The **Failed Login Policy** allows to define the behaviour of
|prodcut| when a user fails a log in. A typical policy can lock out
the user for *one hour* when *three* consecutive login attempts fail
within *30 minutes*.

The **Timeout Policy** concern the duration of the token's validity.

The **Email Retention Policy** define how long e-mail will be stored
before being automatically deleted.
