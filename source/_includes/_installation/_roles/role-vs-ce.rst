.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-videoserver-ce

   .. tab-item:: RHEL
      :sync: rhel

      Then, install the packages.

      .. code:: console

         # dnf install carbonio-videoserver-ce

Starting from **25.3** release, the :file:`/etc/janus/janus.jcfg`
configuration file will be updated automatically to include the |vs|
`public` IP address (i.e., the one that will accept incoming
connections to the |vs|) using a :command:`curl` call.

However, this may be not true in case the Node setup has a different
IP address for incoming and outgoing traffic, for example if the
incoming traffic is routed to the |vs| node using IP address
203.0.113.102 and the outgoing traffic from the Node to the Internet
is routed through IP address 203.0.113.105, the :command:`curl` call
would return the latter IP (105), but the actual IP in the
configuration file should be the former (102).


Therefore, after the installation, make sure that the correct `public`
IP address is present in the file: the line containing the
``nat_1_1_mapping`` variable should be::

  nat_1_1_mapping = "203.0.113.102"

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable carbonio-videoserver.service
   # systemctl start  carbonio-videoserver.service
