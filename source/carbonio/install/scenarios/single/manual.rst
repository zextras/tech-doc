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

.. _installation-step1:

Step 1: Configuration of Repositories
=====================================

The installation procedure start with the configuration of the
repositories.

.. rubric:: |product|

.. include:: /_includes/_installation/step-repo-conf-ce.rst

.. rubric:: PostgreSQL and other (RHEL only)

.. include:: /_includes/_installation/repo-single-cb.rst

.. _installation-step2:

Step 2: Setting Hostname
========================

.. include:: /_includes/_installation/steps-hostname.rst

.. _installation-step3:

Step 3: System Upgrade and Package Installation
===============================================

.. include:: /_includes/_installation/step-package-install-single-cb.rst
.. include:: /_includes/_installation/step-package-install-single-collaboration-node-cb.rst

.. _installation-step4:

Step 4: Configure PostgreSQL
============================

.. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _installation-step5:

Step 5: Bootstrap |product|
===========================

.. include:: /_includes/_installation/step-bootstrap.rst

The next steps concern the configuration and setup of the various
|product| components.

.. _installation-step6:

Step 6: Setup |mesh|
====================

.. include:: /_includes/_installation/step-conf-mesh.rst

.. _installation-step7:

Step 7: Databases Bootstrap
===========================

Now you have to bootstrap some DBs with the password set in the Preliminary Tasks

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

.. card:: Carbonio Notification Push

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-notification-push-db-bootstrap carbonio_adm 127.0.0.1


Step 8: Complete
================

.. include:: /_includes/_installation/complete.rst

Collaboration Node
==================

This section contains directions to set up the additional
*Collaboration* Node. Most of the steps are the same as in the *Core
Node*. Click on the drop-downs to expand them.

.. dropdown:: Step 1: Configuration of Repositories

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf-ce.rst

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
            carbonio-ws-collaboration carbonio-notification-push \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql-client

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install carbonio-message-dispatcher \
            carbonio-ws-collaboration carbonio-notification-push \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql-client

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install carbonio-message-dispatcher \
            carbonio-ws-collaboration carbonio-notification-push \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql16

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         .. code:: console

            # dnf install carbonio-message-dispatcher \
            carbonio-ws-collaboration carbonio-notification-push \
            carbonio-push-connector service-discover-agent \
            carbonio-tasks carbonio-docs-editor \
            carbonio-docs-connector postgresql16


.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/step-conf-mesh.rst


.. dropdown:: Step 6: Configure |WSC|

   .. rubric:: Initialise the message dispatcher

   .. include:: /_includes/_installation/_roles/dispatcher-migration.rst

   .. rubric:: Configure notifications

   .. include:: /_includes/_installation/_roles/wsc-conf-cb.rst

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

   .. include:: /_includes/_installation/step-repo-conf-ce.rst

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

            # apt install carbonio-videoserver \
            carbonio-videoserver-recorder service-discover-agent
            
      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         .. code:: console

            # apt install  carbonio-videoserver \
            carbonio-videoserver-recorder service-discover-agent

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install  carbonio-videoserver \
            carbonio-videoserver-recorder service-discover-agent

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         .. code:: console

            # dnf install carbonio-videoserver \
            carbonio-videoserver-recorder service-discover-agent


.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/step-conf-mesh.rst

