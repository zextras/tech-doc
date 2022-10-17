.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _update_ssh_keys:

Update Multi-Server SSH keys
----------------------------

The communication between the nodes, including the exchange of data,
uses SSH and requires **SSH keys** to be set up for automatic,
non-interactive logins. Therefore, it is necessary that the keys are
always up-to-date and synchronised. In order to update the keys, this
command must ebe executed *on all nodes*:

.. code:: bash

   # su - zextras -c "/opt/zextras/bin/zmupdateauthkeys"
