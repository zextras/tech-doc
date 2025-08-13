.. _scenario-st-manual:

================================
 Manual Components Installation
================================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Components on the Nodes, according to the following guidelines.

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

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Component Mesh & Directory

   .. include:: /_includes/_installation/_packages/component-mesh-ds.rst

   .. rubric:: Component Database

   .. include:: /_includes/_installation/_packages/component-db.rst

   .. rubric:: Component Monitoring

   .. include:: /_includes/_installation/_packages/component-monit.rst

   .. rubric:: DB Connectors

   .. include:: /_includes/_installation/_packages/component-db-comp.rst

   .. rubric:: Chats DB Connectors

   .. include:: /_includes/_installation/_packages/component-db-chats.rst

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

   .. include:: /_includes/_installation/_steps/db-bootstrap-chats.rst

.. _st1-step8:

.. dropdown:: Step 8: Complete Installation

   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-directory-server.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-directory-server.target

.. _fst1-data:

Data Required for Additional Nodes
----------------------------------

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

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Component MTA AV/AS

   .. include:: /_includes/_installation/_packages/component-mta.rst

.. _st2-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`fst1-data` the command to
   retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st2-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in
   :ref:`fst1-data` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st2-step6:

.. dropdown:: Step 6: Complete Installation

   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-mta.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

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

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Component Proxy

   .. include:: /_includes/_installation/_packages/component-proxy.rst

.. _st3-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`fst1-data` the command to
   retrieve it.

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _st3-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`fst1-data` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _st3-step6:

.. dropdown:: Step 6: Enable ``memcached``
           
   .. include:: /_includes/_installation/_components/memcached-enable.rst
     
.. _st3-step7:

.. dropdown:: Step 7: Complete Installation
  
   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-proxy.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

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

   .. include:: /_includes/_installation/pkg-upgrade.rst
 
   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Component Mailstore & Provisioning

   .. include:: /_includes/_installation/_packages/component-mailstore-provisioning.rst

   .. rubric:: Component Tasks

   .. include:: /_includes/_installation/_packages/component-tasks.rst

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
  
   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-appserver.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

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

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Component Files

   .. include:: /_includes/_installation/_packages/component-files.rst

   .. rubric:: Component |wsc|

   .. include:: /_includes/_installation/_packages/component-chats-cb.rst


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

   .. include:: /_includes/_installation/_components/dispatcher-migration.rst


.. _st5-step7:

.. dropdown:: Step 7: Complete Installation

   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-appserver.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

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

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Component Docs & Editor

   .. include:: /_includes/_installation/_packages/component-docs.rst

   .. rubric:: Component Preview

   .. include:: /_includes/_installation/_packages/component-preview.rst

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

   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-appserver.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

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

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

   .. rubric:: Component Video Server & Video Recording

   .. include:: /_includes/_installation/_packages/component-vs-chats.rst

   .. rubric:: Component |wsc|

   .. include:: /_includes/_installation/_packages/component-chats-cb.rst

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

   After the successful package installation, start all |product|
   services by executing
   
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu|
         
         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru|

         .. code:: console

            # systemctl restart carbonio-appserver.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu|

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru|

         .. code:: console
           
            # systemctl restart carbonio-appserver.target
