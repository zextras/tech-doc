.. _up-old:

Manual From Older Versions
==========================

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

* From release 24.12.0, the **DB connector Role** is no longer
  supported and needs to be removed, therefore before starting the
  upgrade procedure please read carefully section :ref:`remove-pgpool`
  and execute the procedure described there.

* Since the **24.3.0** release, two major improvements have become
  available for |product|:

  #. support for new Operating Systems (OS): **Ubuntu 22.04** and **RHEL 9**
  #. support for **PostgreSQL 16**. Make sure to upgrade it, because
     **PostgreSQL 12** went in End Of Life on **14th November 2024**.

  .. hint:: While you can choose to upgrade only |product|, we
     encourage you to introduce both the improvements into your
     infrastructure.

* You need to carry out the procedure on **each Node**, starting with
  the one featuring the :ref:`role-mesh-install`.

* During the upgrade of |product|, you might need to carry out manual
  tasks, for example because you need to modify some configuration
  file or some error or warning is shown. Please refer to Section
  :ref:`ts-up-older` in :doc:`Upgrade Troubleshooting
  </troubleshooting/upgrade>` for directions on how to tackle and fix
  them.

.. include:: /_includes/_upgrade/ubuntu-deprecation.rst

Checklist
---------

The new packages or packages that should be moved on different nodes,
should be installed or moved during the upgrade procedure:

#. carbonio-user-management
#. carbonio-storages
#. carbonio-catalog
#. carbonio-message-broker

Upgrade |product|
-----------------

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/first-part-cb.rst

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Install or move packages
      :columns: 12 12 12 12

      The following packages needs to be moved or installed on the node

      .. dropdown:: ``carbonio-user-management``
         :open:

         .. include:: /_includes/_upgrade/package-um.rst

      .. dropdown:: ``carbonio-user-storages``
         :open:

         .. include:: /_includes/_upgrade/package-storages.rst

      .. dropdown:: ``carbonio-catalog``
         :open:

         .. include:: /_includes/_upgrade/package-catalog.rst

      .. dropdown:: ``carbonio-message-broker``
         :open:

         .. include:: /_includes/_upgrade/package-broker.rst

.. include:: /_includes/_upgrade/second-part-cb.rst

Other Upgrades
--------------

#. If you want to upgrade PostgreSQL, but not the OS, you need to
   follow directions in :ref:`pg-upgrade` before upgrading |product|

#. If you want to upgrade the OS, you **must** upgrade PostgreSQL as
   well, since PostgreSQL 12 is not supported in either Ubuntu 22.04
   or RHEL 9. This is the most time-consuming resource, because you
   need to carry out multiple tasks. Please refer to Section
   :ref:`os-upgrade` for directions.
