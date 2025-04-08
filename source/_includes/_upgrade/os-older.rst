The procedure must be carried out on each Node, starting from the one
on which the Directory Server Role is installed, and it will require
to reboot the Node and therefore a downtime of the |product|
infrastructure must be planned. Please read carefully the whole
section before starting the upgrade.

The procedure is divided into phases:

#. upgrade PostgreSQL from 12 to 16 (you can skip it if you already
   upgraded)

#. manual upgrade |product| to |release|

#. upgrade Ubuntu LTS from 20.04 to 22.04 (Jammy Jellifish) or RHEL 8
   to RHEL 9. Note that this release, **25.03**, is the last version
   supporting **Ubuntu 20.04 LTS**, which goes EOL in May 2025, so you
   are strongly recommended to **upgrade to Ubuntu 22.04 LTS**.

#. upgrade |product|\'s packages to match the correct repository

#. complete the upgrade procedure

Phase 1
-------

If you have not yet upgraded to Postgres 16, do so before upgrading
the operating system. Directions to upgrade PostgreSQL can be found
in Section :ref:`pg-upgrade`.

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
   make sure to :ref:`change the Grafana repository <manual-grafana>`.

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

      During the RHEL upgrade, the file
      :file:`/etc/yum.repos.d/zextras.repo` will be modified. You need
      to make sure that it contains only the correct repository, that
      is, the line defining the repository is::

        baseurl=https://repo.zextras.io/release/rhel9

Then update the package list, and the packages themselves with these
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

After completing the installation you need to update also the ubuntu
repositories with the new version.

* Before changing anything, back up your current APT sources:

  .. code:: console
            
     zextras$ sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

* Update sources.list entries from focal to jammy, Open with your text editor:

  .. code:: console
            
     zextras$ sudo nano /etc/apt/sources.list

* Then replace all instances of:

  ``focal``

  with
  
  ``jammy``
  

* If you have third-party PPAs, you may also want to check files under
  file:`/etc/apt/sources.list.d/`

Some of them may not yet support Jammy — they may need to be disabled
temporarily or updated manually.

Finally, reboot the Node.

.. code:: console

   # reboot
