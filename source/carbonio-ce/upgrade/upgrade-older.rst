.. _up-old:

From Older Versions
===================

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

#. The ``memcached`` software does no longer require a special
   bind address, so after the upgrade you need to execute a command
   to clear its configuration on the **Proxy Node**. After the upgrade
   of that Node, before rebooting, execute command as the |zu|

   .. code:: console

      zextras$ carbonio prov -l ms $(zmhostname) zimbraMemcachedBindAddress ""

   Then reboot the Node.

#. If you are upgrading from older releases, two packages have been renamed.
   You must update them if they are still present in your infrastructure:

   * ``carbonio-message-dispatcher`` :fas:`arrow-right` ``carbonio-message-dispatcher-ce``
   * ``carbonio-storages``  :fas:`arrow-right` ``carbonio-storages-ce``

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Steps to upgrade renamed packages
      :columns: 12 12 12 12

      .. dropdown:: ``carbonio-message-dispatcher``
         :open:

         On the Node installing the |wsc| Component, remove
         package ``carbonio-message-dispatcher`` and install
         ``carbonio-message-dispatcher-ce``.

         .. include:: /_includes/_upgrade/package-dispatcher.rst

      .. dropdown:: ``carbonio-storages``
         :open:

         On the Node installing the Mailstore & Provisioning Component, remove
         package ``carbonio-storages`` and install
         ``carbonio-storages-ce``.

      .. include:: /_includes/_upgrade/package-storages-ce.rst

Run the ``pending-setups`` command to update Mesh information and reboot the node.
