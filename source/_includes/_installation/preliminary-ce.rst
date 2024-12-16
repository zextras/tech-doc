In this section, we list some naming conventions we use in the
documentation and present some tasks you need to carry out on **each
of the Nodes** before starting with the actual installation.

Naming conventions
------------------

When deciding the names of the Nodes, we suggest to match the Node
name and the Role installed on it (or the main Role in case a Node
features multiple Roles), for example:

* **proxy1.example.com** is the (first) Proxy Node
* **mta1.example.com** is the (first) MTA Node
* similarly for other Nodes

By naming Nodes in this way, in case you have you have multiple nodes
featuring the same Role, or you want to expand your infrastructure,
you only need to increase the sequence number:

* **proxy2.example.com** becomes the second Proxy Node
* **mta2.example.com** becomes the second MTA Node
* similarly for other Nodes

Additionally, throughout this documentation, we will use **Proxy
Node(s)** to denote the Node(s) on which the Proxy Role is (are)
installed; **MTA Node** the Node featuring the MTA, and so on.

Configure repositories
----------------------

.. include:: /_includes/_installation/step-repo-conf.rst
.. include:: /_includes/_installation/repo-info.rst

Setting Hostname
----------------

.. include:: /_includes/_installation/steps-hostname.rst
