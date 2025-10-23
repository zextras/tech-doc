.. _single-server-install:

==================================
 Single-Server Manual Installation
==================================

The manual installation is organised in steps and requires to execute
commands from the command line, so make sure you have access to it.

|product| can be installed on a single server node which provides the
essential functionalities:

* Mail
* Calendar
* Contacts
* Backup
* Files
* Preview

If your use case also requires collaboration tools or video features, the single-server installation can be extended by adding:

* a :ref:`Collaboration Node <single-collab-inst>` that consists of
  Docs, |wsc|, and Tasks
* a :ref:`Video Server Node <single-vs-inst>` to enable video
  streaming and video recording

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser, see Section
:ref:`web-access`.

.. _single-arch:

Architecture
============

The architecture of this scenario is depicted in the following diagram.

.. _fig-single-core:

.. figure:: /img/carbonio/scenario-single-core.png
   :width: 45%
   :align: center

   Sample diagram of the Single Server Node.

Requirements
============

Hardware Requirements for the Core Node are more demanding compared to
each single Node in a |product| Multi-Node setup.

* 8 vCPU
* 24 GB memory
* 100 GB disk space for the OS
* Additional disk space for the users's e-mail storage, taking into
  account the expected e-mail volume, quota, and retention
  policies. This storage must be mounted under :file:`/opt/zextras`

.. _scenario-single-network:

Network Configuration
=====================

The following ports must be forwarded from the :ref:`external network
<fw-external>`, i.e., they are required for proper access to |product|
from the Internet.

.. table:: Forwarded ports in Scenario *Single Server*.

   +-------------------+--------------------------+------------------+
   | Public hostname   | Ports & Service          | Mapping          |
   +===================+==========================+==================+
   | mail.example.com  | * TCP 25/465/587  SMTP/S | srv1.example.com |
   |                   | * TCP 80/443      HTTP/S |                  |
   |                   | * TCP 143/993     IMAP/S |                  |
   |                   | * TCP 110/995     POP/S  |                  |
   |                   | * TCP 8636        LDAP   |                  |
   |                   |   Addresbook             |                  |
   +-------------------+--------------------------+------------------+

.. _single-core-inst:

Installation
============

The installation procedure start with the configuration of the
repositories.

.. _n1-s1:

.. dropdown:: Step 1: Configuration of Repositories

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: Configure PostgreSQL Repository

   .. include:: /_includes/_installation/_repo/pg.rst

.. _n1-s2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _n1-s3:

.. dropdown:: Step 3: System Upgrade and Package Installation

   .. include:: /_includes/_installation/step-package-install-single-cb.rst

.. _n1-s4:

.. dropdown:: Step 4: Initialise and configure PostgreSQL

   .. rubric:: Initialisation

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

   .. rubric:: Configuration

   .. include:: /_includes/_installation/_repo/pg-access.rst

.. _n1-s5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

.. _n1-s6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _n1-s7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DBs with the |dbadmpwd| password set
   in the *Initialisation* in :ref:`Step 4 <n1-s4>`.

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
      # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

.. _n1-s8:

.. dropdown:: Step 8: Complete Installation

   After the successful package installation, start all |product|
   services by using

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
            # systemctl restart carbonio-appserver.target
            # systemctl restart carbonio-mta.target
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

            # systemctl restart carbonio-directory-server.target
            # systemctl restart carbonio-appserver.target
            # systemctl restart carbonio-mta.target
            # systemctl restart carbonio-proxy.target

   If you chose to install only the core services, installation has
   completed. Otherwise, if you plan to use collaboration features,
   please read :ref:`n1-data` before proceeding
   to the installation of the other Nodes.

.. _n1-data:

Data Required for Additional Nodes
----------------------------------

The following data from this Node will be needed during the
installation of the *Collaboration* and *Video Server* Nodes.

.. include:: /_includes/_installation/data-for-next-nodes.rst

Check Services Status
---------------------

The quickest way to check the status of services is by issuing the
following command and verify that in the output they are appear as
**Active** or **Running**.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # systemctl status carbonio.target

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         zextras$ zmcontrol status

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         zextras$ zmcontrol status

   .. tab-item:: RHEL 9
      :sync: rhel9


      .. code:: console

         # systemctl status carbonio.target

