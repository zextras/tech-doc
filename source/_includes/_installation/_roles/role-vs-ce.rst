          
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-videoserver-ce service-discover-agent

   .. tab-item:: RHEL
      :sync: rhel

      Before starting the procedure, install Fedora's epel-repository.

      .. code:: console

         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

      Then, install the packages.

      .. code:: console

         # dnf install carbonio-videoserver-ce service-discover-agent

After the installation, make sure that the |vs| `public` IP address
(i.e., the one that will accept incoming connections to the |vs|) is
present in the configuration file :file:`/etc/janus/janus.jcfg` and
add it if missing: find the variable ``nat_1_1_mapping`` and add it,
for example::

  ``nat_1_1_mapping = "93.184.216.34"``

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable carbonio-videoserver.service
   # systemctl start  carbonio-videoserver.service
