The procedure must be carried out on each Node, starting from the one
on which the Directory Server Component is installed, and it will require
to reboot the Node and therefore a downtime of the |product|
infrastructure must be planned. Please read carefully the whole
section before starting the upgrade.

.. card:: Upgrade to Ubuntu 24.04 or RHEL 9

   With the upgrade of the operating system to **Ubuntu 24.04** or **RHEL 9**,
   some |product| services **previously managed by** :command:`zmcontrol` **are now
   handled directly by** :command:`systemd`. This transition requires **manual
   re-enabling of certain services** after the OS upgrade and affects
   :ref:`up_ph3` below.

   Refer to the :ref:`Systemd Integration Overview <intro_systemd>`
   for background information.

The procedure is divided into phases:

#. upgrade PostgreSQL from 12 to 16 (you can skip it if you already
   upgraded)

#. manual upgrade |product| to |release|

#. upgrade Ubuntu LTS to 22.04 (Jammy Jellifish) or 24.04 (Noble
   Numbat), or RHEL 8 to RHEL 9

   .. warning:: This release, **25.06.0**, does no longer support
      **Ubuntu 20.04 LTS**, which went EOL in May 2025, so you are
      strongly recommended to **upgrade to Ubuntu 22.04 LTS** or **to
      Ubuntu 24.04 LTS**.

#. upgrade |product|\'s packages to match the correct repository

#. complete the upgrade procedure

.. _up_ph1:

Phase 1
-------

If you have not yet upgraded to Postgres 16, do so before upgrading
the operating system. Directions to upgrade PostgreSQL can be found
in Section :ref:`pg-upgrade`.

.. _up_ph2:

Phase 2
-------

This phase is the same as a normal upgrade, so please refer to Section
:ref:`carbonio-upgrade`.

.. _up_ph3:

Phase 3
-------

This phase requires to upgrade the operating system. The following
scenarios are supported:

* Ubuntu 20.04 LTS to 22.04 LTS: refer to the `Ubuntu upgrade
  documentation
  <https://ubuntu.com/server/docs/upgrade-introduction>`_
* Ubuntu 22.04 LTS to 24.04 LTS: refer to the `Ubuntu upgrade
  documentation
  <https://ubuntu.com/server/docs/upgrade-introduction>`_
* RHEL 8 to RHEL 9 Red Hat: refer to the `RHEL upgrade documentation
  <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/upgrading_from_rhel_8_to_rhel_9/performing-the-upgrade_upgrading-from-rhel-8-to-rhel-9>`_

.. rubric:: Important notes:

#. Ubuntu 20.04 LTS in **no longer supported**: |product| will not
   work if upgraded to 25.6.0 on Ubuntu 20.04

#. A direct upgrade from Ubuntu 20.04 LTS to 22.04 LTS in **not
   supported**: you must upgrade to 22.04 LTS first, then to 24.04

#. If you upgrade to Ubuntu 22 and use the |monit| Component, please
   make sure to :ref:`change the Grafana repository <manual-grafana>`.

Before The OS Upgrade
~~~~~~~~~~~~~~~~~~~~~

#. On **each Node** of your |product| infrastructure:

   Switch to the zextras user (if not already):

   .. code:: console

      # su - zextras

#. Run the following command:

   .. code:: console

      zextras$ zmcontrol status

#. Take note of the services listed as ``Running``. While after the OS
   upgrade they will be enabled and running, you will be quicker in
   understanding which services need a manual restart in case
   something goes wrong.

After The OS Upgrade
~~~~~~~~~~~~~~~~~~~~

Once the OS upgrade to Ubuntu 24.04 or Red Hat 9 is complete:

#. Log in as ``root`` on each Node

#. Verify that the services identified earlier are correctly running,
   by using the corresponding command below to check it. If any
   service is *not running*, start it manually, replacing ``status``
   with ``start``.

.. list-table:: Mapping Table – zmcontrol Services to systemd Targets
   (Ubuntu 24.04 and RHEL 9)
   :header-rows: 1
   :widths: 30 70

   * - Target Name
     - Services Included

   * - zmcontrol Service
     - systemd Target Command (see :ref:`systemd-targets` for a
       complete mapping)

   * - directory-server
     - .. code:: console

          # systemctl status carbonio-directory-server.target

   * - mta
     - .. code:: console

          # systemctl status carbonio-mta.target

   * - proxy
     - .. code:: console

          # systemctl status carbonio-proxy.target

   * - mailbox
     - .. code:: console

          # systemctl status carbonio-appserver.target

.. card:: Example Scenario

   In the following example, **node03** runs both the *mta* and *proxy* services.

   :bdg-primary:`Before the OS Upgrade`

   .. code:: console

      zextras$ zmcontrol status

      Host node03.example.com
         ...
         mta         Running
         ...
         proxy       Running

   :bdg-primary:`After the OS Upgrade`

   Run the following as the |ru|:

   .. code:: console

      # systemctl status carbonio-mta.target
      # systemctl status carbonio-proxy.target

   Repeat the process for each Node and each relevant service: any
   service **does not** appear as ``Active``, must be manually
   started, for example:

   .. code:: console

      # systemctl start carbonio-proxy.target

Final Notes
~~~~~~~~~~~

* These actions are **mandatory** to ensure the |product| components
  start correctly on boot in the new OS.

* The :command:`zmcontrol` utility **no longer manages services** on Ubuntu 24.04 and Red Hat 9.

* Verify the status of any service after enablement using:

  .. code:: console

     #  systemctl status <target>

.. _up_ph4:

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

      #. contains the word **jammy** (for Ubuntu 22.04) or **noble**

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

.. _up_ph5:

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
