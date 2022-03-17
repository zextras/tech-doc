.. _carbonio-update:

|product| upgrade
=================


In order to upgrade |product|, simply

* update the list of packages

  .. code:: console
            
     # apt update

* upgrade the system

  .. code:: console

     # apt upgrade

Indeed, |product| does not need any installer, but whenever new
versions are released, the repositories are updated and packages are
available for installation along with the other system updates.


.. rubric:: Troubleshooting

In early |product| versions, up to **4.0.3** included, the following error may
arise during upgrades::

  Preparing to unpack .../114-carbonio-core_4.0.5-1ubuntu1~focal_amd64.deb ...
  Unpacking carbonio-core (4.0.5-1ubuntu1~focal) over (4.0.3-1ubuntu1~focal) ...
  dpkg: error processing archive /tmp/apt-dpkg-install-GOKoug/114-carbonio-core_4.0.5-1ubuntu1~focal_amd64.deb (--unpack):
  trying to overwrite '/opt/zextras/.mini_alue_ce', which is also in package carbonio-ce 4.0.3-1ubuntu1~focal
  dpkg-deb: error: paste subprocess was killed by signal (Broken pipe)
  
  [...]
  
  Errors were encountered while processing:
  /tmp/apt-dpkg-install-GOKoug/114-carbonio-core_4.0.5-1ubuntu1~focal_amd64.deb
  E: Sub-process /usr/bin/dpkg returned an error code (1)

This is a known problem, fixed in **4.0.4**, for which the following
workaround exists: install package `carbonio-ce`, then upgrade and
remove old packages. In other words, run::

  # apt install carbonio-ce
  # apt upgrade
  # apt autoremove

The manual installation of the **carbonio-ce** package does not have
any effect on the existing configurations.
