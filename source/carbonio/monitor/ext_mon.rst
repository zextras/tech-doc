Ports And Paths Useful For Monitoring
=====================================

Effective monitoring is essential for maintaining the stability, security,
and performance of a Carbonio infrastructure.
This document outlines the key roles within the system and the corresponding ports and paths
that an external monitoring system (such as Zabbix, Nagios, etc.) should check. \
By proactively monitoring these services, administrators can ensure seamless operation
quickly detect issues, and optimize system performance.

The document is structured by role, detailing the required endpoints for each service
including MTA, Proxy, Mailstore & Provisioning, Mesh & Directory, Event Streaming, and general system health checks.
It also covers critical services such as SMTP, IMAP, HTTP, databases (MariaDB, PostgreSQL), and high-availability
components like Kafka and Zookeeper.
Additionally, fundamental system health indicators, such as disk usage, CPU load, and network availability, are included
to provide a comprehensive monitoring strategy.

.. topic:: Component: MTA

   **SMTP**
   Ports: ``25``, ``465``, ``587``

   **Milter**
   Port: ``7026``

   **ClamAV** (if enabled)
   Socket: ``/run/carbonio/clamd.socket``
   Port: ``3310``

   **Amavisd**
   Port: ``10024``

   **DKIM** (if enabled)
   Port: ``8465``

.. topic:: Component: Proxy

    **IMAP/IMAPS**
    To monitor the IMAP/S service we are going to connect to the following
    port from the external monitoring system:

    Port ``143``/ ``993``

    **POP3/POP3S**

    To monitor the POP3/S service we are going to connect to the following
    port from the external monitoring system:

    Port ``110``/ ``995``

    **HTTP/HTTPS**

    To monitor the HTTP/S service we are going to connect to the following
    port from the external monitoring system:

    Port ``80``/ ``443``

.. topic:: Component: Mailstore & Provisioning

    **LMTP**
    To monitor the LMTP service we are going to connect locally to the
    following ports from the external monitoring system:

    ``7025``
    ``7110``
    ``7143``
    ``7071``
    ``8730``
    ``8736``
    ``7995``
    ``7993``
    ``8080``

    **MariaDB**

    To monitor the status of the MariaDB database we are going to look into
    the presence of the socket related to its process.

    Location of the socket file: ``/run/carbonio/mysql.sock``

.. topic:: Component: Mesh & Directory

    **PostgreSQL**

    To monitor the status of the PostgreSQL database we are going to
    perform a connection locally to the following port from the external
    monitoring system:

    Port ``5432``

    **LDAP**

    To monitor the status of the LDAP service we are going to connect to the
    following port from the external monitoring system:

    Port ``389``

    **Service discovery**

    To monitor the health status of the services from Consul it is possible
    to configure an external monitoring system to gather the statuses
    directly from Consul:

    Ports ``8300``, ``8500``

.. topic:: Component: Event streaming and other HA services


    With |ur| feature enabled the following are also necessary

    **Kafka**

    To monitor the status of the Kafka cluster we are going to connect to
    the following port from the external monitoring system:

    Ports ``9308``, ``7072``

    **Zookeeper**

    To monitor the status of the Zookeeper service we are going to connect
    to the following port from the external monitoring system:

    Port ``2181``

    **Patroni**

    To monitor the status of the Patroni service we are going to connect to
    the following port from the external monitoring system:

    Port ``8008``

.. topic:: All Nodes/Components

    **SSH**

    It is important to monitor the status of connectivity of the users to
    the VMs directly via SSH as multiple people may end up working on the
    same files at the same time, possibly creating issues.

    Example with Nagios: ``check_users`` plugin will be used

    **Average load**

    To monitor the health status of the VMs running the service
    understanding the load on the CPU is really important.

    Example with Nagios: ``check_load`` plugin will be used

    **Disk space**

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

    **PING**

    To monitor that the VMs are reachable it is possible to use a ping
    operation. This will also give information related to the latency of the
    connectivity itself.

    Example with Nagios: ``check_ping`` plugin will be used

    **DNS**

    To monitor the name resolution we can test the resolution with some
    external FQDNs.

    Example with Nagios: ``check_dns`` plugin will be used

    **Systemd units**

    To monitor the status of the systemd units it is possible to configure
    an external monitoring system to gather the statuses directly from
    systemd. This can be done for each unit.
