.. _component-monit-install:

Monitoring
==========

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Monitoring** component is composed of Prometheus and Grafana.

Prometheus is responsible for collecting and storing metrics from the Carbonio infrastructure, while Grafana provides dashboards for visualization and monitoring.

Some repository configuration steps may require manual interaction before and after installation, depending on the deployment scenario.

This component enables administrators to monitor system health, performance metrics, and service availability across the entire Carbonio environment.


Packages
--------

The following packages are required for the **Monitoring** component:

.. code-block:: bash

   carbonio-prometheus


.. note::

   **Alerting** can be enabled in a Carbonio infrastructure by installing the
   ``carbonio-prometheus-alertmanager`` package either on the same node that
   hosts Prometheus or on a different node.

   When combined with Prometheus, Alertmanager allows administrators to define
   alert rules, evaluate them against metrics, and receive notifications through
   multiple channels (for example email or Telegram).

   Detailed, step-by-step instructions on how to configure and enable alerting
   with Prometheus and Alertmanager in Carbonio are available in the dedicated
   how-to guide: :doc:`/monitor/alertmanager`


.. _grafana-install:

.. _grafana-conf:

Grafana Installation and Configuration
--------------------------------------

As mentioned above, Grafana requires some manual interaction before
and after the installation to configure the data sources and import them from |product|.

.. include:: /_includes/_architecture/_components/component-grafana.rst
