
In a Multi-Server environment the communication between the Nodes,
including the exchange of data, uses SSH and requires **SSH keys
exchange** to be set up for automatic, non-interactive
logins. Therefore, it is necessary to keep the keys always up-to-date
and synchronised, a task that can be accomplished by executing this
command *on all Nodes* as the |zu|

.. code:: console

   zextras$ /opt/zextras/bin/zmupdateauthkeys

This command carries out the following tasks:

* It generates the SSH keys for the Node, if they are not already
  present

* It distributes the keys on all other Nodes
