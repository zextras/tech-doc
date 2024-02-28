.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. warning:: Starting with version **23.6**, the Single-Server
   installation of |product| is **not supported** anymore. If you have
   a Single-Server Installation, you must add a few Nodes to your
   installation and redistribute the Roles on them, to ensure you
   continue to productively use |product|.

The upgrade to |version| impacts the following *Roles* or packages,
which require some manual interaction during the procedure. 

.. card:: Ubuntu Release 22.04
          
   |product| |version| supports also **Ubuntu 22.04**, so you can
   proceed with the upgrade from *Ubuntu 20.04* following the usual
   upgrade procedures: please refer to the upstream documentation for
   `Ubuntu <https://ubuntu.com/server/docs/upgrade-introduction>`_.

.. card:: PostgreSQL 16 support

   PostgreSQL can be upgrade from version **12** to version
   **16**. This step is **mandatory** if you also plan to upgrade from
   *Ubuntu 20.04* to **Ubuntu 20.04**, because version 12 is no longer
   available on Ubuntu 22.04. Please follow the instructions in
   section :ref:`pg-upgrade`.
