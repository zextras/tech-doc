
Adding a Proxy node may prove useful in a number of scenarios and has
little impact on the |product| setup . However, it may require to
modify the existent company's infrastructure. Let's see a few
typical use cases and how they differ.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Two Proxy Nodes exposed on the Internet
      :columns: 6

      In this scenario, while both Proxy Nodes are directly reachable
      from the Internet, they have the same configuration and are not
      distinguishable. For this reason, it is necessary to place a
      load-balancer in front of them, which can be a firewall or a
      dedicated device, or even a web-server.

      .. note:: Depending on the load-balancer deployed, the OIP
         Address (i.e., the *Originating client IP address*) might be
         lost, so this solution might not be feasible if it is
         necessary to retain that information.

   .. grid-item-card:: Proxy Node for Internal Users
      :columns: 6

      In this case, the second Proxy Node is not reachable from the
      Internet and allows users who are in the local network (LAN),
      either physically or connected through a VPN, to connect to a
      dedicated Proxy. User that do not belong to the LAN will
      continue using the first Proxy Node as before.

      This setup does not require any load balancer, and on the second
      Proxy you can even configure the *Public Service Host Name* (see
      |adminui|'s :ref:`ap-domain-settings`) with the internal FQDN
      (i.e., *SRV12.example.com*).

   .. grid-item-card:: Proxy Node for Administrators
      :columns: 12

      This setup allows Administrators to connect to a dedicated Proxy
      Node. Similar to the previous case, the second Proxy Node only
      needs to expose port *6071*.

      .. note:: For security reasons, this scenario requires that the
         second Proxy node be reachable from the LAN only.
