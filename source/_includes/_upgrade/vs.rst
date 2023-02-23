.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The upgrade of |vs| requires to manually change a token used for its
correct working. First, upgrade the node like described in
:ref:`upgrade-single`.

Then, execute the following command:

.. code:: console

   # echo "carbonio chats video-server add $(hostname -f) port 8188 \
   secret $(grep api_secret /etc/janus/janus.jcfg | cut -f 2 -d '"')"

The output will look similar to::

  carbonio chats video-server add mail.example.com port 8188 secret LMGZjsaH9mtyH9mtyCCyOUvCqS51okub

Copy that command and, if you are on a Single-server, execute it right
before rebooting the node, while if you are on a Multi-Server
installation, execute it on one node on which the AppServer is
installed (hence, either on **SRV5** or on **SRV6**), after that node
has been upgraded.
