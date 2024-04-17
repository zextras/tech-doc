.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The log system in |product| is ``rsyslog``, which supports a
**centralised setup**: in other words, all log files produced by
|product| can be sent to a unique host server (we call it *"Log
Server"*), that is appropriately configured to receive log files,
which is particularly useful in a Multi-Server installation.

The Log Server can be one of the Nodes on which |product| is
installed, or a dedicated Node, either within the |product|
infrastructure or an existing, company-wide server that already
exists.

In this scenario, we configure a log Server on **Node 1** within the
|product| infrastructure, and we use ``srv1.example.com`` as FQDN.

.. card:: Centralised Logging Setup
             
   On ``srv1.example.com``, open file :file:`/etc/rsyslog.conf`,
   find the following lines, and uncomment them (i.e., remove the
   ``#`` character at the beginning of the line)::

     # Provides UDP syslog reception
     module(load="imudp")
     input(type="imudp" port="514")

     # Provides TCP syslog reception
     module(load="imtcp")
     input(type="imtcp" port="514")

   Then, restart the ``rsyslog`` service.

   .. code:: console

      # systemctl restart rsyslog

   Finally, specify the host server that will receive logs: we already
   called it ``srv1.example.com``, so use this hostname. 

   .. code:: console

      zextras$ carbonio prov mcf zimbraLogHostname srv1.example.com

   .. note:: Since ``zimbraLogHostname`` is a global attribute, this
      command must be run only once on one node.

.. card:: Other Nodes Setup
   
   Once the Log Server node has properly been initialised, on **all other
   nodes**, execute

   .. code:: console

      # /opt/zextras/libexec/zmsyslogsetup  && service rsyslog restart

