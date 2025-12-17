Enable Alerting with Prometheus and Alertmanager
================================================

This guide explains how to enable alerting in a Carbonio infrastructure using
Prometheus and Alertmanager.  
After completing this how-to, an administrator will be able to configure alert
rules and receive notifications (email, Telegram, etc.) when issues occur.

Overview
--------

Prometheus alerting works as a two-part process:

* **Prometheus** evaluates alert rules against collected metrics and determines
  when an alert condition is met.
* **Alertmanager** processes those alerts, de-duplicates them, groups them, and
  routes notifications to the appropriate receivers.

Alert Lifecycle
---------------

An alert evaluated by Prometheus goes through three states:

* **Pending**  
  The alert condition is true, but it has not persisted for the duration
  specified in the ``for`` clause. No notification is sent yet.

* **Firing**  
  The alert condition has been continuously true for the entire ``for``
  duration. Prometheus sends the alert to Alertmanager.

* **Resolved**  
  The alert condition is no longer true. Prometheus notifies Alertmanager that
  the alert has been resolved.

Once an alert is *firing*, Prometheus forwards it to Alertmanager, which handles
routing and notifications based on alert labels (for example, routing
``severity=blocker`` alerts to Telegram and ``severity=warning`` alerts to
email).

Enable Alert Rule Evaluation in Prometheus
------------------------------------------

By default, rule evaluation is disabled in the Carbonio Prometheus
configuration.

Edit the file:

.. code:: console

   /etc/carbonio/carbonio-prometheus/prometheus.yml

Uncomment or add the following sections:

.. code-block:: yaml

   # Alertmanager configuration
   alerting:
     alertmanagers:
     - static_configs:
       - targets:
         - IP_AlertManager:9095

   # Load rules once and periodically evaluate them according to the global
   # 'evaluation_interval'.
   rule_files:
     - "/etc/carbonio/carbonio-prometheus/rules/*.yaml"

.. important::

   Carbonio uses port ``9095`` for Alertmanager instead of the default ``9093``.

.. warning::

   The file ``/etc/carbonio/carbonio-prometheus/prometheus.yml`` may be
   overwritten during upgrades. Any custom changes must be re-applied after an
   upgrade.

Alert Rules
-----------

Sample alert rules are available in:

.. code:: console

   /etc/carbonio/carbonio-prometheus/sample-rules

Example files include:

* ``clamav.yaml``
* ``consul.yaml``
* ``mta_queues.yaml``
* ``mysql.yaml``
* ``nginx.yaml``
* ``node_disk.yaml``
* ``node-exporter.yaml``
* ``postgres.yaml``

Some files are intentionally empty so administrators can define custom alerts.

To enable rules:

1. Copy the desired files (or create new ones) into:

   .. code:: console

      /etc/carbonio/carbonio-prometheus/rules/

2. Ensure the files are owned by the ``carbonio-prometheus`` user.

After adding or modifying rules, force Prometheus to reload its configuration:

.. code:: console

   curl -X POST http://localhost:9090/-/reload

Install Alertmanager
--------------------

Install the ``carbonio-prometheus-alertmanager`` package using the appropriate
package manager for your operating system.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         apt install carbonio-prometheus-alertmanager

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         apt install carbonio-prometheus-alertmanager

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         dnf install carbonio-prometheus-alertmanager

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         dnf install carbonio-prometheus-alertmanager

.. note::

   Alertmanager is usually installed on the same node as Prometheus, but it can
   be installed on a different node. In that case, ensure that firewall rules
   allow access to port ``9095``.

Alertmanager Configuration
--------------------------

The Alertmanager configuration file is located at:

.. code:: console

   /etc/carbonio/carbonio-prometheus-alertmanager/alertmanager.yml

Example configuration:

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
     routes:
       - matchers:
           - severity="blocker"
         receiver: telegram
         group_wait: 10s
         repeat_interval: 8h
         continue: false
       - matchers:
           - severity="warning"
         receiver: email_external
         group_wait: 30s
         repeat_interval: 2h
         continue: false
       - matchers:
           - severity="alert"
         receiver: email
         continue: false

   receivers:
     - name: 'email_external'
       email_configs:
         - to: 'email@externaldomain.com'
           headers:
             subject: '{{ template "custom_mail_subject" . }}'
             html: '{{ template "custom_mail_html" . }}'

     - name: 'email'
       email_configs:
         - to: 'email@example.com'
           headers:
             subject: '{{ template "custom_mail_subject" . }}'
             html: '{{ template "custom_mail_html" . }}'

     - name: 'telegram'
       telegram_configs:
         - bot_token: 'telegramToken'
           api_url: 'https://api.telegram.org'
           chat_id: 12345678
           message: '{{ template "telegram.message" . }}'
           parse_mode: 'HTML'

Configuration Breakdown
-----------------------

Global Settings
~~~~~~~~~~~~~~~

* ``resolve_timeout``  
  Time after which an alert is considered resolved if no updates are received.

* ``smtp_*`` settings -  
  Define SMTP parameters for sending email notifications.

Templates
~~~~~~~~~

Custom templates allow formatting email subjects, email bodies, and Telegram
messages using Go templating.

Routing
~~~~~~~

The ``route`` section defines how alerts are grouped and routed:

* ``group_by`` groups alerts by label (for example, ``alertname``).
* ``group_wait`` delays notifications to allow grouping.
* ``repeat_interval`` controls how often unresolved alerts are resent.
* Sub-routes match alerts based on labels such as ``severity``.

Receivers
~~~~~~~~~

Receivers define where notifications are sent, such as:

* Internal email
* External email
* Telegram chats

Verify Alertmanager Installation
--------------------------------

Check that the Alertmanager service is running:

.. code:: console

   systemctl status carbonio-prometheus-alertmanager

To follow logs in real time:

.. code:: console

   journalctl -u carbonio-prometheus-alertmanager -f

Once configured and running, Prometheus alerts will be evaluated, routed by
Alertmanager, and delivered to the configured notification channels.
