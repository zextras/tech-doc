
Chats is a component that provides corporate instant messaging features
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
