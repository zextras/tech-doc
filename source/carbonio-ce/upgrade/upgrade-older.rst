.. _up-old:

From Older Versions
===================

This section guides you in the upgrade from a |product| version **older
than** |prev| to the latest available version, |current|, which
contains a number of technical and performance improvements, bug
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

.. _up-old-check:

Checklist
---------

#. These packages must be renamed, if they still exist on your |product|
   infrastructure:

   * ``carbonio-message-dispatcher`` :fas:`arrow-right` ``carbonio-message-dispatcher-ce``
   * ``carbonio-storages``  :fas:`arrow-right` ``carbonio-storages-ce``

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

If you are on a Multi-Server, remember to start from the Node
featuring the Directory Server Component, then all the other Nodes in the same
order of installation.

.. include:: /_includes/_upgrade/first-part.rst

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Rename packages
      :columns: 12 12 12 12

      .. dropdown:: ``carbonio-message-dispatcher``
         :open:

         On the Node installing the |wsc| Component, remove
         package ``carbonio-message-dispatcher`` and install
         ``carbonio-message-dispatcher-ce``.

         .. include:: /_includes/_upgrade/package-dispatcher.rst

      .. dropdown:: ``carbonio-storages``
         :open:

         On the Node installing the |wsc| Component, remove
         package ``carbonio-storages`` and install
         ``carbonio-storages-ce``.

      .. include:: /_includes/_upgrade/package-storages-ce.rst

.. include:: /_includes/_upgrade/second-part-ce.rst
