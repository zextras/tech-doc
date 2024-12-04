.. _single-server-install:

==================================
 Single-Server Manual Installation
==================================

The manual installation is organised in steps and requires to execute
commands from the command line, so make sure you have access to it.

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

.. _installation-step4:

Step 4: Configure PostgreSQL
============================

.. include:: /_includes/_installation/step-conf-db.rst

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

Step 7: Mailbox DB Bootstrap
============================

Now you have to bootstrap some DBs with the password set in the Preliminary Tasks

.. card:: Mailbox DB Bootstrap

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. card:: Files DB Bootstrap

  .. code:: console

     # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

Step 8: Complete
================

.. include:: /_includes/_installation/complete.rst
