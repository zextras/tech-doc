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

         # apt clean &&apt update && apt upgrade

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf clean all && dnf upgrade

Next, we install all packages needed for |product|.
          
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server \
         carbonio-proxy \
         carbonio-webui carbonio-files-ui \
         carbonio-chats-ui \
         carbonio-mta \ carbonio-mailbox-db \
         carbonio-advanced \
         carbonio-user-management \
         carbonio-files carbonio-files-db \
         carbonio-preview carbonio-docs-editor \
         carbonio-docs-connector carbonio-docs-connector-db \
         carbonio-prometheus

   .. tab-item:: RHEL
      :sync: rhel

      The installation on RHEL is divided in two steps. First, install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Then, proceed with all other packages

      .. code:: console

         # dnf install carbonio-directory-server \
         carbonio-proxy carbonio-webui \
         carbonio-user-management \
         carbonio-files-ui carbonio-files \
         carbonio-files-db \
         carbonio-mta \
         carbonio-mailbox-db \
         carbonio-advanced carbonio-chats-ui \
         carbonio-docs-editor \
         carbonio-docs-connector carbonio-docs-connector-db \
         carbonio-preview carbonio-prometheus

After the successful package installation, you can check that all
|product| services are running, by using

.. code:: console

   # systemctl status carbonio-*

If any service is in :red:`failed` status, restart it. Probably one of
the |monit| exporters will not correctly start, so you will need to
run

.. code:: console

   # systemctl restart carbonio-prometheus-nginx-exporter.service
