.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv3 - MTA - mailsystem
   
On this node we install the MTA, which is the actual software which
sends and receives emails.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-mta
 
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-agent carbonio-mta

These following tasks must be executed to configure the MTA.

#. Bootstrap |carbonio|

   .. code:: console

      # carbonio-bootstrap

   In the bootstrap menu, use |srv2h|, |ldappwd|,
   |postfixpwd|, and |amavispwd| in the following items to
   complete successfully the bootstrap.

   * ``Ldap master host``: |srv2h|
   * ``Ldap Admin password``: |ldappwd|
   * ``Bind password for postfix ldap user``: |postfixpwd|
   * ``Bind password for amavis ldap user``: |amavispwd|

#. Run |mesh| setup using |meshsec|

   .. code:: console

      # service-discover setup-wizard

   Since this node is not the |mesh| Server, the
   :file:`cluster-credentials.tar.gpg` file will be automatically
   downloaded.

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

   .. hint:: The **secret** needed to run the above command is stored
      in file :file:`/var/lib/service-discover/password` which is
      accessible only by the ``root`` user.

.. card::

   Values used in the next steps
   ^^^^

   * |mtaip| the IP address of this node
