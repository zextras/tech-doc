.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install carbonio-videoserver-advanced \
         carbonio-videorecorder

      .. note:: You need to install package ``carbonio-videorecorder``
	 only if you plan to record video meetings.

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install carbonio-videoserver-advanced \
         carbonio-videorecorder

      .. note:: You need to install package ``carbonio-videorecorder``
	 only if you plan to record video meetings.

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-videoserver-advanced \
         carbonio-videorecorder

      .. note:: You need to install package ``carbonio-videorecorder``
	 only if you plan to record video meetings.

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-videoserver-advanced \
         carbonio-videorecorder

      .. note:: You need to install package ``carbonio-videorecorder``
	 only if you plan to record video meetings.

.. card:: Janus configuration

   .. include:: /_includes/_installation/note-janus.rst

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable carbonio-videoserver.service
   # systemctl start  carbonio-videoserver.service
