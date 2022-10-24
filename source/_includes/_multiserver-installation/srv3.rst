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

   .. include:: /_includes/_installation/bootstrap.rst

   In the bootstrap menu, use ``SRV2_hostname``, ``LDAP_PWD``,
   ``POSTFIX_PWD``, and ``AMAVIS_PWD`` in the following items to
   complete successfully the bootstrap.

   * ``Ldap master host``: ``SRV2_hostname``
   * ``Ldap Admin password``: ``LDAP_PWD``
   * ``Bind password for postfix ldap user``: ``POSTFIX_PWD``
   * ``Bind password for amavis ldap user``: ``AMAVIS_PWD``

#. Copy the credentials from the |mesh| server node (SRV2) to the
   local server

   .. code:: console

      # scp root@[SRV2_IP]:/etc/zextras/service-discover/cluster-credentials.tar.gpg \
        /etc/zextras/service-discover/cluster-credentials.tar.gpg

   .. hint:: the SRV2_IP can be retrieved using command :command:`su -
      zextras -c "carbonio prov gas service-discover"`

#. Run |mesh| setup using ``MESH_SECRET``

   .. code:: console

      # service-discover setup-wizard --first-instance

#. Complete |mesh| setup

   .. code:: console

      # pending-setups -a

.. card::

   Values used in the next steps
   ^^^^

   * ``MTA_IP``: the IP address of this node
