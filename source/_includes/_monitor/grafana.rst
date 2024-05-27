There are a number of predefined Grafana dashboards that use metrics
gathered by Prometheus to show in real-time the situation of a service
or of the system and its evolution. In this section we give an
overview of these dashboards.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Mailbox Load Monitoring
      :columns: 6

      This dashboard includes a number of information about average
      processing time, threads, requests, SOAP sessions, LMTP, and
      many more. Its purpose is to provide an easy tracking of the mailbox
      load and the resources used.

   .. grid-item-card::
      :columns: 6

      .. image:: /img/monitoring/mailbox-load.jpg

   .. grid-item-card:: Node Resources Monitoring
      :columns: 6

      A simple dashboard that displays information about the resources
      used by the system, including CPU, RAM, Network, and Disk usage.

   .. grid-item-card::
      :columns: 6

      .. image:: /img/monitoring/resources.jpg

   .. grid-item-card:: Virtual Machines Monitoring
      :columns: 6

      This dashboard relies on the *Prometheus Node Expoter*, the tool
      that exposes a wide variety VM-related metrics, to monitor
      system parameters and resource used by the virtual machine: CPU,
      RAM, Disk, Network, Disk I/O, and many more.

      For a more thorough overview of the virtual machine, the
      ``carbonio-prometheus-process-exporter`` can be installed.

   .. grid-item-card::
      :columns: 6

      .. image:: /img/monitoring/vm.jpg
