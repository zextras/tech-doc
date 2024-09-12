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

   During the installation of the packages, you need to insert the IP
   `public` address (i.e., the one that will accept incoming
   connections to the |vs|) on which the |vs| is installed.

   After the installation, make sure that the IP address is present in
   the configuration file :file:`/etc/janus/janus.jcfg` and add it if
   missing: find the variable ``nat_1_1_mapping`` and add it, for
   example: ``nat_1_1_mapping = "93.184.216.34"``

.. card:: Video Recording

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install carbonio-videoserver-recorder

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install carbonio-videoserver-recorder

   The following manual command is required if the Video Recorder is
   installed at a later point. Make sure to use the same FQDN
   (videoserver.example.com) and secret (A_SECRET_PASSWORD) used to
   configure the |vs|.

   .. hint:: *A_SECRET_PASSWORD* is saved as the value of
      ``api_secret`` in file :file:`/etc/janus/janus.jcfg` (e.g.,
      example ``api_secret = "+xpghXktjPGGRIs7Y7ryoeBvW9ReS8RQ")``.

   .. code:: console

      zextras$ carbonio chats video-server update-servlet videoserver.example.com:8188 8090

   You can then enable the Video Recorder on a user, COS, or global
   level, please refer to section :ref:`vs-recorder-conf` for
   directions.

   The recorded sessions will be stored in directory
   :file:`/var/lib/videorecorder/` on the Node which features the
   :ref:`role-prov-install` Role, because the ability to record
   requires a Node which features that Role. Make sure that the
   directory has sufficient free space, otherwise recorded videos can
   not be stored.

   .. hint:: You can mount on that location a dedicated disk or
      partition and keep it monitored for space usage.
