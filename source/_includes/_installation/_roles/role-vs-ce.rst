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

.. card:: Janus configuration

   .. include:: /_includes/_installation/note-janus.rst

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable carbonio-videoserver.service
   # systemctl start  carbonio-videoserver.service
