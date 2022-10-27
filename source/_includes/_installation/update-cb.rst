.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Bootstrap databases
~~~~~~~~~~~~~~~~~~~

Whenever a ``-db`` package is upgraded (currently they are
``carbonio-mailbox-db``, ``carbonio-files-db``, and
``carbonio-docs-connector-db``), remember to bootstrap the
corresponding Database, by running the corresponding command.

* mailbox
  
  .. code:: console

     # PGPASSWORD=DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

* |file|

  .. code:: console

     # PGPASSWORD=DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

* |docs|
  
  .. code:: console

     # PGPASSWORD=DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

In the above commands, |dbadmpwd| is the the password of the
``carbonio_adm`` database role, that is, the one created during
:ref:`Step 6 <config-db>` of the Single-Server installation or the
installation of :ref:`srv1-install` in the Multi-Server installation

Finally, since new version of |product| packages may include new
services, it is strongly suggested to execute the command

.. code:: console

   # pending-setups -a

This will register the services to |mesh|, so they can immediately be
used.

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


