Distribution lists can be simply created by clicking the
:bdg-primary:`+` button to open a tabbed modal dialog in which to
configure it.

In the first tab (GENERAL),  you can give a name, an address, and a description to
the distribution list; if you want a dynamic mode, that automatically
populates the list's members, refer to section :ref:`ap-dl-dyn`.

In the second tab (MEMBERS),  you can add *Members* by simply writing the e-mail addresses in
the test field.

.. hint:: E-mail addresses are auto-completed while typing.

In the third tab (SECURITY), owner settings can be configured.
Owners can be added to the list, and they will see the lists of which they are owners in a dedicated menu item, where they can manage details and members.
In this tab, the admin can also configure "Sending Options," choosing who is allowed to send emails to the list.
The available options are:

- Everyone
- Members only
- Internal users only
- Only users in a defined list

From the last tab (DELEGATES), an admin can set one or more delegate users (or groups of users) among the domain users.
These users or groups can be assigned one of two permissions:

- Send
- Send on Behalf of

Once granted, the user, or any user in the group, can select the distribution list from the Webmail interface to send a new email.

Once a distribution list has been created, it can be further
configured by adding aliases, which work like e-mail accounts,
changing the description, notes, and members, and granting selected
users the permission to send e-mails to the distribution list or
making them Owners.

Whenever new members are added to a Distribution List or the list
permissions are modified, it is necessary to restart the ``milter``
service. From the CLI, execute the command

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      As the |zu|

      .. code:: console

         zextras$ zmmilterctl refresh

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      As the |ru|

      .. code:: console

         # systemctl restart carbonio-milter.service
      
   .. tab-item:: RHEL8
      :sync: rhel8

      As the |zu|

      .. code:: console

         zextras$ zmmilterctl refresh

   .. tab-item:: RHEL9
      :sync: rhel9

      As the |ru|

      .. code:: console

         # systemctl restart carbonio-milter.service

.. _ap-dl-dyn:

Dynamic Mode
------------

Distribution list's *Dynamic Mode* allows the automatic management of
members. Indeed, each Dynamic Distribution List is identified by a
name and by a unique *Distribution List URL*, which is an LDAP query
that automatically populates the members of the Distribution List.

To create a Dynamic Distribution List, the procedure is similar to the
normal Distribution Lists: click the :bdg-primary:`+` button and
provide a **Displayed Name** name and **list Name**, then click the
**Dynamyc Mode** switch to access more options, including the
*Distribution List URL*, which is mandatory.

.. hint:: The *Distribution List URL* already includes the
   ``ldap:///`` prefix, so you do not need to add it.

You can also make the list **Hidden from GAL** and add owners to the
list, who can manage the configuration of the list.

Advanced options, like subscription and unsubscription options are
available after the creation of the Dynamic Distribution List, when
editing it.
