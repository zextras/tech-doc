===================================================
Configure alerting with Prometheus and Alertmanager
===================================================

This guide explains how to enable alerting in a Carbonio infrastructure using Prometheus and Alertmanager.

Prometheus alerting works as a two-part process: Prometheus handles the detection of issues by evaluating defined rules against metric data, and a separate component called Alertmanager handles the processing, de-duplication, and notification of those issues.

After completing this guide, an administrator will be able to configure alert rules and receive notifications (email, Telegram, etc.) when issues occur.

Overview
========

Prometheus alerting consists of two components:

* **Prometheus** evaluates alert rules against collected metrics
* **Alertmanager** processes alerts, de-duplicates them, groups them, and routes notifications

Alert rule evaluation (Prometheus Server)
=========================================

The Prometheus server continuously evaluates alert conditions defined in rule files.

**Define Rules**

Alerting rules are defined in YAML files (for example ``rules.yml``). Each rule specifies a condition using the Prometheus Query Language (PromQL).

Prometheus periodically evaluates these expressions. When a condition is met, an alert is triggered.

**Alert Lifecycle**

Each alert goes through three states:

* **Pending**  
  The condition is true but has not persisted for the duration specified in the ``for`` clause. No notification is sent.

* **Firing**  
  The condition has been true for the full ``for`` duration. Prometheus sends the alert to Alertmanager.

* **Resolved**  
  The condition is no longer true. Prometheus notifies Alertmanager that the alert has been resolved.

Once an alert is firing, Prometheus sends it to Alertmanager, which handles notification routing based on labels (for example, sending ``severity=blocker`` alerts to Telegram and ``severity=warning`` alerts via email).

Alertmanager installation
=========================

Install the package using your system package manager.

Ubuntu
------

.. code-block:: bash

   sudo apt update
   sudo apt install carbonio-prometheus-alertmanager

RHEL
----

.. code-block:: bash

   sudo yum install carbonio-prometheus-alertmanager

.. note::

   Alertmanager is usually installed on the same node as Prometheus, but it can run on a different node. Ensure firewall rules allow access to port ``9095``.

Post-installation steps
-----------------------

After installing the package:

1. Run the pending setup procedure:

   .. code-block:: bash

      pending-setups

   During this step, the Consul cluster credential password is required.

2. Configure Alertmanager via Consul KV store (see section :ref:`updating-alertmanager-configuration`).

During ``pending-setups``:

* The template file:

  ``/etc/carbonio/carbonio-prometheus-alertmanager/config-templates/alertmanager.yml``

  is stored in Consul KV

* The final configuration is generated at:

  ``/etc/carbonio/carbonio-prometheus-alertmanager/alertmanager.yml``

.. important::

   The Alertmanager configuration is managed via Consul KV.  
   Direct changes to the generated file are not persistent and may be overwritten.

Rules definition
================

Sample rules are available in:

::

   /etc/carbonio/carbonio-prometheus/sample-rules

Example files:

* ``clamav.yml``
* ``consul.yml``
* ``mta_queues.yml``
* ``mysql.yml``
* ``nginx.yml``
* ``node_disk.yml``
* ``node-exporter.yml``
* ``postgres.yml``

Some files are intentionally empty to allow custom rule definitions.

To enable rules:

1. Copy or create rule files in:

   ::

      /etc/carbonio/carbonio-prometheus/rules/

2. Ensure correct ownership:

   .. code-block:: bash

      chown carbonio-prometheus:carbonio-prometheus <file>

3. Reload Prometheus configuration:

   .. code-block:: bash

      curl -X POST http://localhost:9090/-/reload

.. note::

   Useful alert examples are available at:
   https://samber.github.io/awesome-prometheus-alerts/

Enable Alertmanager in Prometheus
=================================

Copy the sample Alertmanager configuration:

.. code-block:: bash

   cp /etc/carbonio/carbonio-prometheus/sample-alertmanager/alertmanager.yml \
      /etc/carbonio/carbonio-prometheus/alertmanager/

The default configuration includes:

.. code-block:: yaml

   - targets:
       - "127.0.0.1:9095"

If Alertmanager runs on another node, update the target:

::

   <ALERTMANAGER_IP>:9095

Ensure correct ownership:

.. code-block:: bash

   chown carbonio-prometheus:carbonio-prometheus \
     /etc/carbonio/carbonio-prometheus/alertmanager/alertmanager.yml

.. important::

   Carbonio uses port ``9095`` instead of the default ``9093``.

.. _updating-alertmanager-configuration:

Updating Alertmanager configuration
===================================

Alertmanager configuration is stored in Consul KV, providing:

* Centralized configuration management
* Consistency across nodes
* Safe updates without manual synchronization
* Integration with ``consul-template``

Access Consul UI
----------------

Retrieve the ACL token:

.. code-block:: bash

   export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | \
   tar xOf - consul-acl-secret.json | jq .SecretID -r)

Create an SSH tunnel:

.. code-block:: bash

   ssh -L 8500:localhost:8500 root@<IP_ADDRESS>

Open:

::

   http://localhost:8500

Editing configuration
---------------------

1. Navigate to **Key / Value**
2. Locate:

   ::

      carbonio-alertmanager/config

3. Apply changes and save

Apply changes
-------------

Render configuration:

.. code-block:: bash

   consul-template -once \
     -template "/etc/zextras/service-discover/templates/alertmanager.yml.ctmpl:/etc/carbonio/carbonio-prometheus-alertmanager/alertmanager.yml"

Restart service:

.. code-block:: bash

   systemctl restart carbonio-prometheus-alertmanager

Configuration overview
======================

The configuration file:

::

   /etc/carbonio/carbonio-prometheus-alertmanager/alertmanager.yml

Example:

.. code-block:: yaml

   global:
     resolve_timeout: 5m
     smtp_from: 'notifier@example.com'
     smtp_smarthost: 'smtp.example.com:587'
     smtp_auth_username: 'notifier@example.com'
     smtp_auth_password: 'password'
     smtp_require_tls: true

   templates:
     - "/etc/carbonio/carbonio-prometheus-alertmanager/templates/*.tmpl"

   route:
     group_by: ['alertname']
     group_wait: 30s
     group_interval: 1m
     repeat_interval: 1h
     receiver: email

   receivers:
     - name: 'email'
       email_configs:
         - to: 'email@example.com'

Configuration breakdown
-----------------------

Global settings
^^^^^^^^^^^^^^^

Defines default behavior such as SMTP configuration and alert resolution timeout.

.. warning::

   Avoid storing sensitive data (like passwords) in plain text. Use environment variables or a secrets manager.

Templates
^^^^^^^^^

Templates define formatting for notifications using Go templating.

Routing
^^^^^^^

Controls how alerts are grouped and routed based on labels such as severity.

Receivers
^^^^^^^^^

Define notification targets such as:

* Email
* External email
* Telegram

Verify installation
===================

Check service status:

.. code-block:: bash

   systemctl status carbonio-prometheus-alertmanager

Follow logs:

.. code-block:: bash

   journalctl -u carbonio-prometheus-alertmanager -f

Upgrade notes
=============

Upgrading from versions prior to 26.3 requires manual steps.

After upgrade:

* Review and update ``prometheus.yml``
* Merge new configuration changes
* Reconfigure Alertmanager via Consul KV

Steps:

1. Backup existing configuration
2. Perform upgrade
3. Re-apply configuration using Consul KV

From version 26.3 onward, Alertmanager configuration is centrally managed via Consul KV.