Ports and paths useful for monitoring
=====================================

This document describes the roles and the endpoints to which an external
monitoring system (Zabbix, Nagios, …) should check to monitor services
on a Carbonio infrastructure.


Role: MTA
---------

SMTP
~~~~

To monitor the status of the SMTP service we are going to connect to the
following ports from the external monitoring system.

Ports 25, 465, 587

Milter
~~~~~~

To monitor the status of the Milter service we are going to connect to
the following port from the external monitoring system.

Port 7026

ClamAV [Only if antivirus enabled]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To monitor the status of the ClamAV service we are going to look into
the presence of the socket related to its process. The presence of the
socket file means that the process is up and running correctly.

Location of the socket file: ``/run/carbonio/clamd.socket``

Port 3310

Amavisd
~~~~~~~

To monitor the status of the Amavisd service we are going to connect to
the following port from the external monitoring system.

Port 10024

DKIM [Only if Dkim signature is enabled]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To monitor the status of the OpenDKIM service we are going to connect to
the following port from the external monitoring system.

Port 8465

Role: Proxy
-----------

IMAP/IMAPS
~~~~~~~~~~

To monitor the IMAP/S service we are going to connect to the following
port from the external monitoring system.

Port 143/993

POP3/POP3S
~~~~~~~~~~

To monitor the POP3/S service we are going to connect to the following
port from the external monitoring system.

Port 110/995

HTTP/HTTPS
~~~~~~~~~~

To monitor the HTTP/S service we are going to connect to the following
port from the external monitoring system.

Port 80/443

Role: Mailstore
---------------

To monitor the LMTP service we are going to connect locally to the
following ports from the external monitoring system.

| 7025
| 7110
| 7143
| 7071
| 8730
| 8736
| 7995
| 7993
| 8080

MariaDB
~~~~~~~

To monitor the status of the MariaDB database we are going to look into
the presence of the socket related to its process.

Location of the socket file: ``/run/carbonio/mysql.sock``

Role: Mesh and Directory
------------------------

PostgreSQL
~~~~~~~~~~

To monitor the status of the PopstgreSQL database we are going to
perform a connection locally to the following port from the external
monitoring system.

Port 5432

LDAP
~~~~

To monitor the status of the LDAP service we are going to connect to the
following port from the external monitoring system.

Port 389

Service discover
~~~~~~~~~~~~~~~~

To monitor the health status of the services from Consul it is possible
to configure an external monitoring system to gather the statuses
directly from Consul.

Ports 8300 8500

Role: Event streaming and other HA services
-------------------------------------------

With Activa Replica feature enabled the following are also necessary

Kafka
~~~~~

To monitor the status of the Kafka cluster we are going to connect to
the following port from the external monitoring system

Ports 9308, 7072

Zookeeper
~~~~~~~~~

To monitor the status of the Zookeeper service we are going to connect
to the following port from the external monitoring system.

Port 2181

Patroni
~~~~~~~

To monitor the status of the Patroni service we are going to connect to
the following port from the external monitoring system.

Port 8008

All Nodes
---------

SSH
~~~

It is important to monitor the status of connectivity of the users to
the VMs directly via SSH as multiple people may end up working on the
same files at the same time, possibly creating issues.

Example with Nagios [check_users plugin will be used]

Average load
~~~~~~~~~~~~

To monitor the health status of the VMs running the service
understanding the load on the CPU is really important.

Example with Nagios [check_load plugin will be used]

Disk space
~~~~~~~~~~

To monitor the disk space we need to check important the disk space used
by certain specific folders as well as how much space in percentage is
being used.

The folders are:

-  ``/opt``

-  ``/var/lib``

-  ``/var/log``

-  ``/opt/zextras/store``

-  ``/opt/zextras/backup``

-  ``/opt/zextras/incoming`` {if present}

-  ``/opt/zextras/cache`` {if present}

PING
~~~~

To monitor that the VMs are reachable it is possible to use a ping
operation. This will also give information related to the latency of the
connectivity itself.

Example with Nagios [check_ping plugin will be used]

DNS
~~~

To monitor the name resolution we can test the resolution with some
external FQDNs.

Example with Nagios [check_dns plugin will be used]

Systemd units
~~~~~~~~~~~~~

To monitor the status of the systemd units it is possible to configure
an external monitoring system to gather the statuses directly from
systemd. This can be done for each unit.
