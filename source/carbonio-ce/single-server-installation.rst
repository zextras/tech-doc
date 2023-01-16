.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _single-server-install:

Single-Server Installation
==========================

The installation on Ubuntu 20.04 or RHEL 8 is organised in steps, some
of which are preliminary configuration tasks, and some is optional.
During the installation and configuration of |product|, it is
necessary to execute commands from the command line, so make sure you
have access to it.

.. _preliminary-rh:

RHEL 8-only Preliminary Tasks
-----------------------------

.. include:: /_includes/_installation/preliminary-rh.rst

.. _installation-step1:

Step 1: Repository Configuration
--------------------------------

.. include:: /_includes/_installation/step-repo-conf-ce.rst
.. include:: /_includes/_installation/repo-info.rst

.. _installation-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst
   

.. div:: sd-fs-5

   :octicon:`gear` Installation task

.. _installation-step3:

Step 3:  System Upgrade and Package Installation
------------------------------------------------

.. include:: /_includes/_installation/step-package-install.rst

.. _post-inst:

.. div:: sd-fs-5

   :octicon:`gear` Post-Installation tasks

.. _installation-step4:

Step 4: Bootstrap |product|
---------------------------

.. include:: /_includes/_installation/step-bootstrap.rst

.. _config-setup-tasks:

.. div:: sd-fs-5

   :octicon:`gear`  Configuration and Setup tasks

The next steps concern the configuration and setup of the various
|product| components.

.. _installation-step5:

Step 5: Setup |mesh|
--------------------

.. include:: /_includes/_installation/step-conf-mesh.rst

.. hint:: In case of errors related to |mesh| token, please refer to
   section :ref:`upgrade-ts-token`.

.. _installation-step6:

Step 6: Create Main DB Role and Database for |product|
------------------------------------------------------

.. include:: /_includes/_installation/step-conf-db.rst

.. _installation-step7:

Step 7: Bootstrap |file| Databases
----------------------------------

.. include:: /_includes/_installation/step-conf-files-ce.rst

.. include:: /_includes/_installation/complete.rst
.. include:: /_includes/_installation/users.rst

.. _web-access:

Access to the Web Interface
---------------------------

.. include:: /_includes/_installation/web-access.rst

|product| Management and troubleshooting
----------------------------------------

.. include:: /_includes/_installation/commands.rst
