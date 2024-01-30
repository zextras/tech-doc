Grafana Installation
++++++++++++++++++++

Before installing Grafana, download the Grafana GPG key, add it to
your APT installation's list of trusted keys and put the Grafana
repository to your APT sources

.. code:: console

   # wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
   # add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

Install Grafana

.. code:: console

   # apt update
   # apt install grafana 

Start Grafana service and check Grafana status. If everything is work
correctly, you can enable the service to automatically start Grafana
on boot

.. code:: console

   # systemctl start grafana-server
   # systemctl status grafana-server
   # systemctl enable grafana-server

Log in to Grafana
+++++++++++++++++

The Grafana portal can be reached on port 3000 of the node on which
you installed the Monitoring Role, we assume it is called
http\://srvmon.example.com:3000/.

You can log in for the first time with these credentials: **user** =
``admin`` / **password** = ``admin``

.. hint:: After the first login don't forget to change the password
   for the account.

Grafana Plugins Installation
++++++++++++++++++++++++++++

Some dasboards require a plugin to work, so we install them:

#. Worldmap panel

   .. code:: console

      # grafana-cli plugins install grafana-worldmap-panel

#.  Treemap panel

    .. code:: console

       # grafana-cli plugins install marcusolsson-treemap-panel

#. Restart Grafana to use the new plugins:

   .. code:: console

      # systemctl restart grafana-server

Grafana datasource config
+++++++++++++++++++++++++


#. Open the Grafana web interface athttp\://srvmon.example.com:3000/

#. Log in to Grafana using your credentials

#. In the left sidebar, click **Connections**, then select **Data Sources**

#. Click **Add new data source**

#. Choose *Prometheus* as the type. In the list of available data
   sources, find and select "Prometheus” and and enter a name

   .. hint:: To prevent conflicts in the future, use a meningful name,
      for example **carbonio-prometheus**.

#. Configure Prometheus connection. Fill in the required fields for
   Prometheus, including the URL for your Prometheus server (e.g.,
   http://localhost:9090).

#. Click the "Save & Test" button to verify that the Prometheus
   connection was configured correctly. If the connection is
   successful, save the data source.

Import Carbonio dashboards
++++++++++++++++++++++++++

A dashboard in Grafana is a visual representation of data designed to
provide a comprehensive and real-time overview of various metrics and
information.  Dashboards are customizable and can contain panels that
display graphs, tables, heatmaps, and other visualizations based on
the data queried from connected data sources. |zx| created some 
specific dashboards necessary for comfortable monitoring, they can be
easily imported from the Grafana marketplace as follows

#. Access the Grafana web interface

#. In the left sidebar, select “Dashboards" 

#. Click  "New" → “Import“ to open the import page.

#. Paste the dashboard ID you want to import.

#. Click "Load" to have the system retrieve information about the
   dashboard.

#. If necessary, configure import parameters such as selecting a data
   source and other options.

#. Click "Import" to complete the import process.

#. After a successful import, go to the "Dashboards" section and
   select the imported dashboard to view it.

These steps will allow you to quickly import a dashboard into Grafana using its unique ID.

.. card:: List of Grafana dashboards and IDs

   .. list-table:: 
      :widths: 25 25 40
      :header-rows: 1

      * - Dashboard
        - Description
        - ID
      * - **Node Exporter Full**
        - Standard dashboard
        - 1860
      * - **Carbonio MTA queues**
        - Information about MTA queues: statuses, size
        - 20029
      * - **Carbonio Mailbox**
        - Information about the  mailbox like load, protocols, counters and db 
        - 20027
      * - **NGINX exporter**
        - Standard dashboard from Grafana
        - 12708
      * - **Carbonio Service Discover status**
        - Contains data about infrastructure, servers and services in the consul, allows you to monitor the health of servers and services.
        - 20032
      * - **Carbonio PostgreSQL**
        - Based on Grafana "PostgreSQL Database" dashboard. Fixed dashboard
        - 20030
      * - **Carbonio Processes**
        - Contains a memory and cpu map panel which shows latest resident memory and cpu map , it's helpful to check top processes that consume a lot
          of memory and CPU immediately, also includes the information from node exporters and about processes
        - 20034
      * - **Carbonio MariaDB**
        - MariaDB Overview Innodb, I/O, Waits, Connections and so on
        - 20061
