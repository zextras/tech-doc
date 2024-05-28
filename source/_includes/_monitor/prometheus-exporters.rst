
.. csv-table:: List of Available Prometheus Exporters
   :widths: 45 45 10
   :header: "Exporter", "Role", "Port"

   "carbonio-prometheus-consul-exporter", "Mesh and Directory", "9107"
   "carbonio-prometheus-openldap-exporter", "Mesh and Directory", "9330"
   "carbonio-prometheus-mysqld-exporter", "Mailstore & Provisioning", "9104"
   "carbonio-prometheus-nginx-exporter", "Proxy", "9113"
   "carbonio-prometheus-node-exporter", "Every |product| node", "9100"
   "carbonio-prometheus-postgres-exporter", "Database", "9187"
   "carbonio-prometheus-process-exporter", "As desired [#f1]_", "9256"
   "carbonio-prometheus-clamav-exporter", "MTA AV/AS", "9810"
   "carbonio-prometheus-pgpool-exporter", "Database connector [#f2]_", "9719"

.. [#f1] This exporter extracts metrics from various services and
         daemon running on a system; install it for a more thorough
         overview of a Node.

.. [#f2] This exporter must be installed **after** the PostgreSQL exporter.
