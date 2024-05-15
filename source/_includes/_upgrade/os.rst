In order to upgrade from a |product| |prev| on Ubuntu 20.04 (or
RHEL 8) to |product| |release| on Ubuntu 22.04 (or RHEL 9) you need to
follow the procedure in this section. Please read carefully the whole
page before starting the upgrade.

The procedure must be carried out on each Node, starting from the one
on which the Directory Server Role is installed, and it will require
to reboot the Node and therefore a downtime of the |product|
infrastructure must be planned.

The procedure is divided into phases:

#. upgrade PostgreSQL from 12 to 16 (you can skip it if you already
   upgraded)

#. upgrade |product| to |release|

#. upgrade Ubuntu LTS from 20.04 to 22.04 (Jammy Jellifish) or RHEL 8
   to RHEL 9

#. upgrade |product|\'s packages to match the correct repository

#. complete the upgrade procedure
   
Phase 1
-------

Upgrade to PostgreSQL 16 **is mandatory**, because Ubuntu 22.04 does
not support the current PostgreSQL 12 installed on |product|.
Directions to upgrade PostgreSQL can be found in Section
:ref:`pg-upgrade`.

.. hint:: PostgreSQL 12 will be supported only until **24 November
   2024**, so if you did not already upgrade to 16, you should do so
   as soon as possible.

Phase 2
-------

This phase is the same as a normal upgrade, so please refer to Section
:ref:`carbonio-upgrade`.

Phase 3
-------

This phase requires to upgrade the Ubuntu 20.04 distribution to 22.04
or the RHEL 8 to RHEL 9
please refer to the `Ubuntu
<https://ubuntu.com/server/docs/upgrade-introduction>`_ and `Red Hat
<https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/upgrading_from_rhel_8_to_rhel_9/performing-the-upgrade_upgrading-from-rhel-8-to-rhel-9>`_
upstream documentations.

.. note:: If you upgrade to Ubuntu 22 and use the |monit| role, please
   make sure to change the Grafana repository. Please refer to Section
   :ref:`manual-grafana` for directions.

Phase 4
-------

Once you successfully carried out the first three phases, you can
proceed to update the |product| packages to match the
distribution. This phase requires some manual command to be executed.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      During the Ubuntu upgrade, the file
      :file:`/etc/apt/sources.list.d/zextras.list` will be
      modified. You need to make sure that it contains only the
      correct repository, that is, the line defining the repository

      #. contains the word **jammy**

      #. is not commented, i.e., it does not start with a ``#`` sign

   .. tab-item:: RHEL
      :sync: rhel

      During the RHAL upgrade, the file
      :file:`/etc/yum.repos.d/zextras.repo` will be
      modified. You need to make sure that it contains only the
      correct repository, that is, the line defining the repository is::

        baseurl=https://repo.zextras.io/release/rhel9 
      
You can now stop the |product| services

.. code:: console

   # su - zextras -c "zmcontrol stop"

Finally update the package list, and the packages itself with these
commands

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      # apt update && apt dist-upgrade

   .. tab-item:: RHEL
      :sync: rhel

      # dnf upgrade --best --allowerasing

Phase 5
-------

At the end of the upgrade you need to fix the permissions and start the services

.. code:: console

   # /opt/zextras/libexec/zmfixperms
   # su - zextras -c "zmcontrol start"
