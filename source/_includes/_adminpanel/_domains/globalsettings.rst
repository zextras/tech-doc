The settings in this page allow to configure system
notifications, domain disclaimers, and how users can search for other
users.

.. card:: System Notifications

   To configure notifications, provide the e-mail address that appears
   as the sender of the system notifications, which must be unique,
   and the recipients that will receive them.

.. card:: Domain Disclaimer

   The first options is to activate the domain disclaimer as a
   mandatory option for all domains configured. By default, the
   disclaimer, whose text can be configured in Section
   :menuselection:`Domains --> Details --> Disclaimer` (see
   :ref:`ap-disclaimer`), is added at the end of each incoming and
   outgoing message (i.e., messages with a recipient external to the
   domain), unless the second option, *Only allow outbound
   disclaimers*, is enabled: in that case, the disclaimer is added
   only to outgoing messages

   .. seealso:: Domain disclaimer can be managed from the CLI as well,
      please refer to Section :ref:`disclaimer-cli`.

Once you change any of the options, restart amavis as the ``zextras``
user on every Node featuring the :ref:`MTA role <role-mta-install>`

.. code:: console

   zextras$ zmamavisdctl restart && zmconfigdctl restart

.. index:: WSC; user search by GUI

.. _wsc-user-search:

.. card:: User search

   The switch labelled **Allow searching users' information in all
   domains**, when active, allows any user to search for other users
   in all other domains configured on the |product| infrastructure.

   For example: user John with e-mail address *john@example.com* will
   be able to find user Jane *jane@acme.example* (which is on a
   different domain) only if this switch is *active*, otherwise Jane
   will not show up in the results.

   If the option is **not active**, it will be possible to define in
   :menuselection:`Domains --> Details --> General Settings` (See
   :ref:`ap-domain-settings`) the domains on which users will be able
   to search users of other domains.
