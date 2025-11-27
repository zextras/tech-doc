.. _up-old:

Manual From Older Versions
==========================

This section guides you in the upgrade from a |product| version
**older than** |prev| to the latest available version, |current|.

.. note:: Upgrading from very old versions should work, but may
   require a lot of manual tasks to be carried out before, during, and
   after the procedure, and might become an extremely long and
   error-prone process.

To perform the upgrade, first follow all the steps documented in
:ref:`Manual From Previous Version <carbonio-upgrade>`, then apply the additional actions described below.

Checklist for old versions
--------------------------

#. A new backup database has been introduced in recent versions of |product|.
   During the upgrade of the **Database Node** , you must run the following command 
   and then **reboot all the Nodes**

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

#. The ``memcached`` software does no longer require a special
   bind address, so after the upgrade you need to execute a command
   to clear its configuration on the **Proxy Node**. After the upgrade
   of that Node, before rebooting, execute command as the |zu|

   .. code:: console

      zextras$ carbonio prov -l ms $(zmhostname) zimbraMemcachedBindAddress ""

   Then reboot the server.

