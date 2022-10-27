.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Bootstrap database
~~~~~~~~~~~~~~~~~~
   
Whenever a ``-db`` package is upgraded (currently only
``carbonio-files-db``), remember to bootstrap its corresponding
database, by running the  command

.. code:: console

   # PGPASSWORD=DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

In the above command, |dbadmpwd| is the the password of the
``carbonio_adm`` database role, that is, the one created during
:ref:`Step 6 <config-db>` of the Single-Server installation or the
installation of :ref:`srv1-install` in the Multi-Server installation

Finally, since new version of |product| packages may include new
services, it is strongly suggested to execute the command

.. code:: console

   # pending-setups -a

This will register the services to |mesh|, so they can immediately be
used.

.. hint:: The **secret** needed to run the above command is stored in
   file :file:`/var/lib/service-discover/password` which is accessible
   only by the ``root`` user.

Administration console packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you are upgrading to version **22.10.0**, make sure to install also
the packages for the brand new Administration console:

      
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-admin-console-ui carbonio-admin-ui


   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-admin-console-ui carbonio-admin-ui


