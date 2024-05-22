.. _role-monit-install:

Monitoring
==========

The Monitoring Role is composed by the Prometheus and Grafana
software. Prometheus extracts data from metrics and log files, that
are then used by Grafana, which provides dashboards to monitor the
|product| status.

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-monit.rst

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

To complete the installation, restart prometheus service with:

.. code:: console

   # systemctl restart carbonio-prometheus

Grafana Installation and Configration
-------------------------------------

As mentioned above, Grafana requires some manual interaction before
and after the installation to install also some necessary plugin and
to configure the data sources and import them from |product|.

.. include:: /_includes/_installation/_roles/role-grafana.rst
