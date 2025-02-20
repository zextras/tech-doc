.. _single-server-install:

==================================
 Single-Server Manual Installation
==================================

The manual installation is organised in steps and requires to execute
commands from the command line, so make sure you have access to it.

Please note that you may skip some steps, if you plan to install only
the *Core Node*, namely the DB components of WSC and their
corresponding Database bootstraps.

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser, see Section
:ref:`web-access`.

Core Node
=========

The installation procedure start with the configuration of the
repositories.

.. _n1-s1:

.. dropdown:: Step1: Configuration of Repositories

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL and other (RHEL only)

   .. include:: /_includes/_installation/repo-single-cb.rst

.. _n1-s2:

.. dropdown:: Step2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _n1-s3:

.. dropdown:: Step3: System Upgrade and Package Installation

   .. include:: /_includes/_installation/step-package-install-single-cb.rst
   .. include:: /_includes/_installation/step-package-install-single-collaboration-node-cb.rst

.. _n1-s4:

.. dropdown:: Step4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _n1-s5:

.. dropdown:: Step5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

The next steps concern the configuration and setup of the various
|product| components.

.. _n1-s6:

.. dropdown:: Step6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst


Now you have to bootstrap some DBs with the password set in the Preliminary Tasks

.. _n1-s7:

.. dropdown:: Step7: Databases Bootstrap

   .. card:: Mailbox DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

   .. card:: Files DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

   If you plan to install also the Collaboration Node, you need to
   bootstrap also the following databases

   .. card:: |docs|

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

   .. card:: |task|

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-tasks-db-bootstrap carbonio_adm 127.0.0.1

   .. card:: Message Dispatcher

      .. code:: console

         # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-db-bootstrap carbonio_adm 127.0.0.1

   .. card:: |wsc|

      .. code:: console

         # PGPASSWORD=$DB_ADM_PWD carbonio-ws-collaboration-db-bootstrap  carbonio_adm 127.0.0.1

.. _n1-s8:

.. dropdown:: Step8: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, restart all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, restart all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, restart all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, restart all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-directory-server.target
            # systemctl restart carbonio-appserver.target
            # systemctl restart carbonio-mta.target
            # systemctl restart carbonio-proxy.target

   If you chose to install only the core services, installation has
   completed. Otherwise, if you plan to use collaboration features,
   please read :ref:`Step 9 <n1-s9>` before proceeding
   to the installation of the other Nodes.

.. _n1-s9:

.. dropdown:: Step9: Data Required for Additional Nodes

   The following data from this Node will be needed during the
   installation of the *Collaboration* and *Video Server* Nodes.

   .. include:: /_includes/_installation/data-for-next-nodes.rst

Check Services Status
---------------------

The quickest way to check the status of services is by issuing the
following command and verify that in the output they are appear as
**Active** or **Running**.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         zextras$ zmcontrol status

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         zextras$ zmcontrol status

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         zextras$ zmcontrol status

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9


      .. code:: console

         zextras$ zmcontrol status

In case some of the services is not running, please refer to Section
:ref:`ts-cli` (if you are running Ubuntu or RHEL 8) or to the
dedicated :ref:`RHEL 9 box <rhel-systemd>`.
              
Collaboration Node
==================

This section contains directions to set up the additional
*Collaboration* Node. Most of the steps are the same as in the *Core
Node*. Click on the drop-downs to expand them.

.. dropdown:: Step 1: Configuration of Repositories

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

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

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

   Next, we install all packages needed for |product|.

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         .. code:: console

            # apt install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql-client

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql-client

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql16

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         .. code:: console

            # dnf install carbonio-message-dispatcher \
            carbonio-ws-collaboration \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql16


.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Node hostname** that you have retrieved at Step 9 of the Core
   Node (see :ref:`Step 9 <n1-s9>`).

   .. include:: /_includes/_installation/step-bootstrap.rst

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node (see :ref:`Step 9
   <n1-s9>`).
   
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
   (see in Step :ref:`Step <n1-s9>` how to retrieve it).

   .. code:: console

      # read -s -p "Insert Password:" DB_ADM_PWD

   Now, run command
   
   .. include:: /_includes/_installation/_roles/dispatcher-migration.rst

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

Video Server Node
=================

This section contains directions to set up the additional *Video
Server* Node. Most of the steps are the same as in the *Core* and
*Collaboration* Nodes. Click on the drop-downs to expand them.

.. dropdown:: Step 1: Configuration of Repositories

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

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

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

   Next, we install all packages needed for |product|.

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         .. code:: console

            # apt install carbonio-videoserver-advanced \
            carbonio-videoserver-recorder service-discover-agent

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install carbonio-videoserver-advanced \
            carbonio-videoserver-recorder service-discover-agent

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install carbonio-videoserver-advanced \
            carbonio-videoserver-recorder service-discover-agent

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         .. code:: console

            # dnf install carbonio-videoserver-advanced \
            carbonio-videoserver-recorder service-discover-agent


.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Node hostname** that you have retrieved at Step 9 of the Core
   Node (see :ref:`Step 9 <n1-s9>`).

   .. include:: /_includes/_installation/step-bootstrap.rst

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node (see the
   :ref:`Step 8 <n1-s8>` Step).
   
   The |mesh| configuration is interactively generated by command

   .. code:: console

      # service-discover setup-wizard

   To complete |mesh| installation, run

   .. code:: console

      # pending-setups -a

.. dropdown:: Step 6: Configure |vs|

   .. rubric:: Routing & mapping

   Make sure that the Video Server's IP address is present in the
   configuration file :file:`/etc/janus/janus.jcfg` and add it if
   missing: find the variable ``nat_1_1_mapping`` and add it, for
   example: ``nat_1_1_mapping = "93.184.216.34"``

   .. rubric:: Check Video Server & Broker

   To make sure that videoserver and message broker are connected
   successfully, check that in the carbonio-videoserver logs
   (:command:`journalctl -u carbonio-videoserver`) you find the line::

     RabbitMQEventHandler: Connected successfullySetup of RabbitMQ event
     handler completed

.. dropdown:: Step 7: Install Video Recording

   To install the video recording functionality, install the following
   package. No configuration is required.

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         .. code:: console

            # apt install carbonio-videorecorder

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install carbonio-videorecorder

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install carbonio-videorecorder

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         .. code:: console

            # dnf install carbonio-videorecorder
