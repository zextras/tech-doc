.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The upgrade of |vs| requires to manually fix a problem related to the
|vs| token that would make the |vs| unusable. First, get all the
necessary information:

.. code:: console

   # echo "carbonio chats video-server add $(hostname -f) port 8188 \
   secret $(grep api_secret /etc/janus/janus.jcfg | cut -f 2 -d '"')"

The output of this command will look similar to::

  carbonio chats video-server add mail.example.com port 8188 secret LMGZjsaH9mtyH9mtyCCyOUvCqS51okub

Copy that command (on a Multi-Server installation, execute it on the
node on which the |vs| is installed) and execute it: the |vs| will be
again operational.
