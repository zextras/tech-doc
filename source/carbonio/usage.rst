==================
 |carbonio| Usage
==================

.. intro

This section contains general advices about the most common tasks and
functionalities of the various |product| modules. The following
modules have dedicated sections featuring more information, howtos,
and best practices:

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
accessible from the menu on the left-hand side of IRIS, |product|
default web interface. At a glance, they are:

Mails
   Manage your inbox and e-mails; add filter and sub-folders.

Calendar
   Plan your activities and appointments, share them with colleagues
   and find their shared calendars.

Contacts
   Display all the information related to contacts and distribution lists.

.. Chat and File are not confirmed to be part of initial release

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

.. _global-search:

.. _create-new:

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

..
   .. _loginpage:

   Login Page
   ==========

   .. _iris:

   IRIS
   ----

   IRIS is the new web-based graphic interface of |product|.

.. auth for users

.. include:: /_includes/auth-user.rst

.. _mails-mod:

Mails
=====

.. include:: /_includes/mails.rst

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

In the Contacts module you can keep track of all the people with whom
you exchange e-mails and group them in address books. Existing address
books appear on the column on the right of the module's list.

You can create new contact by using the |new| button and selecting
`New Contact`; they will be stored under the `Contacts` section of the
Contacts module.

Addresses of people to whom you send an e-mail are automatically added
to the `Emailed Contacts`.

Deleted contacts land in the special `Trash` address book, which keeps
them until you manually empty it. To do so, right-click the address
book and select `Empty trash`.

A right-click on the address book allows to carry out a few action on
it and its content: edit, share, empty, or delete it. Moreover, new
address books can be created.

For each contact, icons allow to carry out different actions: delete,
move, or write an e-mail to the contact.

.. hint:: To move the contacts from one address book to another, you
   can also drag the contact and drop it on the destination address
   book.

If any colleague has shared an address book, you can click the
:bdg-primary-line:`FIND SHARES` button under `Shared Address Book` and
provide the e-mail address. You will see all the address books shared
by the user.

.. _chats-mod:

Chats
=====

Chats is a module that provides corporate instant messaging features
such as Spaces and Channels, chats, and videoconferencing.

The UI of |team| is organised in three columns:

* The left-hand side column holds the list of contacts with the
  history of the passed chats. Above it, you can |create| new chats
  and Groups, filter existing chat names and on the top, select
  between Chats, Spaces and Channels, and Meeting Rooms (see further
  on for more). Below it, buttons allow to manage meeting rooms.

* The central column holds the chat messages. Above the chat's
  top-right corner, click the phone icon to start a video call with
  the contact.

* The right-hand side column holds information about the contact and
  allows to copy the link to the contact's room (which is unique),
  mute notifications, and clear the chat's history

.. _chats_moderators_in_rooms:

Moderators in Rooms
-------------------

The user that creates a **room** (we call *room* a Channel, a Space, a
Group or a Meeting Room, see below) becomes automatically the **Room
Moderator** and can manage the room’s textual and video
conversations. In particular, the *Mute For All* and *Add new members*
functionalities are reserved for Moderators only.

A moderator can promote any user as moderator and can leave the room
only if either no other users are present in the room or another
moderator is present in the room.

Groups
------

Groups are non-persistent entities used to communicate with multiple
people at the same time (by default up to 5 in total).  Any user can
create a group inviting people, and any group member can invite more
people in the same way. When all users leave a group, the group itself
ceases to exist.

Spaces
------

Spaces are a themed container that can hold any number of Channels.
You can think of a Space as a community center where people gather to
discuss different topics in dedicated areas (named Channels).

Everyone can create a Space and becomes its `Administrator`, who can
add Members and Channels, and grant the same rights to any other user
by clicking on the crown icon in the appropriate entry of the
participant list. Like for chats, each Space has a unique identifier,
that can be copied by clicking the :bdg-primary-line:`COPY ROOM'S
LINK` button and shared.

.. _chats_channels:

Channels
--------

Channels are topic-defined areas inside of a Space and can contain any
number of users. Differently from Groups, users can autonomously join
any Channel in a Space of which they are members.

Each new Space has a "General" channel automatically created within it,
which defines the space’s properties (e.g., Title and Topic) and which
all users automatically join when they join the Space.

Meeting Rooms
-------------

Meeting Rooms allow to set up video calls with multiple participants,
including **Internal Guests** and **External Guests**. The former are
users with an account on the current |product| instance, while the
latter are users that have no local account (i.e., on the |product|
instance). Both can join on a temporary basis without the need of
being members of the Meeting Room.

Moreover, in the Meeting Room tab, users can see at a glance all
ongoing and planned meetings involving them.

To create a new planned meeting, click the :bdg-primary-line:`PLAN A
MEETING` button, then enter a name. You will be automatically assigned
the role of **Owner**. Besides being a :ref:`Moderator
<chats_moderators_in_rooms>`, an owner can not be removed and is the
solely person that can delete a Meeting Room.

In the left-hand side column, all meetings are shown, divided into
**Ongoing Meetings** and **Scheduled meetings**. For each of them, a
few buttons are shown, to join or delete a room, to copy and share the
room's link and to change the link.

.. note:: When a link is changed, the old one is wiped and can not be
   used anymore.

Planned Meetings prove useful when scheduling meetings with
colleagues: create a planned meeting, then attach the room's link to
the calendar's invitation.

.. video recording for meeting rooms is forthcoming!

Files
=====

.. include:: /_includes/files.rst
             
.. _search-mod:

Search
======

The Search module vastly improves the search capabilities of the
:ref:`quick search <global-search>` top bar. Click the
:bdg-primary-line:`ADVANCED FILTER` button to open a dialog that will
help you refine the search criteria on all your e-mails.

You can combine multiple search criteria, some of which are inclusive
or exclusive (i.e., you can search for e-mails with or without
attachments, that are flagged or not, and that are read or unread),
while other allow to provide values for almost any other property of
an e-mail, including  sender or recipient, subject or keywords, type of
attachment, and limit the search according to a period of time or to a
size interval.

Moreover, you can search on tags given to the e-mail and limit the
search to specific folders. When all criteria have been entered, click
|search| to start the search, while clicking |reset| will clear the
dialog.

In the resulting list of result, click any e-mail to open it. To
further refine the search, click the blue bar above the list of
e-mails. The dialog will reopen, with the same criteria entered
before: here you can add more constraints or change some of them.

.. _settings-mod:

Settings
========

.. include:: /_includes/usage-settings.rst

.. include:: /_includes/mobileapps.rst
