.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


During the |vs| upgrade process, you will be prompted with a message
mentioning that the configuration file :file:`/etc/janus/janus.cfg` is
going to be modified and asking how you want to proceed (whether to
keep the current version, overwrite with the new configuration,
showing the differences between the versions, and so on. You actually need to
*keep the actual version*, so press the :kbd:`N` key  to proceed.


.. card:: Troubleshooting |vs| upgrade

   If you kept the previous version of the configuration file, the
   upgrade procedure was successful and you should be done. You can
   check the status of the |vs| by running command

   .. code:: console

      zextras$ carbonio chats clusterstatus

   If the output shows that the |vs| is online, then it is working
   correctly.

   In case the |vs| does not work after rebooting the node, you need
   to update the token, a task you can do from the CLI. You need to
   carry out a command that will be the output of command

   .. code:: console

      # echo "carbonio chats video-server add $(hostname -f) port 8188 \
      secret $(grep api_secret /etc/janus/janus.jcfg | cut -f 2 -d '"')"

   The output will look similar to::

     carbonio chats video-server add mail.example.com port 8188 secret LMGZjsaH9mtyH9mtyCCyOUvCqS51okub

   Copy that command and, if you are on a Single-server, execute it
   right before rebooting the node, while if you are on a Multi-Server
   installation, execute it as the ``zextras`` user on one node on
   which the AppServer is installed (hence, either on **SRV5** or on
   **SRV6**), after that node has been upgraded.
