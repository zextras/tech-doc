.. _role-monit-install:

Monitoring
==========

The Monitoring Component is composed by the Prometheus and Grafana
software. Prometheus extracts data from metrics and log files, that
are then used by Grafana, which provides dashboards to monitor the
|product| status.

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_packages/component-monit.rst

Bootstrap |carbonio|
--------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

To complete the installation, restart prometheus service with:

.. code:: console

   # systemctl restart carbonio-prometheus

.. _grafana-install:

.. _grafana-conf:

Grafana Installation and Configuration
--------------------------------------

As mentioned above, Grafana requires some manual interaction before
and after the installation to install also some necessary plugin and
to configure the data sources and import them from |product|.

.. include:: /_includes/_installation/_roles/role-grafana.rst
