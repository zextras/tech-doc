.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

:ref:`videoserver` is |carbonio| component that provides
video-conferencing and video-recording functionalities to
|team|. Since it is not installed by default, you need to install
it separately.

.. tab-set::

    .. tab-item:: Ubuntu
       :sync: ubuntu

       .. code:: console

          # apt install carbonio-videoserver carbonio-videoserver-recorder

    .. tab-item:: RHEL
       :sync: rhel

       .. code:: console

          # dnf install carbonio-videoserver carbonio-videoserver-recorder

.. note:: During the installation, you will be asked for a command to
   be executed.

Once the package has been successfully installed, you will be asked
for the **public IP Address** of |vs|: enter it, then execute the
following commands to start the service.

.. code:: console

   # systemctl enable videoserver.service
   # systemctl start  videoserver.service

Finally, the following commands enable video recording and must be
executed as the ``zextras`` user.

.. code::

   # su - zextras
   # zxsuite chats video-server add example.com port 8100 servlet_port 8090 secret VIDEOSERVER_PWD
   # zxsuite config set global teamVideoServerRecordingEnabled true
   # zxsuite config set cos default teamChatEnabled true

Here, port **8100** is the default port used by |vs|, while **8090**
for recording. Change these values according to your needs or
preferences, but take into account that the value of the
``servlet_port`` **must match** the one defined for |vs| in file
:file:`/etc/carbonio/videoserver-recorder/recordingEnv`.

Remember also to replace **example.com** with your domain name.

.. hint:: In case you forget the password used for the video recording
   setup, (*VIDEOSERVER_PWD*), you can retrieve it using this command

   .. code:: console

      # grep -i -e nat_1_1 -e api_secret /etc/janus/janus.jcfg

For information about |vs|, advances settings, and recording
options, refer to Section :ref:`videoserver`.
