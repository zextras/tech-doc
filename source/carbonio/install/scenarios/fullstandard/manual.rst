.. _scenario-st-manual:

===========================
 Manual Roles Installation
===========================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Roles on the Nodes, according to the following guidelines.

.. include:: /_includes/_installation/multinode-suggestions.rst

.. _st-core:

Core Node
=========

.. _st1-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL

   .. include:: /_includes/_installation/_repo/pg.rst

.. _st1-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st1-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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

   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Role Mesh & Directory

   .. include:: /_includes/_installation/_packages/role-mesh-ds.rst

   .. rubric:: Role Database

   .. include:: /_includes/_installation/_packages/role-db.rst

   .. rubric:: Role Monitoring

   .. include:: /_includes/_installation/_packages/role-monit.rst

   .. rubric:: DB Components

   .. include:: /_includes/_installation/_packages/role-db-comp.rst

   .. rubric:: WSC DB Components

   .. include:: /_includes/_installation/_packages/role-db-wsc.rst

.. _st1-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _st1-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st1-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st1-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <st1-step4>`.

   .. include:: /_includes/_installation/_steps/db-bootstrap.rst

   .. include:: /_includes/_installation/_steps/db-bootstrap-wsc.rst

.. _st1-step8:

.. dropdown:: Step 8: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-directory-server.target

.. _st1-step9:

.. dropdown:: Step 9: Data Required for Additional Nodes

   The following data from this Node will be needed during the
   installation of the next two Nodes.

   #. The **Core Node hostname**

      .. code:: console

         # hostname -f

   #. The **LDAP password** for bootstrapping |product|

      .. code:: console

         # su - zextras -c "zmlocalconfig -s ldap_root_password"

   #. the |mesh| **secret**, that you can retrieve with command

      .. code:: console

         # cat /var/lib/service-discover/password

.. _st-mta:

MTA Node
========

.. _st2-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _st2-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st2-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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

   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Role MTA AV/AS

   .. include:: /_includes/_installation/_packages/role-mta.rst

.. _st2-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <fsm1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st2-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <fsm1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st2-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-mta.target

.. _st-proxy:

Proxy Node
==========

.. _st3-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _st3-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st3-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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


   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Role Proxy

   .. include:: /_includes/_installation/_packages/role-proxy.rst

.. _st3-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <fsm1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st3-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <fsm1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st3-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-proxy.target

.. _st-msp:

Mailstore & Provisioning and Tasks Node
=======================================

.. _st4-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _st4-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st4-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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

 
   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Role Mailstore & Provisioning

   .. include:: /_includes/_installation/_packages/role-mailstore-provisioning.rst

   .. rubric:: Role Tasks

   .. include:: /_includes/_installation/_packages/role-tasks.rst

.. _st4-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st4-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st4-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-appserver.target


.. _st-collab:

Files and |WSC| Node
====================

.. _st5-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: Configure PostgreSQL Repository

   .. include:: /_includes/_installation/_repo/pg.rst

.. _st5-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st5-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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

   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Role Files

   .. include:: /_includes/_installation/_packages/role-files.rst

   .. rubric:: Role |wsc|

   .. include:: /_includes/_installation/_packages/role-wsc-cb.rst


.. _st5-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st5-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st5-step6:

.. dropdown:: Step 6: Dispatcher DB migration

   Initialise the message dispatcher

   .. include:: /_includes/_installation/_roles/dispatcher-migration.rst


.. _st5-step7:

.. dropdown:: Step 7: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-appserver.target


.. _st-docs:

Docs and Preview Node
=====================

.. _st6-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _st6-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st6-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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

   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Role Docs & Editor

   .. include:: /_includes/_installation/_packages/role-docs.rst

   .. rubric:: Role Preview

   .. include:: /_includes/_installation/_packages/role-preview.rst

.. _st6-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st6-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st6-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-appserver.target

.. _st-vs:

Video Server Node
=================

.. _st7-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _st7-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _st7-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

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

   Next, we install all packages needed for |product|. We divide them
   by Role and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Role Video Server & Video Recording (WSC)

   .. include:: /_includes/_installation/_packages/role-vs-wsc.rst

   .. rubric:: Role |wsc|

   .. include:: /_includes/_installation/_packages/role-wsc-cb.rst

.. _st7-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st7-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st7-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-appserver.target
