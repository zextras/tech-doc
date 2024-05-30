This section provides information about Prometheus and the exporters
available in |product|, that are used to fetch information from log
files, |product| nodes, and metrics exposed by |product| services.

Introduction and Architecture
=============================

Prometheus is a time-series database that stores all the information
about the historical data of |product|, allowing Administrators to
obtain a view and evolution of the system.

The monitoring functionality in |product| is realized thanks to these main tools:

Prometheus Server
   The main Prometheus server, which processes log files and metrics
   to stores time-series data.

Node Exporter
   The main exporter, installed on every Node of the |product|
   infrastructure, which gathers the metrics exposed by the hardware
   and Operating System.

Specialised Exporters
   These are special-purpose exporters, responsible to collect data
   and metrics from a given service running on |product|.

Dependencies
------------

The Node Exporter component is automatically installed with the
``carbonio-core`` package.
    
To make sure that the correct Exporter in installed along the service
from which it fetches data, when a Role in installed, the
corresponding Prometheus Exporter is installed. For example, when the
:ref:`Proxy Role <role-proxy-install>` is installed, the
``carbonio-prometheus-nginx-exporter`` package is installed as well:
no additional installation activity is therefore necessary.

The list of available exporters, including some additional
information, is shown in :numref:`tab-prometheus-exporters`
