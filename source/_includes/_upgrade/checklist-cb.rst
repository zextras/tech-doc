.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The upgrade to |version| impacts the following *Roles*, packages, or
third-party software, which require some manual interaction before,
during, or after the procedure.

.. card:: Operating system
 
   |product| can be installed on **Ubuntu 22.04** and **RHEL 9**
   (|beta| support) since version **24.5.0**.  If you plan to upgrade
   both the OS and |product|, please refer to Section
   :ref:`os-upgrade`.
      
.. card:: PostgreSQL 16 support

   PostgreSQL can be upgraded from version **12** to version
   **16**. This step is **mandatory** if you also plan to upgrade from
   *Ubuntu 20.04* to **Ubuntu 22.04**, because version 12 is no longer
   available on Ubuntu 22.04. Please follow the instructions in
   section :ref:`pg-upgrade`.

   .. warning:: PostgreSQL 12 will reach the End Of Life on `14th
      November 2024 <https://www.postgresql.org/support/versioning/>`_
      end of the year, so make sure to plan its upgrade before that
      date!
