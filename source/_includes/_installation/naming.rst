
When deciding the names of the Nodes, we suggest to match the Node
name and the Component installed on it (or the main Component in case a Node
features multiple Components), for example:

* **proxy1.example.com** is the (first) Proxy Node
* **mta1.example.com** is the (first) MTA Node
* similarly for other Nodes

By naming Nodes in this way, in case you have you have multiple nodes
featuring the same Component, or you want to expand your infrastructure,
you only need to increase the sequence number:

* **proxy2.example.com** becomes the second Proxy Node
* **mta2.example.com** becomes the second MTA Node
* similarly for other Nodes

Additionally, throughout this documentation, we will use **Proxy
Node(s)** to denote the Node(s) on which the Proxy Component is (are)
installed; **MTA Node** the Node featuring the MTA, and so on.
