The |wsc| Role, currently in :bdg-danger:`BETA` version, adds chat
functionalities and, in conjunction with the |vs|, video calls to
|product|.

.. _wsc-text:

Text features
-------------

|wsc| ships with all the functionalities of a textual chatting system.

You can create a new one-to-one or one-to-many chat by using the |new|
button on the top bar. In the dialog window, either start to type the
e-mail address of a colleague or tick the checkbox next to the list of
account, then the |create| button to start the chat. If you add more
than one address, you will create a one-to-many chat (also called
**Group**): you can provide a (mandatory) title as a name for the chat
and an optional topic. You also become a :term:`moderator` of the
group.

While chatting, you can send attachments, possibly with a caption, to
the other :term:`members <member>` of the chat. With the |pv|
installed, the attachments can be previewed before being
downloaded. In both cases, attachment can be sent from or saved to
|file|.

When you create a new chat or group for the first time, a list will
appear on the left-hand side. Creating new chats or groups will
populate the list, which will show the most recent chats or groups at
the top of the list. You can then filter the list if you search a
particular chat or group, while for every item it is shown whether
there is an ongoing meeting (a camera icon will replace the small
avatar icon), the chat or group is muted (a barred belle icon will
appear), of if you have written a draft message.

In both chats and groups there is a sidebar on the right-hand side,
which carries a number of information and allows to carry out some
actions.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Chat Sidebar
      :columns: 6

      In a chat, the sidebar is split in two:

      * The *Info* box shows the e-mail of the two members and
        the avatar of the other member

      * The (collapsible) *Action* box allows to mute notifications
        (visual notification, if active, will still be shown) or to
        clear the chat's history.

        .. note:: The deletion requires a confirmation, is
           irreversible and is personal, meaning that the other users
           will still be able to see it.
        
   .. grid-item-card:: Group Sidebar
      :columns: 6

      In a Group, the sidebar is divided into three parts:
      
      * The *Info* box shows the title and topic of the group, along
        with the number of members

      * The (collapsible) *Action* box allows to mute notifications
        (visual notification, if active, will still be shown), to
        clear the chat's history or to leave the group. 

        .. note:: The deletion requires a confirmation, is
           irreversible and is personal, meaning that the other users
           will still be able to see it.

        If you are a moderator, you can not leave the group but you
        have additional actions available: to *Edit details* of the
        group (title and topic), to add *new members* or *delete the
        group*

      * In the (collapsible) *Members* box shows the e-mail and
        avatars of the other participants. It is possible to search
        for members or open a direct chat with each of the members by
        clicking the icon. A crown icon shows the moderator of the
        group.

        If you are a moderator, you can promote other members to
        moderator.

        .. note:: If you are the only moderator, you **can not** leave
           the group.
        
.. _wsc-meeting:

Meeting features
----------------

A :term:`Meeting` is a video call or video conference consisting of
two or more :term:`Participanta <Participant>`.

To take part to a meeting, use the button on the top right of the chat
window: if you are starting the meeting, the button is called
:bdg-light:`START MEETING`, while if the meeting has already
started (in the case of a video conference), the button becomes
:bdg-light:`JOIN MEETING`.
               
If someone is trying to call you directly, a dialog allows you to
accept the call and enter the meeting or to refuse the call and write
a short message that will be sent to the caller. Upon entering the
meeting, you have the chance to choose the microphone and webcam
(i.e., the devices) to use and to test the microphone. You can also
enter the call with both devices deactivated.

After the meeting has started, on the left-hand side three collapsible
panels appear: the *Actions* and *Participant* boxes, which are the
same as the corresponding *Actions* and *Members* box in the textual
chat, and the *Chat* on the bottom. On the bottom, the *Action Bar*
allows to change or disable the devices, to share the screen, to
change the mode of the call (see next section), or to leave the call.

Meeting modes
~~~~~~~~~~~~~

The right-hand side sidebar depends on the mode used during the
meeting which can be one of:

* Face to face mode. This is available only for a video call (i.e.,
  between two participants) and the only interaction is to hide your
  video and show only the other participant.

* Cinema mode, available for video conferences. The sidebar shows a
  miniature of the participants. Only a few are shown in a vertical
  carousel, depending on the size of the browser's window, but you can
  scroll the carousel. By default, the main area shows the participant
  that is talking, but it is possible to force one participant to
  stick in the main area by pinning it (i.e., clicking the
  corresponding icon on the miniature).

* Grid mode, available for video conferences. All the participants
  will be shown in the main area. When the number of participant is
  large and they can not be fit in a single window, it will be
  possible to scroll the grid.

  It is also possible to pin one of the participants: in this case,
  the mode will be automatically switched to Cinema.

  .. hint:: To toggle between the Cinema and Grid modes use the button
     between the share and leave buttons in the Action Bar.

Screen sharing
~~~~~~~~~~~~~~

It is possible to share an entire screen or single windows. Depending
on the browser used, it might be even possible to share only a tab of
the browser.

In video conferences, if someone (Alice) starts sharing the screen
while someone else (Bob) is already sharing, the screen of Alice will
replace Bob's. Bob's screen will remain shared, but other participants
need to pin it to see it again.
