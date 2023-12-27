.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf upgrade

Next, we install all packages needed for |product|.
          
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-files-ui carbonio-mta carbonio-appserver \
         carbonio-user-management carbonio-files-ce \
         carbonio-files-db carbonio-tasks-ce carbonio-tasks-db \
         carbonio-tasks-ui carbonio-storages-ce carbonio-preview-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-prometheus carbonio-message-broker \
         carbonio-message-dispatcher carbonio-ws-collaboration-ce \
         carbonio-videoserver-ce

   .. tab-item:: RHEL
      :sync: rhel

      The installation on RHEL is divided in two steps. First, install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Then, proceed with all other packages

      .. code:: console

         # dnf install carbonio-directory-server carbonio-proxy \
         carbonio-webui carbonio-files-ui carbonio-mta \
         carbonio-appserver carbonio-user-management \
         carbonio-preview-ce carbonio-files-ce carbonio-files-db \
         carbonio-tasks-ce carbonio-tasks-db q carbonio-tasks-ui \
         carbonio-storages-ce carbonio-docs-connector-ce \
         carbonio-docs-editor carbonio-prometheus \
         carbonio-message-broker carbonio-message-dispatcher \
         carbonio-ws-collaboration-ce carbonio-videoserver-ce

After the successful package installation, you can check that all
|product| services are running, by using

.. code:: console

   # systemctl status carbonio-*

If any service is in :red:`failed` status, restart it. Some of he
|monit| exporters may not correctly start, because the bootstrap of
the databases (:ref:`Step 8 <installation-step8>`) must be executed in
advance. After that step, if any of the services is not in ``running``
state, you will need to manually start it by running a command like
the following, replacing
``carbonio-prometheus-nginx-exporter.service`` with the service that
is not running.


.. code:: console

   # systemctl restart carbonio-prometheus-nginx-exporter.service
