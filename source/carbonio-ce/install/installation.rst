.. _installation:

===================
Manual Installation
===================

.. _single-install-manual:

The manual installation is organised in steps, some of which are
preliminary configuration tasks, and some is optional.  During the
installation and configuration of |product|, it is necessary to
execute commands from the command line, so make sure you have access
to it.

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser: directions can be found in
Section :ref:`web-access`.

In case you experience some issues during the installation, please
refer to Section :ref:`systemd-guide`, in which you can find helpful
commands.

.. _rhel-pg:

Preliminary Task
----------------

Before starting the |product| installation, we need to install and
configure the PostgreSQL 16 database.

.. include:: /_includes/_installation/pg-ce.rst

.. _installation-step1:

Step 1: Repository Configuration
--------------------------------

.. include:: /_includes/_installation/step-repo-conf.rst
.. include:: /_includes/_installation/repo-info.rst

.. _installation-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst
   

.. div:: sd-fs-5

   :octicon:`gear` Installation task

.. _installation-step3:

Step 3: System Upgrade and Package Installation
------------------------------------------------

.. include:: /_includes/_installation/step-package-install.rst

.. _post-inst:

.. div:: sd-fs-5

   :octicon:`gear` Post-Installation tasks

.. _installation-step4:

Step 4: Configure Firewall
--------------------------


.. include:: /_includes/_installation/step-firewall.rst

.. _installation-step5:

Step 5: Configure |vs|
----------------------

.. include:: /_includes/_installation/note-janus.rst

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable carbonio-videoserver.service
   # systemctl start  carbonio-videoserver.service

.. _installation-step6:

Step 6: Bootstrap |product|
---------------------------

.. include:: /_includes/_installation/step-bootstrap.rst

.. _config-setup-tasks:

.. div:: sd-fs-5

   :octicon:`gear`  Configuration and Setup tasks

The next steps concern the configuration and setup of the various
|product| components.

.. _installation-step7:

Step 7: Setup |mesh|
--------------------

.. include:: /_includes/_installation/mesh.rst

.. include:: /_includes/_installation/pset.rst

.. _installation-step8:

Step 8: Bootstrap |file| Databases
----------------------------------

.. include:: /_includes/_installation/_steps/db-bootstrap-ce.rst

.. include:: /_includes/_installation/_steps/db-bootstrap-chats-ce.rst

.. include:: /_includes/_installation/_steps/chats-migration-single-server-ce.rst

.. include:: /_includes/_installation/complete.rst

