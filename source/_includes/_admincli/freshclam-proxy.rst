Similarly to the scenario described in Section :ref:`upstream-proxy`,
:command:`freshclam` can not download the antivirus signatures if
|product| is placed behind a proxy. The solution is to put the proxy
information in the :command:`freshclam` *configuration template*,
which is :file:`/opt/zextras/conf/freshclam.conf.in`.

Log in to the Node where the **MTA AV/AS** Role is installed and edit
the file, by adding at the bottom the lines::

  HTTPProxyServer  proxy.example.com
  HTTPProxyPort    8080

As the |zu|, execute


.. code:: console

   zextras$ zmclamdctl restart

To verify that the new configuration is correct and the HTTP proxy is
being used, check the log file

.. code:: console

   zextras$ tail -f /opt/zextras/log/freshclam.log

In the output you should find some lines similar to the following::

   ClamAV update process started at Thu Mar 13 14:01:58 2025
   Trying to retrieve CVD header from https://database.clamav.net/daily.cvd
   OK
   main database available for download (remote version: xx)
   Testing database: '/opt/zextras/data/clamav/db/tmp.03d9f579e4/clamav-f220b006e75bbf945b40dd0f5b8a2f29.tmp-main.cvd' ...
   Database test passed.
   main.cvd updated (version: 62, sigs: 6647427, f-level: 90, builder: sigmgr)
   Trying to retrieve CVD header from https://database.clamav.net/bytecode.cvd
   OK

.. card:: Make a copy of the configuration template
   :class-title: sd-text-center


   If you have modified :command:`freshclam`\'s configuration template
   :file:`/opt/zextras/conf/freshclam.conf.in` , you will likely need
   to edit it again after an upgrade, because upgrades often overwrite
   configuration templates. Since |product| regenerates
   :file:`freshclam.conf` from the template file, when |product| or
   ClamAV updates, the template may be reset to default or overwritten
   with a new version, losing any changes you made to it. In this
   case, any custom modifications would be lost.

   To make sure changes are preserved after an upgrade, create a
   backup of the template file
   
   .. code:: console
             
      zextras$ cp /opt/zextras/conf/freshclam.conf.in /opt/zextras/conf/freshclam.conf.in.backup

   After the upgrade, compare and restore changes
      
   .. code:: console
             
      zextras$ diff /opt/zextras/conf/freshclam.conf.in.backup /opt/zextras/conf/freshclam.conf.in

   If the output is empty, there is no difference between the new
   template and the backup, so :command:`freshclam` will keep on
   working without issues. If you see any difference, you might want
   to restore the proxy settings, by following this procedure from the
   beginning or copying your backup file on the new template.

   .. code:: console
             
      zextras$ cp /opt/zextras/conf/freshclam.conf.in.backup /opt/zextras/conf/freshclam.conf.in
