.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

* update the list of packages

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt update

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf update

* upgrade the system

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt upgrade

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf upgrade

* or execute both task at once:

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt update && apt upgrade

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf update && dnf upgrade

.. note:: The system upgrade is optional, you can skip it.
