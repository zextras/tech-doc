.. _single-collab-inst:

==============================================
Extend Manual Installation: Collaboration Node
==============================================

This section contains the architectural diagram, requirements, network
configuration, and directions to set up the additional *Collaboration
Server* Node.

Architecture
============

The architecture of this scenario is depicted in the following diagram.

.. _fig-single-collab:

.. figure:: /img/carbonio/scenario-single-collaboration.png
   :width: 70%
   :align: center

   Sample diagram of the Collaboration Node within the Single Server
   scenario.

Requirements
============

Hardware Requirements for the Collaboration Node are:

* 4 vCPU
* 16 GB memory
* 50 GB disk space for the operating system

Network Configuration
=====================

No ports should be forwarded from the Internet to the Collaboration
Node.

Collaboration Node Installation
===============================

Directions are separated in steps, organised in drop-downs. Click each
of them to expand the content.

.. warning:: Please pay attention to **Step 4**: the installation
   command needs to be executed on the **Core Node**.

.. dropdown:: Step 1: Configuration of Repositories

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL

   .. include:: /_includes/_installation/_repo/pg.rst

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. dropdown:: Step 3: System Upgrade and Package Installation

   After configuring the repositories, the installation of |product|
   requires to run a few commands.

   We start by updating and upgrading the system.

   .. include:: /_includes/_installation/pkg-upgrade.rst

   Next, we install all packages needed for |product|.

   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql-client-16 \
            carbonio-notification-push

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         .. code:: console

            # apt install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql-client-16 \
            carbonio-notification-push

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql16 \
            carbonio-notification-push

      .. tab-item:: RHEL 9
         :sync: rhel9

         .. code:: console

            # dnf install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql16 \
            carbonio-notification-push

.. dropdown:: Step 4: Tasks to carry out on the **Core Node**
   :color: danger
   :class-title: sd-bg-danger

   These task are required only if you plan to install the
   corresponding Component.

   .. hint:: All the commands in this step **must be executed** on the
      Core Node as the |ru|.

   .. rubric:: Install user interface packages

   These packages provide the Graphic User Interface for |wsc| and
   |task|.

   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install carbonio-ws-collaboration-ui \
            carbonio-tasks-ui

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         .. code:: console

            # apt install carbonio-ws-collaboration-ui \
            carbonio-tasks-ui

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # apt install carbonio-ws-collaboration-ui \
            carbonio-tasks-ui

      .. tab-item:: RHEL 9
         :sync: rhel9

         .. code:: console

            # apt install carbonio-ws-collaboration-ui \
            carbonio-tasks-ui


   .. rubric:: Install DB connectors packages

   These packages provide access to the Database to |task|, |docs|, and |wsc|.

   .. include:: /_includes/_installation/step-package-install-single-collaboration-node-cb.rst

   .. rubric:: Register DB connectors to |mesh|

   .. include:: /_includes/_installation/pset.rst

   .. rubric:: Bootstrap Databases

   Execute the following commands to initialise the
   databases. Remember to use the password |dbadmpwd| password set in
   the *Initialisation* in :ref:`Step 4 <n1-s4>` of Core Node's
   installation.

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1
      # PGPASSWORD=$DB_ADM_PWD carbonio-tasks-db-bootstrap carbonio_adm 127.0.0.1
      # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-db-bootstrap carbonio_adm 127.0.0.1
      # PGPASSWORD=$DB_ADM_PWD carbonio-ws-collaboration-db-bootstrap  carbonio_adm 127.0.0.1
      # PGPASSWORD=$DB_ADM_PWD carbonio-notification-push-db-bootstrap  carbonio_adm 127.0.0.1


.. dropdown:: Step 5: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Node hostname** that you have retrieved at Step 9 of the Core
   Node (see :ref:`n1-data`).

   .. include:: /_includes/_installation/step-bootstrap.rst

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node (see :ref:`n1-data`).

   The |mesh| configuration is interactively generated by command

   .. code:: console

      # service-discover setup-wizard

   To complete |mesh| installation, run

   .. code:: console

      # pending-setups -a

.. dropdown:: Step 6: Configure |WSC|

   .. rubric:: Initialise the message dispatcher

   To carry out this step, you need the **PostgreSQL bootstrap**
   password that you defined during the installation of the Core Node
   (see in :ref:`n1-data` how to retrieve it).

   .. code:: console

      # read -s -p "Insert Password:" DB_ADM_PWD

   Now, run command

   .. include:: /_includes/_architecture/_components/dispatcher-migration.rst

   .. rubric:: Enable |wsc|

   |wsc| can be enabled from the |adminui| at account or COS level:
   please refer to Sections :ref:`Account / Configuration <act-conf>` and
   :ref:`cos-features`, respectively.

   .. hint:: If the |wsc| installation is successful, you can optimise
      some values according to the guidelines that you can find in
      section :ref:`wsc-optimise`.

   .. rubric:: Status Check

   The following command will output a detailed status of |wsc| and of
   all its dependencies.

   .. code:: console

      # curl -v http://127.78.0.4:10000/health | jq
