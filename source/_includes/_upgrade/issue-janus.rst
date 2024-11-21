.. _upgrade-janus:

.. card:: Janus configuration file


   During the |product| upgrade procedure, you will be asked whether or
   not to update the janus configuration file::

     Configuration file '/etc/janus/janus.jcfg'
      ==> Modified (by you or by a script) since installation.
      ==> Package distributor has shipped an updated version.
        What would you like to do about it ?  Your options are:
        Y or I  : install the package maintainer's version
        N or O  : keep your currently-installed version
        D     : show the differences between the versions
        Z     : start a shell to examine the situation
      The default action is to keep your current version.
     *** janus.jcfg (Y/I/N/O/D/Z) [default=N] ? Y
     Installing new version of config file /etc/janus/janus.jcfg ...

   As shown in the snippet above, you need to install the new
   configuration file by pressing :kbd:`Y` (or :kbd:`I`); after the
   upgrade is complete and before rebooting the Node, check that the
   file contains the |vs| public IP address, for example::

     nat_1_1_mapping = "93.184.216.34"
