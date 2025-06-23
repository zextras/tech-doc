.. _scenario-fr-manual:

================================
 Manual Components Installation
================================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Components on the Nodes, according to the following guidelines.

.. include:: /_includes/_installation/multinode-suggestions.rst

.. _fr1:

Node One
========

This Node features the *Mesh & Directory* and *Database* Components.

.. _fr1-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL

   .. include:: /_includes/_installation/_repo/pg.rst

.. _fr1-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr1-step3:

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

   .. rubric:: DB Connectors

   .. include:: /_includes/_installation/_packages/component-db-comp.rst

   .. rubric:: Chats DB Connectors

   .. include:: /_includes/_installation/_packages/component-db-chats.rst

.. _fr1-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _fr1-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr1-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr1-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <fr1-step4>`.

   .. include:: /_includes/_installation/_steps/db-bootstrap.rst

   .. include:: /_includes/_installation/_steps/db-bootstrap-chats.rst

.. _fr1-step8:

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

.. _fr1-data:

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

.. _fr2:

Node Two
========

This Node features the *Mesh* and *Directory Replica*  Components.

.. _fr2-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr2-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr2-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

   After configuring the repositories, the installation of |product|
   requires to run a few commands.

   We start by updating and upgrading the system.

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Component Mesh

   .. include:: /_includes/_installation/_packages/component-mesh.rst

   .. rubric:: Component Directory Replica

   .. include:: /_includes/_installation/_packages/component-ds-replica.rst


.. _fr2-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _fr2-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr2-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr2-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <fr2-step4>`.

   .. card:: Mailbox DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. _fr2-step8:

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

.. _fr2-step9:

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

.. _fr3:

Node Three
==========

This Node features the *Mesh* and *Monitoring*  Components.

.. _fr3-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr3-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr3-step3:

.. dropdown:: Step 3: System Upgrade and Package Installation

   After configuring the repositories, the installation of |product|
   requires to run a few commands.

   We start by updating and upgrading the system.

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Component Mesh

   .. include:: /_includes/_installation/_packages/component-mesh.rst

   .. rubric:: Component Monitoring

   .. include:: /_includes/_installation/_packages/component-monit.rst

.. _fr3-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _fr3-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr3-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr3-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <fr3-step4>`.

   .. card:: Mailbox DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. _fr3-step8:

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

.. _fr3-step9:

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

.. _fr4:

Node Four
=========

This Node features the *MTA AV/AS* Component.

.. _fr4-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr4-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr4-step3:

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

.. _fr4-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`fr1-data` the command to
   retrieve it.

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr4-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`fr1-data`
   the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr4-step6:

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

.. _fr5:

Node Five
=========

This Node features the (replicated) *MTA AV/AS* Component.

.. _fr5-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr5-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr5-step3:

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

.. _fr5-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`fr1-data` the command to
   retrieve it.

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr7-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`fr1-data`
   the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr7-step6:

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

.. _fr8:

Node Eight
==========

This Node features the *Mailstore & Provisioning* Component.

.. _fr8-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr8-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr8-step3:

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

.. _fr8-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr8-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr8-step6:

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

.. _fr9:

Node Nine
=========

This Node features the (replicated) *Mailstore & Provisioning* Component.

.. _fr9-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr9-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr9-step3:

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

.. _fr9-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr9-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr9-step6:

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

.. _fr10:

Node Ten
========

This Node features the *, *Files*, and *Tasks*  Components.

.. _fr10-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: Configure PostgreSQL Repository

   .. include:: /_includes/_installation/_repo/pg.rst

.. _fr10-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr10-step3:

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

   .. rubric:: Component |wsc|

   .. include:: /_includes/_installation/_packages/component-chats-cb.rst

   .. rubric:: Component Tasks

   .. include:: /_includes/_installation/_packages/component-tasks.rst

   .. rubric:: Component Files

   .. include:: /_includes/_installation/_packages/component-files.rst

.. _fr10-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr10-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr10-step6:

.. dropdown:: Step 6: Dispatcher DB migration

   .. note:: You need to run the following commands only on one of the
      Nodes featuring thr |wsc| Component.

   Initialise the message dispatcher

   .. include:: /_includes/_installation/_components/dispatcher-migration.rst

.. _fr10-step7:

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

.. _fr11:

Node Eleven
===========

This Node features the (replicated) *, *Files*, and *Tasks* Components.

.. _fr11-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: Configure PostgreSQL Repository

   .. include:: /_includes/_installation/_repo/pg.rst

.. _fr11-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr11-step3:

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

   .. rubric:: Component |wsc|

   .. include:: /_includes/_installation/_packages/component-chats-cb.rst

   .. rubric:: Component Tasks

   .. include:: /_includes/_installation/_packages/component-tasks.rst

   .. rubric:: Component Files

   .. include:: /_includes/_installation/_packages/component-files.rst

.. _fr11-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr11-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr11-step6:

.. dropdown:: Step 6: Dispatcher DB migration

   .. note:: You need to run the following commands only on one of the
      Nodes featuring thr |wsc| Component. If you already run them on Node
      10, skip them safely.

   Initialise the message dispatcher

   .. include:: /_includes/_installation/_components/dispatcher-migration.rst

.. _fr11-step7:

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

.. _fr-12:

Node Twelve
===========

This Node features the *Docs & Editor* and *Preview* Components.

.. _fr12-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr12-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr12-step3:

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

.. _fr12-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr12-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr12-step6:

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

.. _fr-13:

Node Thirteen
=============

This Node features the (replicated) *Docs & Editor* and *Preview*
Components.

.. _fr13-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr13-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr13-step3:

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

.. _fr13-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr13-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr13-step6:

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

.. _fr14:

Node Fourteen
=============

This Node features the *Video Server & Video Recording* Component.

.. _fr14-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr14-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr14-step3:

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

.. _fr14-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr14-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr14-step6:

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

.. _fr15:

Node Fifteen
============

This Node features the (replicated) *Video Server & Video Recording*
Component.

.. _fr15-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

.. _fr15-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr15-step3:

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

.. _fr15-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr15-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr15-step6:

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
