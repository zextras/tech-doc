.. _up-old:

From Older Versions
===================

This section guides you in the upgrade from a |product| version older
than **24.12** to the latest available version, |release|, which
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

* Since release **24.3.0**, two major improvements have become
  available for |product|:

  #. support for new Operating Systems (OS): **Ubuntu 22.04** and **RHEL 9**
  #. support for **PostgreSQL 16**. |product| :red:`no longer
     supports` PostgreSQL **12**, which must be upgraded to version
     **16** before upgrading |product| to |version|. Check section
     :ref:`pg-upgrade` for directions.

* Since **release 25.6.0**, support for **Ubuntu 24.04** has been
  added, while support for **Ubuntu 20.04** has been dropped:
  |product| **does no longer work** on Ubuntu 20.04

* You need to carry out the procedure on **each Node**, starting with
  the one featuring the :ref:`component-mesh-install`

* During the upgrade of |product|, you might need to carry out manual
  tasks, for example because you need to modify some configuration
  file or some error or warning is shown. Please refer to Section
  :ref:`ts-up-older` in :doc:`Upgrade Troubleshooting
  </troubleshooting/upgrade>` for directions on how to tackle and fix
  them.

.. include:: /_includes/_upgrade/ubuntu-deprecation.rst

Checklist
---------

The following packages should be renamed or moved to different nodes during the upgrade procedure:

#. carbonio-user-management
#. carbonio-storages
#. carbonio-catalog
#. carbonio-message-broker
#. carbonio-message-dispatcher

Upgrade |product|
-----------------

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/first-part-ce.rst

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Install or move packages
      :columns: 12 12 12 12

      The following packages needs to be moved from one Node to
      another or installed on the given Node.

      .. dropdown:: ``carbonio-user-management``
         :open:

         .. include:: /_includes/_upgrade/package-um.rst

      .. dropdown:: ``carbonio-catalog``
         :open:

         .. include:: /_includes/_upgrade/package-catalog.rst

      .. dropdown:: ``carbonio-message-broker``
         :open:

         .. include:: /_includes/_upgrade/package-broker.rst

.. include:: /_includes/_upgrade/second-part-ce.rst

Other Upgrades
--------------

#. If you want to upgrade PostgreSQL, but not the OS, you need to
   follow directions in :ref:`pg-upgrade` before upgrading |product|

#. If you want to upgrade the OS, you **must** upgrade PostgreSQL as
   well, since PostgreSQL 12 is not supported in either Ubuntu 22.04
   or RHEL 9. This is the most time-consuming resource, because you
   need to carry out multiple tasks. Please refer to Section
   :ref:`os-upgrade` for directions.
