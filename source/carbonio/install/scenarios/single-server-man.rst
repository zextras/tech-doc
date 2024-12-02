.. _single-server-install:

==================================
 Single-Server Manual Installation
==================================

The manual installation is organised in steps, some of which are
preliminary configuration tasks.
During the installation and configuration of |product|, it is necessary to
execute commands from the command line, so make sure you have access
to it.

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser.

.. _rhel-pg:

Preliminary Task
----------------

Before starting the |product| installation, we need to install and
configure the PostgreSQL 16 database.

.. include:: /_includes/_installation/pg-ss.rst

.. _installation-step1:

Step 1: Repository Configuration
--------------------------------

.. include:: /_includes/_installation/step-repo-conf-ce.rst

.. _installation-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst

.. _installation-step3:

Step 3: System Upgrade and Package Installation
------------------------------------------------

.. include:: /_includes/_installation/step-package-install-ssadv.rst

.. _installation-step4:

Step 4: Bootstrap |product|
---------------------------

.. include:: /_includes/_installation/step-bootstrap.rst 

The next steps concern the configuration and setup of the various
|product| components.

.. _installation-step5:

Step 5: Setup |mesh|
--------------------

.. include:: /_includes/_installation/step-conf-mesh.rst

.. _installation-step6:

Step 6: Mailbox DB Bootstrap
----------------------------

Now you have to bootstrap some DBs with the password set in the Preliminary Tasks

.. card:: Mailbox DB Bootstrap

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. card:: Files DB Bootstrap

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1


Step 7: Complete
----------------

.. include:: /_includes/_installation/complete.rst
