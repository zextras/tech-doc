.. _upgrade-other:

Third-party Software Upgrades
=============================

.. _upgrade-os:

OS upgrade
----------

In order to upgrade from a |product| |prev| on Ubuntu 20.04 (or
RHEL 8) to |product| |release| on Ubuntu 22.04 (or RHEL 9) you need to
follow the procedure in this section. Please read carefully the whole
section before starting the upgrade.

The procedure must be carried out on each Node, starting from the one
on which the Directory Server Role is installed, and it will require
to reboot the Node and therefore a downtime of the |product|
infrastructure must be planned.

.. include:: /_includes/_upgrade/os.rst
             
.. _pg-upgrade:

PostgreSQL 16 Upgrade
---------------------

.. include:: /_includes/_upgrade/pg.rst
