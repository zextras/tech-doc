Install Packages
++++++++++++++++

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-advanced

   .. tab-item:: RHEL
      :sync: rhel

      Make sure to respect the order of installation.

      .. code:: console

         # dnf install service-discover-agent
         # dnf install carbonio-advanced

Bootstrap |carbonio|.
+++++++++++++++++++++

Launch the |carbonio| bootstrap process

   .. code:: console

      # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from SRV1.

.. include:: /_includes/_multiserver-installation/bootstrap-passwords.rst

Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh-agent.rst
