There are situations in which a service-discover agent fails to
connect to the service-discover server or to other agents using
**UDP**, but is successful via **TCP**. When this happens, in the
:file:`syslog` log file, warning messages like the following one are
recorded::

  Mar  9 20:08:29 proxy01 service-discoverd[3189618]: 2025-03-09T20:08:29.578+0100 [WARN]  agent.client.memberlist.lan: memberlist: Was able to connect to srv1.example.com over TCP but UDP probes failed, network may be misconfigured

  Mar  9 20:08:30 proxy01 service-discoverd[3189618]: 2025-03-09T20:08:30.579+0100 [WARN]  agent.client.memberlist.lan: memberlist: Was able to connect to agent-mbox01.example.com over TCP but UDP probes failed, network may be misconfigured

  Mar  9 20:08:31 proxy01 service-discoverd[3189618]: 2025-03-09T20:08:31.580+0100 [WARN]  agent.client.memberlist.lan: memberlist: Was able to connect to agent-files01.example.com over TCP but UDP probes failed, network may be misconfigured

These messages show that **proxy01** (the agent that establishes the
communication) can not communicate with agents of ``srv1``,
``agent-mbox01``, ``agent-files01`` and are marked as ``[WARN]]``,
i.e., warnings, the agents can still communicate via TCP and the
service-discover is working--as shown also in the :ref:`mesh-gui`,
this is a symptom of a communication problem within the network.

Possible reasons for the problem are:

* A blocked (destination) UDP Port 8301 between the source agent, i.e
  the agent starting the communication, and the destination agents or
  server.

* An unwanted SNAT rule of the agent's source IP address: if the UDP
  connection is masqueraded with an IP address that is unknown to
  |mesh| destination agent or server, then the connection fails

In both cases, to fix the problem it is necessary to investigate the
firewall rules to find a misconfiguration or some offending rule.
