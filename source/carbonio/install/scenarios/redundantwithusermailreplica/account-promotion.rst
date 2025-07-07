.. _ha_promotion:

|ur| Account Promotion
=======================

The |ur| mechanism underlying |product| is described in Section
:ref:`activereplica`. In particular, :ref:`ar-promo` shows how to
manually activate an |ur|. To automatise this process, the **habeat**
Python tool has been developed to ensure seamless account promotion
with |ur|.

The :command:`habeat` tool can be downloaded from the
https://github.com/zextras/sps-habeat repository. You will need also a
number of other files from that repository, so you might want to clone
it.

.. todo:: mention of HA Node, also in the table following the paragraph
            
All the commands in this section must be executed as the |ru| **for
every HA Node**, i.e. for every Node listed in the column **HA Nodes**
in :numref:`tab-ha-nodes`. Taking into account our inventory file,
this means you must install and configure the utility on these Nodes:

.. _tab-ha-fqdn:

.. csv-table:: Nodes and FQDN
   :header: "HA Node", "FQDN"

   "MTA", "mta2.example.com"
   "Proxy", "proxy2.example.com"
   "Mailstore & Provisioning", "mbox2.example.com"
   "Collaboration", "filesdocs2.example.com"
   "Video Server", "video2.example.com"

Deploy
------

To copy :command:`habeat` you can use preferable utility, for example
:command:`scp`. Remember to replace ``node`` with the actual Node FQDN
as shown in :numref:`tab-ha-fqdn` or with equivalent FQDN according to
your infrastructure.

First, copy the script and its configuration file.

.. hint:: Before copying the configuration file, you might want to
   edit it to adapt it to your infrastructure. Please refer to Section
   :ref:`habeat-conf-file` below.

.. code:: console

   # scp habeat.py root@node:/usr/local/sbin/habeat.py
   # ssh root@node "mkdir -p /etc/hamon"
   # scp config/habeat.yml root@node:/etc/hamon

To configure habeat you need to add 2 units to systemd service:

- ``habeat.service`` -- the service that should perform call of script
- ``habeat.timer`` -- the timer for define how often to run the script

Copy them to each Node.

.. code:: console

   # scp config/habeat.service root@node:/etc/systemd/system/
   # scp config/habeat.timer root@node:/etc/systemd/system/
   # ssh root@node "systemctl daemon-reload"

In the ``habeat.timer`` unit we can define the condition of execution,
i.e., the interval between each script execution.

.. code:: text

   OnCalendar=\*:0/5 # Run script every 5 minutes

In the ``habeat.service`` unit we define the location of the script,
log file, and configuration file.

.. code:: text

   ExecStart=/usr/local/sbin/habeat --config /etc/hamon/habeat.yml --log /var/log/habeat.log

.. _habeat-conf-file:

Configure
---------

The configuration file, which you can find also in the repository, is
similar to the following: as usual, remember to fill the options with
values suitable to your infrastructure.

.. todo:: mentions in configuration file

.. dropdown:: Habeat configuration file
   :open:

   ::
     
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
