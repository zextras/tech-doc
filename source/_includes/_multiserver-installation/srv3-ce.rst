
Install Packages
++++++++++++++++

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-appserver \
           carbonio-storages-ce carbonio-tasks-ce
           
   .. tab-item:: RHEL
      :sync: rhel

      Make sure to respect the order of installation.

      .. code:: console

         # dnf install service-discover-agent 
         # dnf install carbonio-appserver
         # dnf install carbonio-storages-ce
         # dnf install carbonio-tasks-ce

Bootstrap |carbonio|
++++++++++++++++++++

Launch the |carbonio| bootstrap process

   .. code:: console

      # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from SRV1.

* ``Ldap master host`` is the FQDN of SRV1, srv1.example.com
* ``Ldap Admin password`` is obtained from SRV1 using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s zimbra_ldap_password"

Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh-agent.rst

