.. _ha-install:

Standard Carbonio Installation
==============================

Before proceeding with the High Availability (HA) setup for Carbonio,
it is essential to complete a standard installation of all core services.
This initial setup provides the stable foundation required to create HA
infrastructure.

Follow the steps below to perform the standard installation:

Install the official Ansible version for your distro
https://docs.ansible.com/ansible/latest/installation_guide/index.html

.. code:: console

   # Install the Carbonio Ansible collection
   ansible-galaxy collection install zxbot.carbonio_install

Prepare the inventory file with server roles

.. code:: console

   #inventory file example

   [postgresServers]
   svc1.example.com

   [masterDirectoryServers]
   svc1.example.com

   [replicaDirectoryServers]

   [serviceDiscoverServers]
   svc1.example.com
   svc2.example.com
   svc3.example.com

   [dbsConnectorServers]
   #Keep this group empty for a standard installation

   [mtaServers]
   mta1.example.com
   mta2.example.com

   [proxyServers]
   proxy1.example.com
   proxy2.example.com

   [proxyServers:vars]
   #webmailHostname=webmailPublicHostname

   [applicationServers]
   mbox1.example.com
   mbox2.example.com

   [filesServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [docsServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [taskServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [previewServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [videoServers]
   #hostname public_ip_address=x.y.z.t
   video1.example.com public_ip_address=1.2.3.4
   video2.example.com public_ip_address=1.2.3.4

   [prometheusServers]
   svc3.example.com

   [syslogServer]
   svc3.example.com

Execute the playbook using the inventory file:

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_install.carbonio_install



