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

.. rubric:: VideoServer not exposed to the Internet (LAN-only deployments)

In some deployment scenarios, the VideoServer is **not publicly
exposed**, and video meetings take place only between peers within the
same local network (LAN).

In these cases, the automatically configured `public` IP address is not
suitable and may cause connectivity issues.

**Required action**

When the VideoServer is not exposed externally, the
``nat_1_1_mapping`` parameter **must be manually set to the private IP
address** of the host where the VideoServer component is installed.

For example:

.. code-block:: ini

  nat_1_1_mapping = "192.168.1.50"

.. rubric:: Apply changes after updating janus.jcfg

After each change to the ``nat_1_1_mapping`` parameter in the
:file:`/etc/janus/janus.jcfg` configuration file, restart the
VideoServer service to apply the new IP address.

