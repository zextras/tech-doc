.. _single-server-install:

============================
 Single-Server Installation
============================

.. _single-install-auto:

Automatic Script-based Installation
===================================

The installation on supported Ubuntu (**22.04** and **20.04**), or Red
Hat (**RHEL 8** and **RHEL 9**) distributions can be carried out by
downloading, editing, and running a dedicated **bash script** on the
Server on which you want to install |product|.

The script will recognise the version of the OS and execute the steps
that are described in :ref:`single-install-manual`.

To correctly run the script, please follow these advices

* Make sure you have read and completed tasks mentioned in
  :ref:`carbonio-requirements` and :ref:`preliminary`
* Review the script and the tasks it performs before you run it
* Run the script as the ``root`` user on the server on which you want
  to install |product|
* When the script successfully completes, it will print on the screen
  the password of the |mesh| and PostgreSQL services that you will
  need some important Administration task. Make sure that you store
  them in a safe place!
* For RHEL, the :ref:`rhel-requirements` are automatically satisfied
  by the script

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      Script for Ubuntu 22.04
      :download:`/scripts/install_carbonio_ce_singleserver_ubuntu.sh`

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      Script for Ubuntu 24.04
      :download:`/scripts/install_carbonio_ce_singleserver_ubuntu.sh`

   .. tab-item:: RHEL 8
      :sync: rhel8

      Script for RHEL 8
      :download:`/scripts/install_carbonio_ce_singleserver_rhel.sh`

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. warning:: The script does not yet support RHEL 9
         installations, you need to install manually, see next Section
         (:ref:`single-install-manual`).

.. _single-install-manual:

Manual Installation
===================

The manual installation is organised in steps, some of which are
preliminary configuration tasks, and some is optional.  During the
installation and configuration of |product|, it is necessary to
execute commands from the command line, so make sure you have access
to it.

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser: directions can be found in
Section :ref:`web-access`.

In case you experience some issues during the installation, please
refer to Section :ref:`ts-cli`, in which you can find helpful
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

.. _installation-step8:

Step 8: Bootstrap |file| Databases
----------------------------------

.. include:: /_includes/_installation/_steps/db-bootstrap.rst

.. include:: /_includes/_installation/_steps/db-bootstrap-chats-ce.rst

.. include:: /_includes/_installation/_steps/chats-migration-single-server-ce.rst

.. include:: /_includes/_installation/complete.rst

.. _installation-step9:

Step 9: Enable |wsc| UI
-----------------------

The |wsc| Component is disabled by default, you can enable it either from
the |adminui| or from the command line by running as the ``zextras``
user the command

.. code:: console

   zextras$ carbonio prov mc default carbonioFeatureWscEnabled TRUE

This command enables the chat for the ``default`` COS, but you can
enable it only on selected COSes.

Restart the following services in the given order

#. Message broker

   .. code:: console
   
      # systemctl restart carbonio-message-broker

#. Message dispatcher
   
   .. code:: console

      # systemctl restart carbonio-message-dispatcher

#. |wsc| 

   .. code:: console

      # systemctl restart carbonio-ws-collaboration

#. In case you also installed |vs|

   .. code:: console

      # systemctl restart carbonio-videoserver

   
.. card:: Check status of |wsc|

   After the installation, you can check the status of and all its
   dependencies by running command

   .. code:: console

      # curl -v http://127.78.0.4:10000/health | jq

