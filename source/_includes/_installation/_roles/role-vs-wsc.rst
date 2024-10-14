This Role consists of *Video Server (WSC)* and *Video Recording*. You need
to install the latter only if you plan to record video meetings,
otherwise you can install *Video Server* without *Video
Recording*. For this reason we split this Role's installation in two parts.

.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. card:: Video Server

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install carbonio-videoserver-advanced service-discover-agent

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install carbonio-videoserver-advanced service-discover-agent

