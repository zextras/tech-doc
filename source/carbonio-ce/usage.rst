================
 Carbonio Usage
================

.. intro

All functionalities provided by |zx| |product| are available after logging
in to the mailbox.

Access to the mailbox only requires using a browser on any device,
provided it is connected to the Internet.

.. hint:: For a better use of the |product| features, it is recommended to
   use an up-to-date version of Firefox or Chrome browsers.

On Mobile devices, dedicated application can be used to access
specific functionalities of |product|.

.. screenshot of login page?

Use the URL of your webmail to access the login page and provide your
credentials:

* Username: your e-mail address
* Password: the same password associated with your **username**
* Version: The choice is either **Iris**, |product|'s native GUI or
  **Classic**

.. note:: We use the URL https://mail.example.com/ to denote our
   fictitious domain and mailbox. Whenever you find it, remember to
   replace it with the URL of your mailbox.

Once logged in, the user will be on the Home screen from which he can
access all the features of his mailbox.

The features of |product| are grouped in several modules, each
accessible from the menu on the left-hand side of :ref:`iris`. At a
glance, they are:

Mails
   Manage your inbox and e-mails; add filter and sub-folders.

Calendar
   Plan your activities and appointments, share them with colleagues
   and find their shared calendars.

Contacts
   Display all the information related to contacts and distribution lists.

Chat
   A tool dedicated to individual and group chats and to the creation
   of corporate spaces and thematic channels (optional module).

File
   Share documents with colleagues (optional module).

Search
   A powerful search engine across all modules of the mailbox.

Settings
   Define your preferences to customise the appearance of your mailbox
   and its daily operating functionalities.

Additionally, all the functionalities to search for objects in the
mailbox and to create new objects in the various modules have been
unified.

The remainder of this section contains usage instructions for the most
common tasks that can be carried out from |product|'s GUI.


Quick Search And Create New Objects Functionalities
===================================================

.. _fig_top_bar:

.. figure:: /img/carbonio/Searchbar.png

   The top bar of |product|, used to search for objects and to create
   new ones.

In |product|, the functionalities to create new objects (email,
contacts, calendar appointments and events, and so on) and to search
have been integrated into the top bar. For example, it is possible to
create a new calendar appointment while reading e-mails or search for
contacts when planning an event on calendar.

To do so, use |product|'s top bar, shown in
:numref:`fig_top_bar`. Click the blue |new| button to create a new
object in the module you are currently in (i.e., while in the
calendar, create a new appointment) or the
:octicon:`chevron-down;1em;sd-bg-primary sd-text-white` to create a
new object in another module.

The search works in a similar way: the white button on the right-hand
side of, which changes label depending on the
current module, can be used to search in the module the string
provided in the text box. Click the
:octicon:`chevron-down;1em;sd-bg-light sd-text-black` to search in a
different module. A more advanced search is available in the
:ref:`Advanced search module <search-mod>`.

.. _loginpage:

Login Page
==========

.. _iris:

IRIS
----

IRIS is the new web-based graphic interface of |product|.

.. _mails-mod:

Mails
=====

.. _calendar-mod:

Calendar
========

The calendar module allows to keep track of the appointments, meetings,
and events you need to attend to and share them with your colleagues.

Beside using |new|, a new appointment can be created with a click of
the mouse on the desired date and time on the calendar. The only
difference is in the start (and end) date and time: by using the button,
they are set to the current date and time, by clicking the calendar
they are taken from the clicked date and time.

Shared Calendars
----------------

You can also search for calendars shared by your colleagues: click
*Shared Calendars* in the left-hand side columns, then the
:bdg-primary-line:`FIND SHARES` button. In the dialog that opens,
enter the (partial) name of the colleague, then assign a colour, and
finally click :bdg-primary:`ADD`.

The calendar will appear in the list of calendars, and all the
appointments are shown; toggle their visibility clicking the
:octicon:`tasklist;1em;sd-text-primary` checkbox.


.. _contacts-mod:

Contacts
========

.. _search-mod:

Search
======

.. _settings-mod:

Settings
========

The Settings module allows to customise both the appearance and the
behaviour of the modules. Configuration options are grouped in
categories: :ref:`settings-general`, :ref:`settings-mails`,
:ref:`settings-calendar`, and :ref:`settings-contacts`.

.. _settings-general:

General
-------

.. card::
   :class-header: sd-font-weight-bold

   Theme Options
   ^^^^

   Choose whether the `Dark Mode` is enabled or not.

.. card::
   :class-header: sd-font-weight-bold

   Out of Office Settings
   ^^^^

   These setting allow you to define the behaviour of |product| when
   e-mails are received within a time period during which you are not
   available. You can choose whether automatic replies are sent and to
   whom: you can also send a different message to people outside your
   organisation or decide to notify only your colleagues (i.e., people
   in your organisation).

   Define also the time period during which you will be away. By
   default, an appointment that matches the time period is created
   on your calendar.

.. card::
   :class-header: sd-font-weight-bold

   Application versions
   ^^^^

   Informative panel reporting the versions of |product|'s
   components.

.. card::
   :class-header: sd-font-weight-bold

   Account
   ^^^^

   Click :bdg-primary:`LOGOUT` to exit the current session.

.. _settings-mails:

Mails
-----

.. card::
   :class-header: sd-font-weight-bold

   Displaying Messages
   ^^^^

   The options here control how the e-mails are displayed in the
   mailbox and how often to check for new emails (i.e., *polling
   interval*).

   Other options allow to set the colour of incoming messages and
   which is the default query over e-mails, that is, which e-mails are
   shown upon logging in. By default, the query is ``in:inbox``,
   meaning that all messages in the **Inbox** are displayed.

.. card::
   :class-header: sd-font-weight-bold

   Receiving Messages
   ^^^^

   These settings define the response to incoming
   e-mails. Notification e-mails can be sent to a third party and
   different types of desktop notification can be combined (pop-ups,
   flashing browser title, highlight of mail tab). Notification can be
   restricted to e-mail landing in the inbox or in all folders (in
   case you defined Filters, see further on).

   Choose also where to store e-mails sent from yourself, whether to
   send automatic read receipts and if duplicate messages should be
   deleted.

.. card::
   :class-header: sd-font-weight-bold

   Signatures
   ^^^^

   Define signatures that can be appended to the e-mails that you
   write. Use the textarea to write a plain text or HTML (default)
   signature, assign a name to them and add to the library by clicking
   the :bdg-primary-line:`ADD SIGNATURE` button.

.. card::
   :class-header: sd-font-weight-bold

   Set Default Signatures
   ^^^^

   Choose from the signature library which signature to append by
   default to new e-mails that you write or to replies and forward.

.. card::
   :class-header: sd-font-weight-bold

   Filters
   ^^^^

   Filters determine how to move incoming or outgoing e-mails to
   folders within your inbox.

   In the list of active filters, click :bdg-primary-line:`CREATE` to
   define a filter and, in the dialog that appears, configure the
   condition(s) that need to be matched, the action applied, and give
   the Filter a name. Filters are applied in a top-down fashion, so in
   case of multiple active rules, choose whether to stop processing
   other following filters.

   When multiple rules are defined, only those among the **Active
   Filters** are used to process e-mails. Filters can be managed
   individually by selecting them and using the buttons
   :bdg-primary-line:`<< ADD` (activate an available filter),
   :bdg-danger-line:`REMOVE >>` (disable an active filter),
   :bdg-primary-line:`EDIT` (modify a Filter), :bdg-primary-line:`RUN`
   (execute a Filter), and :bdg-danger-line:`DELETE` (remove a
   filter).

.. _settings-calendar:

Calendar
--------

.. card::

   General
   ^^^^^

   General setting for Calendar allow to customise how the calendar
   and its events are displayed, how invitations are managed, and how
   remainders behave.

   The calendar can be shown for the next Month, Day, Week, or Work
   Week, and it is also possible to choose which day would start the
   week (usually Sunday or Monday).

   Appointments and invitation can be accepted automatically and the
   notification e-mail deleted.

   Reminders can be set up in different way: by playing sounds,
   showing a popup or flashing the browser's bar.

.. card::

   Work week
   ^^^^^

   Define the times when your daily work week starts and ends.

   .. note to self: customise modal seems to not yet work

.. card::

   Creating Appointments
   ^^^^^

   You may select on which calendar events and appointments are
   created by default and if the default time zone is used or can be
   chosen when creating new appointments.

.. card::

   Apple iCal
   ^^^^

   Allow delegation for Apple iCal.

.. card::

   Permissions
   ^^^^^

   Configure access to *free/busy information* of appointments, which
   can be restricted to selected internal users, to configured domain(s), to
   everyone (i.e., internal and external users), or none.

   Moreover, you can limit the users who can send you invitations.
   
.. _settings-contacts:

Contacts
--------

.. card::

   Options
   ^^^^^

   You can define how to populate your Contacts and the behaviour of
   the autocomplete feature. New contacts can be added automatically,
   while the search for colleagues' address can use the :term:`GAL` by
   default. 

   Autocomplete can take advantage of the GAL and of shared contacts,
   while typing a ``,`` can be used as a shortcut to confirm the
   currently highlighted suggestion.

Mobile clients: Mail
====================

Android device configuration

iOS device configuration

APPs for mobile devices
=======================

Mail
   It is the client that allows the management of mail from Ios or
   Android mobile devices

Team
   The Team app guarantees the creation and use of chats, instant
   meetings and spaces wherever the user is.

Drive
   The Drive app allows the user to read, upload and possibly delete
   the files inside the Drive. Furthermore, you can upload images and
   documents from your mobile device.
