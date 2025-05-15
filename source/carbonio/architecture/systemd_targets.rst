Carbonio Systemd Targets
========================

To facilitate modular deployment and management, Carbonio introduces four dedicated **systemd targets** 
that group services by host role.
Each target defines a set of related ``.service`` units and manages them 
as a logical group:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Target Name
     - Services Included
   * - ``carbonio-directory-server.target``
     - ``carbonio-configd``, ``carbonio-openldap``, ``carbonio-stats``
   * - ``carbonio-appserver.target``
     - ``carbonio-configd``, ``carbonio-appserver-db``, ``carbonio-appserver``, ``carbonio-stats``
   * - ``carbonio-proxy.target``
     - ``carbonio-configd``, ``carbonio-memcached``, ``carbonio-nginx``, ``carbonio-stats``
   * - ``carbonio-mta.target``
     - ``carbonio-configd``, ``carbonio-postfix``, ``carbonio-opendkim``, ``carbonio-antivirus``, etc.

Two key units ( ``carbonio-configd.service`` and ``carbonio-stats.service`` ) are shared across all targets 
and play foundational roles in configuration generation and monitoring.