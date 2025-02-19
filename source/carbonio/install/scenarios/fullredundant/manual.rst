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
