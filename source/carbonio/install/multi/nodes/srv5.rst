

.. _srv5-install:

SRV5: |vs| and Video Recording
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3

   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "8GB + ~1MB for each connected user"
         "Disk Space", "30GB"
         "IP Address", "172.16.0.15"
         "FQDN", "srv5.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * |vs|
      * |vs| Recording

   .. grid-item-card:: Network
      :columns: 6 

      - A public IP address. This is either the IP address of |vs|, if
        it is directly accessible from remote clients on the Internet,
        or—​if there is a NAT-ting device in front of it (e.g., a
        firewall or router)--the IP address with which the |vs| is
        reachable.

      -  A publicly resolvable FQDN

      -  With the default settings, 200kb/s (0.2 mb/s) bandwidth for each
         connected user

      -  WebSockets support

   .. grid-item-card:: Ports
      :columns: 6 

      - The mailbox server will establish a WebSocket on port 8188
        (TCP) to communicate with the |vs|

      - Connecting browsers will use a random UDP port between 20000
        and 40000 on the public IP of the |vs|
   

.. include:: /_includes/_multiserver-installation/srv5.rst
