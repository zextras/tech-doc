Before starting the operating system upgrade procedure, read carefully
the whole section and take into account these points:

* Take a snapshot or a backup of each Node
* A direct upgrade from Ubuntu 20.04 LTS to 24.04 LTS in not
  supported: you must upgrade to 22.04 LTS first, then to 24.04.
* You cannot upgrade the OS if it is running an old version of
  |product|, it is mandatory to upgrade the OS only after upgrading to
  |product| Version that is also available for |product| 24.04.

Phase 1
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

Upgrade the OS to latest Ubuntu 22.04

Upgrade to lastest |product| Version

Phase 2
-------

Move away repositories, keeping a copy for safety

.. code:: console

   # mkdir /bck && mv /etc/apt/sources.list.d/* /bck

Then run the OS upgrade

.. code:: console

   # do-release-upgrade

Pay attention to all the question proposed by the upgrade process in
particular if :file:`/etc/sysctl.conf` is replaced, be sure that the new file
includes the line::

  vm.swappiness=1

Phase 3
-------

The OS upgrade process in previous phase ends with a reboot, after the
Node has restarted, run the following commands to restore and update
the repository configuration.

* Set new Postgres repository

  .. code:: console

     # echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main"

* Set new |product| Repo

  .. code:: console

     # wget -c  https://repo.zextras.io/inst_repo_ubuntu.sh && bash inst_repo_ubuntu.sh

* Set new Grafana repo if used (Optional)

  .. code:: console

     # wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/grafana.gpg > /dev/null
     # echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
     # apt update

You can ignore the warning::

  W: https://apt.postgresql.org/pub/repos/apt/dists/noble-pgdg/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.

Now you are ready to install |product| packages for Ubuntu 24.04:
execute the following commands

.. code:: console

   # systemctl daemon-reload
   # apt full-upgrade
   # pending setup -a
   # apt autoremove
   # reboot

Because the upgrade procedure can take a while and services are not
running, after the upgrade the service-discover service on Consul
servers could not start, fo fix execute:

.. code:: console

   # rm /var/lib/service-discover/data/server_metadata.json
   # systemctl restart service-dicover
