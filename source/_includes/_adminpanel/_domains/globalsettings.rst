The settings in this page allow to configure both system
notifications and domain disclaimers.

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
