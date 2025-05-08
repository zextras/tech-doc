.. _scenario-es-manual:

================================
 Manual Components Installation
================================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Components on the Nodes, according to the following guidelines.

.. include:: /_includes/_installation/multinode-suggestions.rst

Core Node
=========

.. _es1-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL

   .. include:: /_includes/_installation/_repo/pg.rst

.. _es1-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _es1-step3:

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

   Next, we install all packages needed for |product|. We divide them
   by Component, but you can combine all packages and run the install
   command once.

   .. rubric:: Component Mesh & Directory

   .. include:: /_includes/_installation/_packages/component-mesh-ds.rst

   .. rubric:: Component Database

   .. include:: /_includes/_installation/_packages/component-db.rst

   .. rubric:: Component Monitoring

   .. include:: /_includes/_installation/_packages/component-monit.rst

   .. rubric:: DB Connectors

   .. include:: /_includes/_installation/_packages/component-db-comp.rst

.. _es1-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _es1-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _es1-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _es1-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <es1-step4>`.

   .. include:: /_includes/_installation/_steps/db-bootstrap.rst

.. _es1-step8:

.. dropdown:: Step 8: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-directory-server.target

.. _es1-step9:

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

MTA/Proxy Node
==============

.. _es2-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: RHEL Only

   .. tab-set::

      .. tab-item:: RHEL 8
         :sync: rhel8

         You need to add the EPEL repository and enable the BaseOS,
         Appstream, and CodeReady repositories.

         .. code:: console

            # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
            # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
            # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
            # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         You need to add the EPEL repository and enable the BaseOS,
         Appstream, and CodeReady repositories.

         .. code:: console

            # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
            # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
            # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
            # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms

.. _es2-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _es2-step3:

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

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Component MTA AV/AS

   .. include:: /_includes/_installation/_packages/component-mta.rst

   .. rubric:: Component Proxy

   .. include:: /_includes/_installation/_packages/component-proxy.rst

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

.. _es2-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <es1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _es2-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <es1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _es2-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-mta.target
            # systemctl restart carbonio-proxy.target

Mailstore Node
==============

.. _es3-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: RHEL Only

   .. tab-set::

      .. tab-item:: RHEL 8
         :sync: rhel8

         You need to add the EPEL repository and enable the BaseOS,
         Appstream, and CodeReady repositories.

         .. code:: console

            # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
            # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
            # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
            # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         You need to add the EPEL repository and enable the BaseOS,
         Appstream, and CodeReady repositories.

         .. code:: console

            # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
            # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
            # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
            # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms

.. _es3-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _es3-step3:

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

   Next, we install all packages needed for |product|. We divide them
   by Component and functionality, but you can combine all packages and run
   the install command once.

   .. rubric:: Component Mailstore & Provisioning

   .. include:: /_includes/_installation/_packages/component-mailstore-provisioning.rst

   .. rubric:: Mesh agent

   .. include:: /_includes/_installation/_packages/mesh-agent.rst

.. _es3-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _es3-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _es3-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl restart carbonio-appserver.target
