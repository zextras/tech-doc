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

       Before starting the procedure, install Fedora's epel-repository.
     
       .. code:: console

          # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

       Then, install the packages.
       
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

To complete the installation, first become the ``zextras`` user.

.. code:: console

   # su - zextras

Execute the following command to configure video recording.

.. code:: console

   zextras$ carbonio chats video-server add VS_IP port 8188 servlet_port 8090 secret VIDEOSERVER_PWD

Here, port **8188** is the default port used by |vs|, while **8090**
for recording. You may change these values according to your needs or
preferences, but take into account that the value of the
``servlet_port`` **must match** the one defined for |vs| in file
:file:`/etc/carbonio/videoserver-recorder/recordingEnv`.

Remember also to replace ``VS_IP`` with the public IP address of the |vs|.

.. hint:: In case you forget the password used for the video recording
   setup, (*VIDEOSERVER_PWD*), you can retrieve it using this command

   .. code:: console

      # grep -i -e nat_1_1 -e api_secret /etc/janus/janus.jcfg

For information about |vs|, advances settings, and recording
options, refer to Section :ref:`videoserver`.

Finally, enable |vs| at COS level, Video Recording, and the
possibility for each user to record meetings.

.. code:: console

   zextras$ carbonio config set cos default teamChatEnabled true
   zextras$ carbonio config set global teamVideoServerRecordingEnabled true
   zextras$ carbonio config set global teamMeetingRecordingEnabled true

.. note:: In the commands above, the policy allows every user to record a
   meeting. It is however possible to enforce this policy at user or
   COS level, to allow only selected users or members of a COS to
   record meetings.
