.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| does not need any installer, but whenever new versions are
released, the repositories are updated and packages are available for
installation along with the other system updates.  Therefore, to
upgrade |product|, first check for new packages:

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt update

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf update

Then choose either way of upgrading:

.. grid:: 1 1 1 2
   :gutter: 3
   
   .. grid-item-card:: Upgrade |product| packages
      :columns: 12 12 12 6
                
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install "carbonio-*"

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install "carbonio-*"

   .. grid-item-card:: Upgrade the whole system
      :columns: 12 12 12 6

      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

   .. grid-item:: 
      :columns: 12 12 12 12

      .. hint:: Even if you choose to upgrade only |product|, remember
         that you should keep the whole system up to date, because new
         system packages may contain security fixes or bug fixes.

Finally, since new version of |product| packages may include new
services, it is strongly suggested to execute the command

.. code:: console

   # pending-setups

This will register the services to |mesh|, so they can immediately be
used.

