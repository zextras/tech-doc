.. _scenario-es-manual:

===========================
 Manual Roles Installation
===========================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Roles on the Nodes, according to the following guidelines.

.. include:: /_includes/_installation/multinode-suggestions.rst

Scenario Overview
=================

This are the roles installed on each Node.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Node 1
      :columns: 12

      Node Name/FQDN: srv1.example.com

      Type of services: Clustered services

      Roles installed:

      * :ref:`role-mesh-install`

      * :ref:`role-db-install`

      * :ref:`role-monit-install`

   .. grid-item-card:: Node 2
      :columns: 12

      Node Name/FQDN: srv2.example.com

      Type of services: Proxy and MTA

      Roles installed:

      * :ref:`role-mta-install`

      * :ref:`role-proxy-install`

   .. grid-item-card:: Node 3
      :columns: 12

      Node Name/FQDN: srv3.example.com

      Type of services: Mails, Calendars, and Contacts

      Roles installed:

      * :ref:`role-prov-install`

Core Node
=========

.. _es1-step1:

Step 1: Configuration of Repositories
-------------------------------------

The installation procedure start with the configuration of the
repositories.

.. rubric:: |product|

.. include:: /_includes/_installation/step-repo-conf.rst

.. rubric:: PostgreSQL and other (RHEL only)

.. include:: /_includes/_installation/repo-single-cb.rst

.. _es1-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst

.. _es1-step3:

Step 3: System Upgrade and Package Installation
-----------------------------------------------

After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf upgrade

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      .. code:: console

         # dnf upgrade

Next, we install all packages needed for |product|.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

   .. tab-item:: RHEL 8
      :sync: rhel8

      The installation on RHEL is divided in few steps: install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Disable PostgreSQL 12

      .. code:: console

         # dnf -qy module disable postgresql

      Install all other packages

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      The installation on RHEL is divided in few steps: install the
      |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Disable PostgreSQL 12

      .. code:: console

         # dnf -qy module disable postgresql

      Install all other packages

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

.. _es1-step4:

Step 4: Configure PostgreSQL
----------------------------

.. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _es1-step5:

Step 5: Bootstrap |product|
---------------------------

To carry out this step, you need the **LDAP password** and the **Node
hostname** that you have retrieved at Step 9 of Node 1's installation
(see :ref:`es1-step9`).

.. include:: /_includes/_installation/step-bootstrap.rst

The next steps concern the configuration and setup of the various
|product| components.

.. _es1-step6:

Step 6: Setup |mesh|
--------------------

To carry out this step, you need the |mesh| **secret** generated
during the installation of the Node 1 (see the
:ref:`es1-step9` Step).

.. include:: /_includes/_installation/mesh.rst

.. include:: /_includes/_installation/pset.rst

.. _es1-step7:
    
Step 7: Databases Bootstrap
---------------------------

Now you have to bootstrap the DB with the password set in :ref:`es1-step4`

.. card:: Mailbox DB Bootstrap

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. _es1-step8:
 
Step 8: Complete Installation
-----------------------------

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start


   .. tab-item:: RHEL 8
      :sync: rhel8


      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      After the successful package installation, start all |product|
      services by using
      
      .. code:: console

         # systemctl start/stop/restart carbonio-directory-server.target

.. _es1-step9:

Step 9: Data Required for Additional Nodes
------------------------------------------

The following data from this Node will be needed during the
installation of the next two Nodes.

#. The **Node hostname**

   .. code:: console

      # hostname -f

#. The **LDAP password** for bootstrapping |product|

   .. code:: console

      # su - zextras -c "zmlocalconfig -s ldap_root_password"

#. the |mesh| **secret**, that you can retrieve with command

   .. code:: console

      # cat /var/lib/service-discover/password

MTA/Proxy Node
==============

.. _es2-step1:

Step 1: Configuration of Repositories
-------------------------------------

The installation procedure start with the configuration of the
repositories.

.. rubric:: |product|

.. include:: /_includes/_installation/step-repo-conf.rst
             
.. rubric:: RHEL Only

.. tab-set::

   .. tab-item:: RHEL 8
      :sync: rhel8

      You need to add the PostgreSQL and EPEL repositories and
      enable the BaseOS, Appstream, and CodeReady repositories.

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
         # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      You need to add the PostgreSQL and EPEL repositories and
      enable the BaseOS, Appstream, and CodeReady repositories.

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
         # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms

.. _es2-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst

.. _es2-step3:

Step 3: System Upgrade and Package Installation
-----------------------------------------------

After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf upgrade

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      .. code:: console

         # dnf upgrade

Next, we install all packages needed for |product|.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install carbonio-mta carbonio-proxy \
         carbonio-user-management carbonio-webui carbonio-files-ui \
         carbonio-tasks-ui carbonio-chats-ui \
         carbonio-files-public-folder-ui \
         carbonio-ws-collaboration-ui carbonio-catalog \
         service-discover-agent

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install carbonio-mta carbonio-proxy \
         carbonio-user-management carbonio-webui carbonio-files-ui \
         carbonio-tasks-ui carbonio-chats-ui \
         carbonio-files-public-folder-ui \
         carbonio-ws-collaboration-ui carbonio-catalog \
         service-discover-agent

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-mta carbonio-proxy \
         carbonio-user-management carbonio-webui carbonio-files-ui \
         carbonio-tasks-ui carbonio-chats-ui \
         carbonio-files-public-folder-ui \
         carbonio-ws-collaboration-ui carbonio-catalog \
         service-discover-agent

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-mta carbonio-proxy \
         carbonio-user-management carbonio-webui carbonio-files-ui \
         carbonio-tasks-ui carbonio-chats-ui \
         carbonio-files-public-folder-ui \
         carbonio-ws-collaboration-ui carbonio-catalog \
         service-discover-agent

.. _es2-step5:

Step 5: Bootstrap |product|
---------------------------

To carry out this step, you need the **LDAP password** and the **Node
hostname** that you have retrieved at Step 9 of Node 1's installation
(see :ref:`es1-step9`).

.. include:: /_includes/_installation/step-bootstrap.rst

The next steps concern the configuration and setup of the various
|product| components.

.. _es2-step6:

Step 6: Setup |mesh|
--------------------

To carry out this step, you need the |mesh| **secret** generated
during the installation of the Node 1 (see the
:ref:`es1-step9` Step).

.. include:: /_includes/_installation/mesh.rst
             
.. _es2-step7:
 
Step 7: Complete Installation
-----------------------------

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start


   .. tab-item:: RHEL 8
      :sync: rhel8


      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      After the successful package installation, start all |product|
      services by using
      
      .. code:: console

         # systemctl start/stop/restart carbonio-mta.target
         # systemctl start/stop/restart carbonio-proxy.target

Mailstore Node
==============

.. _es3-step1:

Step 1: Configuration of Repositories
-------------------------------------

The installation procedure start with the configuration of the
repositories.

.. rubric:: |product|

.. include:: /_includes/_installation/step-repo-conf.rst

.. rubric:: RHEL Only

.. tab-set::

   .. tab-item:: RHEL 8
      :sync: rhel8

      You need to add the PostgreSQL and EPEL repositories and
      enable the BaseOS, Appstream, and CodeReady repositories.

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
         # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      You need to add the PostgreSQL and EPEL repositories and
      enable the BaseOS, Appstream, and CodeReady repositories.

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
         # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms

.. _es3-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst

.. _es3-step3:

Step 3: System Upgrade and Package Installation
-----------------------------------------------

After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf upgrade

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      .. code:: console

         # dnf upgrade

Next, we install all packages needed for |product|.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install carbonio-advanced carbonio-zal \
         service-discover-agent

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install carbonio-advanced carbonio-zal \
         service-discover-agent

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-advanced carbonio-zal \
         service-discover-agent

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-advanced carbonio-zal \
         service-discover-agent

.. _es3-step5:

Step 5: Bootstrap |product|
---------------------------

.. include:: /_includes/_installation/step-bootstrap.rst

The next steps concern the configuration and setup of the various
|product| components.

.. _es3-step6:

Step 6: Setup |mesh|
--------------------

.. include:: /_includes/_installation/mesh.rst
             
.. _es3-step7:
 
Step 7: Complete Installation
-----------------------------

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start


   .. tab-item:: RHEL 8
      :sync: rhel8


      After the successful package installation, start all |product|
      services by using

      .. code:: console

         zextras$ zmcontrol start

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      After the successful package installation, start all |product|
      services by using
      
      .. code:: console

         # systemctl start/stop/restart carbonio-appserver.target
