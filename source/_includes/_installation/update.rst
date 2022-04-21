

|product| does not need any installer, but whenever new versions are
released, the repositories are updated and packages are available for
installation along with the other system updates.  Therefore, to
upgrade |product|, first check for new packages:

.. code:: console

   # apt update 

Then either

* upgrade |product| packages only

  .. code:: console

     # apt install "carbonio-*"

or

* upgrade the whole system

  .. code:: console

     # apt upgrade 

.. hint:: Even if you choose to upgrade only |product|, remember that
   you should keep the whole system up to date, because new system
   packages may contain security fixes or bug fixes.

Troubleshooting
---------------

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Problem: Error in upgrading

      In early |product| versions, up to **4.0.3** included, an error
      similar to the following one may arise during upgrades in both
      Single-Server or Multi-Server installations::

        Preparing to unpack .../114-carbonio-core_4.0.5-1ubuntu1~focal_amd64.deb ...
        Unpacking carbonio-core (4.0.5-1ubuntu1~focal) over (4.0.3-1ubuntu1~focal) ...
        dpkg: error processing archive /tmp/apt-dpkg-install-GOKoug/114-carbonio-core_4.0.5-1ubuntu1~focal_amd64.deb (--unpack):
        trying to overwrite '/opt/zextras/.mini_alue_ce', which is also in package carbonio-ce 4.0.3-1ubuntu1~focal
        dpkg-deb: error: paste subprocess was killed by signal (Broken pipe)

        [...]

        Errors were encountered while processing:
        /tmp/apt-dpkg-install-GOKoug/114-carbonio-core_4.0.5-1ubuntu1~focal_amd64.deb
        E: Sub-process /usr/bin/dpkg returned an error code (1)

      In this case, the error message stems from `carbonio-ce` package, but
      it may be related to any |carbonio| package, for example
      `carbonio-mta`, `carbonio-proxy`, and so on. If this is the case, use
      the proper package name (instead of `carbonio-ce`) in the commands
      given below.

   .. grid-item-card:: Solution:
      
      This is a known problem, fixed in **4.0.4**, for which the following
      workaround exists: install package `carbonio-ce` (or the one
      that failed)::

        # apt install carbonio-ce

      Make sure that the `carbonio-core` package is installed and is
      the **latest version** available::
        
        # apt policy carbonio-core

      The outcome of the command shows the available versions of a
      package and should include three asterisks (``***``) before the
      latest available version. If not, install the package::

        # apt install carbonio-core

      Once installed, if a message appears, that some packages are not
      needed anymore, execute::

        # apt autoremove

      It is worth noticing that the manual installation of the package
      does not have any effect on its existing configurations, so you
      can proceed without any fear to lose them.


