.. _up-old:

Manual From Older Versions
==========================

This section guides you in the upgrade from a |product| version
**older than** |prev| to the latest available version, |current|,
which contains a number of technical and performance improvements, bug
fixes, and security fixes.

.. note:: Upgrading from very old versions should work, but may
   require a lot of manual tasks to be carried out before, during, and
   after the procedure, and might become an extremely long and
   error-prone process.

Requirements and Limitations
----------------------------

Before proceeding with the upgrade, please read carefully this whole
section.

The following rules apply to any of the paths you decide to choose for
the upgrade:

* Since **release 25.6.0**, support for **Ubuntu 24.04** has been
  added, while support for **Ubuntu 20.04** has been dropped:
  |product| **does no longer work** on Ubuntu 20.04

* You need to carry out the procedure on **each Node**, starting with
  the one featuring the :ref:`component-mesh-install`

Checklist
---------

#. A new database for backups is added to |product|, so you will be
   required to execute the following command during the upgrade of the
   **Database Node** and then **reboot all the Nodes**

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

#. The ``memcached`` software does no longer require a special
   bind address, so after the upgrade you need to execute a command
   to clear its configuration on the **Proxy Node**. After the upgrade
   of that Node, before rebooting, execute command as the |zu|

   .. code:: console

      zextras$ carbonio prov -l ms $(zmhostname) zimbraMemcachedBindAddress ""

   Then reboot the Node.

Upgrade |product|
-----------------

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

Remember to start the upgrade from the Node featuring the Directory
Server, then all the other Nodes in the same order of installation.

.. include:: /_includes/_upgrade/first-part.rst


.. include:: /_includes/_upgrade/second-part-cb.rst
