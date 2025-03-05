
HA Script for Account Promotion
===============================

Our HA tool, named **habeat**, is developed in Python to ensure seamless
account promotion with high availability.

Build
-----

Download HA Beat tool from here: --- WAITING URL ---

.. intanto ti dico come risolveremo uno dei 2 WAINTING dell'HA ...
   mi ha chiesto Lorenzo di integrare quei prechecks con gli attuali requirements
   quindi una volta fatto basterà mettere un link ai requirements ... e quello è sistemato


Deploy
------

To deploy habeat you can use preferable utility. For example ``scp``:

.. code:: console

   scp habeat root@deploy_server:/usr/local/sbin/habeat
   ssh root@deplot_server "mkdir -p /etc/hamon"
   scp config/habeat.yml root@deplot_server:/etc/hamon

To configure habeat you need to add 2 units to systemd service:

-  habeat.service - service that should perform call of script

-  habeat.timer - timer for define how often to run the script

.. code:: console

   scp config/habeat.service root@deplot_server:/etc/systemd/system/
   scp config/habeat.timer root@deplot_server:/etc/systemd/system/
   ssh root@deplot_server "systemctl daemon-reload"

In the habeat.timer we can define condition of excecution:

.. code:: console

   OnCalendar=\*:0/5 # Run script every 5 minutes

In the habeat.service we define we script is placed, where to store the log and where placed configuration file:

.. code:: console

   ExecStart=/usr/local/sbin/habeat --config /etc/hamon/habeat.yml --log /var/log/habeat.log

Configure
---------

The example of file:

.. code:: console

   local:
     whoami: "secondary" # marker on which dc script is running
     dc_check: "primary" # marker which dc script should check
     role: "appserver" # supported roles: appserver or consulserver or proxyserver
     checkDownFile: "/var/tmp/appserverdown-habeat" # template for lock file related with down state
     checkPromotionFile: "/var/tmp/appserverprom-habeat" # template for lock file related with promotion state
     checkRestartReplicaFile: "/var/tmp/appserverrstopha" #only app server lock file for restart replica lock file
     provider: consul # provider for external witness: hetrix or vcenter
     threads: 5 # carbonio ha promotion number of threads
     proxy_switch: "bgp" # proxy switch tool: bgp
     proxy_enable_activate: false # enable run proxy switch
     proxy_enable_deactivate: false # enable run proxy reverse switch
     disable_ha_module: false # define if another app server down stop ha module of Carbonio
     flush_cache: false # define if we need flush cache for accounts after promotion
     flush_arguments_a: false # define if we need run flush cache for all application services. Used with flush_cache: true
     restart_replica: false # run ha restartReplicas accounts
   
   primary:
     proxy_ip: # this value used for check availability of proxy in primary dc
     appserver_ip: delete # this value used for check availability of application in primary dc
     directorysrv_ip:
     consul_ips: #this values used for check availability of consul servers in primary dc
     -
     -
     consul_vmnames: # this values used for check consul servers in monitoring server in primary dc
     - svc1.example.com
     - svc3.example.com
     appserver_vmname: mbox1.example.com # this value used for check application server in monitoring server in primary dc
     proxyserver_vmname: proxy1.example.com # this value used for check proxy server in monitoring server in primary dc
     
   secondary:
     proxy_ip: # this value used for check availability of proxy in secondary dc
     appserver_ip: # this value used for check availability of application in secondary dc
     directorysrv_ip:
     consul_ips: # this values used for check availability of consul servers in secondary dc
     -
     consul_vmnames: # this values used for check consul servers in monitoring server in secondary dc
     - svc2.example.com
     appserver_vmname: mbox2.example.com # this value used for check application server in monitoring server in secondary dc
     proxyserver_vmname: proxy2.example.com # this value used for check proxy server in monitoring server in secondary dc
     proxy_switch:
       bgp: # this value used for choose proxy switch
         activate: # list of command to activate proxy switch
         deativate: # list of command to deactivate proxy switch
   
   consul: # consul provider config
     hostname: 127.0.0.1
     port: 8500
     token:

Currently supported providers for acquire data about VM status: Carbonio
Service Discover

Currently supported modes:

-  appserver
