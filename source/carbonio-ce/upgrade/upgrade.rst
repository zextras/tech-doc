.. _upgrade-manual:

Upgrade From 24.7 or 24.9
=========================

.. include:: /_includes/_upgrade/intro-ce.rst

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.


.. _upgrade-nodes:

Upgrade Nodes
-------------

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/node-ce.rst

.. _upgrade-prev:

Upgrade from 24.9.0
-------------------

If you upgrade from 24.9.0, there is no know issue that impacts either
the upgrade process to |product| |version| or the |product| operations
afterwards.

..  If you upgrade from 24.9.0, please also check Section
   :ref:`ts-up-prev` for known issues impacting the upgrade process.

.. _up-prev-req:

Requirements & Preliminaries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This upgrade procedure requires that **PostgreSQL 16** be
installed. If you did not yet upgrade it, please refer to Section
:ref:`pg-upgrade`.

.. No specific requirement is required to upgrade to |product|
   |version|.

.. _upgrade-older:

Upgrade from Older Versions
---------------------------

If you plan to upgrade from a version older than 24.9.0, you **may
encounter** issues or need to carry out tasks or command that are
reported in Section :ref:`ts-up-older`.

.. _up-older-req:

Requirements & Preliminaries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This upgrade procedure requires that **PostgreSQL 16** be
installed. If you did not yet upgrade it, please refer to Section
:ref:`pg-upgrade`.
