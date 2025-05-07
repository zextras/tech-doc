This Component consists of *Video Server* and *Video Recording*. You need
to install the latter only if you plan to record video meetings,
otherwise you can install *Video Server* without *Video
Recording*. For this reason we split this Component's installation in two
parts.

The Video Server Component requires that the :ref:`role-prov-install` be
already installed, because you need to execute a command on the Node
hosting that Component to configure the Video Server.

.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. card:: Video Server

   .. include:: /_includes/_installation/_packages/role-vs.rst

   .. include:: /_includes/_installation/note-janus.rst

   .. rubric:: Configure the |vs|

   During the installation, a command similar to the one below is
   displayed. Copy it and execute on the Node on which the
   :ref:`role-prov-install` is installed.

   .. code:: console

      zextras$ carbonio chats video-server add videoserver.example.com port 8188 \
      secret A_SECRET_PASSWORD


   Replace *example.com* with the actual domain name or IP, *8188* the
   port associated with the |vs|, respectively, and
   *A_SECRET_PASSWORD* with the value of the variable ``api_secret``
   in file :file:`/etc/janus/janus.jcfg` on the Node installing the
   Video Server Component, for example::

        api_secret = "+xpghXktjPGGRIs7Y7ryoeBvW9ReS8RQ"

   Finally, enable and start the service with the commands

   .. code:: console

      # systemctl enable videoserver.service
      # systemctl start  videoserver.service


.. card:: Video Recording

   .. include:: /_includes/_installation/_packages/role-vr.rst

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

   A recorded session is temporary stored in directory
   :file:`/var/lib/videoserver/` on the Node featuring the |vs| Component:
   make sure that this directory has sufficient free space, otherwise
   recorded videos can not be stored. As soon as the recording session
   terminates, the file will be processed and moved to the Node
   featuring the :ref:`role-prov-install`.

   .. hint:: You can mount on that location a dedicated disk or
      partition and keep it monitored for space usage.
