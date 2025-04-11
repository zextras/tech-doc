Starting from **25.3** release, the :file:`/etc/janus/janus.jcfg`
configuration file will be updated automatically to include the |vs|
`public` IP address (i.e., the one that will accept incoming
connections to the |vs|) using a :command:`curl` call.

.. rubric:: Different IPs for outgoing and incoming traffic

This might be incorrect in case the Node setup has different IP
addresses for incoming and outgoing traffic, for example:

* the incoming traffic to the |vs| node is routed using IP address
  **203.0.113.102**

* the outgoing traffic from the Node to the Internet is routed through
  IP address **203.0.113.105**

In cases like this one, the :command:`curl` call would return the
latter IP (i.e., **105**), but the actual IP in the configuration file
should be the former (**102**).


Therefore, after the installation, make sure that the correct `public`
IP address is present in the file: the line containing the
``nat_1_1_mapping`` variable should be::

  nat_1_1_mapping = "203.0.113.102"
