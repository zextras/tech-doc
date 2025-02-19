.. _scenario-fr-manual:

===========================
 Manual Roles Installation
===========================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Roles on the Nodes, according to the following guidelines.

.. include:: /_includes/_installation/multinode-suggestions.rst

.. _fr1:

Node One
========

This Node features the *Mesh and Directory* and *Database* Roles.

.. _fr1-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL and other (RHEL only)

   .. include:: /_includes/_installation/repo-single-cb.rst

.. _fr1-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr1-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Mesh and Directory

   .. include:: /_includes/_installation/_packages/role-mesh-ds.rst

   .. rubric:: Role Database

   .. include:: /_includes/_installation/_packages/role-db.rst

.. _fr1-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _fr1-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr1-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr1-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <fr1-step4>`.

   .. card:: Mailbox DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. _fr1-step8:

.. dropdown:: Step 8: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-directory-server.target

.. _fr1-step9:

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

.. _fr2:

Node Two
========

This Node features the *Mesh* and *Directory Replica*  Roles.

.. _fr2-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL and other (RHEL only)

   .. include:: /_includes/_installation/repo-single-cb.rst

.. _fr2-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr2-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Mesh

   .. include:: /_includes/_installation/_packages/role-mesh.rst

   .. rubric:: Role Directory Replica

   .. include:: /_includes/_installation/_packages/role-ds-replica.rst


.. _fr2-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _fr2-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr2-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr2-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <fr2-step4>`.

   .. card:: Mailbox DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. _fr2-step8:

.. dropdown:: Step 8: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-directory-server.target

.. _fr2-step9:

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

.. _fr3:

Node Three
==========

This Node features the *Mesh* and *Monitoring*  Roles.

.. _fr3-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

   .. rubric:: |product|

   .. include:: /_includes/_installation/step-repo-conf.rst

   .. rubric:: PostgreSQL and other (RHEL only)

   .. include:: /_includes/_installation/repo-single-cb.rst

.. _fr3-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr3-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Mesh

   .. include:: /_includes/_installation/_packages/role-mesh.rst

   .. rubric:: Role Monitoring

   .. include:: /_includes/_installation/_packages/role-monit.rst

.. _fr3-step4:

.. dropdown:: Step 4: Configure PostgreSQL

   .. include:: /_includes/_installation/step-conf-db-single-cb.rst

.. _fr3-step5:

.. dropdown:: Step 5: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr3-step6:

.. dropdown:: Step 6: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr3-step7:

.. dropdown:: Step 7: Databases Bootstrap

   Now you have to bootstrap the DB with the password set in
   :ref:`Step 4 of Core Node installation <fr3-step4>`.

   .. card:: Mailbox DB Bootstrap

     .. code:: console

        # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. _fr3-step8:

.. dropdown:: Step 8: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-directory-server.target

.. _fr3-step9:

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

.. _fr4:

Node Four
=========

This Node features the *MTA AV/AS* Role.

.. _fr4-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr4-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr4-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role MTA AV/AS

   .. include:: /_includes/_installation/_packages/role-mta.rst

.. _fr4-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <fsm1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr4-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <fsm1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr4-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-mta.target

.. _fr5:

Node Five
=========

This Node features the (replicated) *MTA AV/AS* Role.

.. _fr5-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr5-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr5-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role MTA AV/AS

   .. include:: /_includes/_installation/_packages/role-mta.rst

.. _fr5-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <fsm1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr5-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <fsm1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr5-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-mta.target

.. _fr6:

Node Six
========

This Node features the *Proxy* Role.

.. _fr6-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr6-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr6-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Proxy

   .. include:: /_includes/_installation/_packages/role-proxy.rst

.. _fr6-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <fsm1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr6-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <fsm1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr6-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-proxy.target

.. _fr7:

Node Seven
==========

This Node features the (replicated) *Proxy* Role.

.. _fr7-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr7-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr7-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Proxy

   .. include:: /_includes/_installation/_packages/role-proxy.rst

.. _fr7-step4:

.. dropdown:: Step 4: Bootstrap |product|

   To carry out this step, you need the **LDAP password** and the
   **Core Node hostname**. Check in :ref:`Step 9 of Core Node
   installation <fsm1-step9>` the command to retrieve it.


   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr7-step5:

.. dropdown:: Step 5: Setup |mesh|

   To carry out this step, you need the |mesh| **secret** generated
   during the installation of the Core Node. Check in :ref:`Step 9 of
   Core Node installation <fsm1-step9>` the command to retrieve it.

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr7-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-proxy.target

.. _fr8:

Node Eight
==========

This Node features the *Mailstore & Provisioning* Role.

.. _fr8-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr8-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr8-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Mailstore & Provisioning

   .. include:: /_includes/_installation/_packages/role-mailstore-provisioning.rst

.. _fr8-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr8-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr8-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-appserver.target

.. _fr9:

Node Nine
=========

This Node features the (replicated) *Mailstore & Provisioning* Role.

.. _fr9-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr9-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr9-step3:

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
   by Role, but you can combine all packages and run the install
   command once.

   .. rubric:: Role Mailstore & Provisioning

   .. include:: /_includes/_installation/_packages/role-mailstore-provisioning.rst

.. _fr9-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr9-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr9-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-appserver.target

.. _fr10:

Node Ten
========

This Node features the *WSC*, *Files*, and *Tasks*  Roles.

.. _fr10-step1:

.. dropdown:: Step 1: Configuration of Repositories

   The installation procedure start with the configuration of the
   repositories.

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

.. _fr10-step2:

.. dropdown:: Step 2: Setting Hostname

   .. include:: /_includes/_installation/steps-hostname.rst

.. _fr10-step3:

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
   by Role, but you can combine all packages and run the install
   command once.


   .. rubric:: Role |wsc|

   .. include:: /_includes/_installation/_packages/role-wsc.rst

   .. rubric:: Role Tasks

   .. include:: /_includes/_installation/_packages/role-tasks.rst

   .. rubric:: Role Files

   .. include:: /_includes/_installation/_packages/role-files.rst

.. _fr10-step4:

.. dropdown:: Step 4: Bootstrap |product|

   .. include:: /_includes/_installation/step-bootstrap.rst

   The next steps concern the configuration and setup of the various
   |product| components.

.. _fr10-step5:

.. dropdown:: Step 5: Setup |mesh|

   .. include:: /_includes/_installation/mesh.rst

   .. include:: /_includes/_installation/pset.rst

.. _fr10-step6:

.. dropdown:: Step 6: Complete Installation

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start


      .. tab-item:: RHEL 8
         :sync: rhel8


         After the successful package installation, start all |product|
         services by using

         .. code:: console

            zextras$ zmcontrol start

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         After the successful package installation, start all |product|
         services by using

         .. code:: console

            # systemctl start/stop/restart carbonio-appserver.target
