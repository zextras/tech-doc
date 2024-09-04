
.. _upgrade_pg-adv-mod:

.. card:: Advanced modules not starting

   There are a few corner cases that prevent the advanced modules,
   provided by the Service Roles, to be accessible to users. The
   problem is that the Node featuring the Mailstore & Provisioning
   Role can not communicate with the Database (PostgreSQL) or DB
   Connector (pgpool), depending on your setup.

   In order to fix the problem, you need to make sure that PostgreSQL
   or pgpool are running. If not, restart them.

   Finally, make sure to restart the mailbox

   .. code:: console

      zextras$ zmmailboxdctl restart
