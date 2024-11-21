.. _upgrade-mongoose:

.. card:: Mongooseconfiguration file


   During the |product| upgrade procedure, you will be asked whether or
   not to update the mongoose configuration file::

     Configuration file '/etc/carbonio/message-dispatcher/mongooseim.toml'
      ==> Modified (by you or by a script) since installation.
      ==> Package distributor has shipped an updated version.
        What would you like to do about it ?  Your options are:
        Y or I  : install the package maintainer's version
        N or O  : keep your currently-installed version
        D     : show the differences between the versions
        Z     : start a shell to examine the situation
      The default action is to keep your current version.
     *** janus.jcfg (Y/I/N/O/D/Z) [default=N] ? N

   As shown in the snippet above, you need to **keep the existing
   configuration file** :kbd:`N` (or :kbd:`O`).
