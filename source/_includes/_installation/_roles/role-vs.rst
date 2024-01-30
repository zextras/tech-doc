
This Role consists of *Video Server* and *Video Recording*. You need
to install the latter only if you plan to record video meetings,
otherwise you can install *Video Server* without *Video Recording*.

.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. card:: Video Server
          
   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install carbonio-videoserver service-discover-agent

      .. tab-item:: RHEL
         :sync: rhel

         Before starting the procedure, install Fedora's epel-repository.

         .. code:: console

            # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

         Then, install the packages.

         .. code:: console

            # dnf install carbonio-videoserver service-discover-agent

   After the installation, make sure that the |vs| `public` IP address
   (i.e., the one that will accept incoming connections to the |vs|) is
   present in the configuration file :file:`/etc/janus/janus.jcfg` and
   add it if missing: find the variable ``nat_1_1_mapping`` and add it,
   for example: ``nat_1_1_mapping = "93.184.216.34"``

   Configure the |vs|
      
   .. code:: console

      zextras$ carbonio chats video-server add example.com port 8188 \
      servlet_port 8090 secret A_SECRET_PASSWORD


   Replace *example.com* with the actual domain name or IP, *8188* and
   *8090* with the ports associated with the |vs| and the recorder,
   respectively, and *A_SECRET_PASSWORD* with the value of the
   variable ``api_secret`` in file :file:`/etc/janus/janus.jcfg` on
   the Node installing the Video Server Role, for example::

        api_secret = "+xpghXktjPGGRIs7Y7ryoeBvW9ReS8RQ"
         
   Finally, enable and start the service with the commands

   .. code:: console

      # systemctl enable videoserver.service
      # systemctl start  videoserver.service


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


   The video-recording feature is enabled by default, and does not
   require configuration if installed together with the |vs|.  It does
   however require some manual command if installed at a later
   point. Please refer to Section :ref:`vs-record-meeting` for
   directions.

   The recorded sessions will be stored in directory
   :file:`/var/lib/videorecorder/` on the Node which features the
   Mailstore and Provisioning Role, because the ability to record
   requires a Node which features that Role. Make sure that the
   directory has sufficient free space, otherwise recorded videos can
   not be stored.

   .. hint:: You can mount on that location a dedicated disk or
      partition and keep it monitored for space usage.

