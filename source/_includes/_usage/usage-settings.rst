.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The Settings module allows to customise both the appearance and the
behaviour of the modules. Configuration options are grouped in
categories: :ref:`settings-general`, :ref:`settings-mails`,
:ref:`settings-calendar`, and :ref:`settings-contacts`.

.. _settings-general:

General
-------

.. card::
   :class-header: sd-font-weight-bold irisfont

   Theme Options
   ^^^^

   Choose whether the `Dark Mode` is enabled or not.

.. card::
   :class-header: sd-font-weight-bold irisfont

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
   :class-header: sd-font-weight-bold irisfont

   Application versions
   ^^^^

   Informative panel reporting the versions of |product|'s
   components.

.. card::
   :class-header: sd-font-weight-bold irisfont

   Account
   ^^^^

   Click :bdg-primary:`LOGOUT` to exit the current session.

.. _settings-mails:

Mails
-----

.. card::
   :class-header: sd-font-weight-bold irisfont

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
   :class-header: sd-font-weight-bold irisfont

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
   :class-header: sd-font-weight-bold irisfont

   Signatures
   ^^^^

   Define signatures that can be appended to the e-mails that you
   write. Use the textarea to write a plain text or HTML (default)
   signature, assign a name to them and add to the library by clicking
   the :bdg-primary-line:`ADD SIGNATURE` button.

.. card::
   :class-header: sd-font-weight-bold irisfont

   Set Default Signatures
   ^^^^

   Choose from the signature library which signature to append by
   default to new e-mails that you write or to replies and forward.

.. card::
   :class-header: sd-font-weight-bold irisfont
 
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
   :class-header: sd-font-weight-bold irisfont

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
   :class-header: sd-font-weight-bold irisfont

   Work week
   ^^^^^

   Define the times when your daily work week starts and ends.

   .. note to self: customise modal seems to not yet work

.. card::
   :class-header: sd-font-weight-bold irisfont

   Creating Appointments
   ^^^^^

   You may select on which calendar events and appointments are
   created by default and if the default time zone is used or can be
   chosen when creating new appointments.

.. card::
   :class-header: sd-font-weight-bold irisfont

   Apple iCal
   ^^^^

   Allow delegation for Apple iCal.

.. card::
   :class-header: sd-font-weight-bold irisfont

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
   :class-header: sd-font-weight-bold irisfont

   Options
   ^^^^^

   You can define how to populate your Contacts and the behaviour of
   the autocomplete feature. New contacts can be added automatically,
   while the search for colleagues' address can use the :abbr:`GAL
   (Global Address List)` by default.

   Autocomplete can take advantage of the GAL and of shared contacts,
   while typing a ``,`` can be used as a shortcut to confirm the
   currently highlighted suggestion.

