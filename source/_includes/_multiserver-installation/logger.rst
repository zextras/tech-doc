.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The log system in |product| is ``rsyslog``, which supports a
**centralised setup**: in other words, all log files produced by
|product| can be sent to a unique host server (we call it *"Log
Server"*), that is appropriately configured to receive log files,
which is particularly useful in a Multi-Server installation.

In the instructions below, we elect the Log Server to be
:bdg-secondary-line:`SRV1`.


.. card:: Centralised Logging Setup
   
   On :bdg-secondary-line:`SRV1`, open file
   :file:`/etc/rsyslog.conf`, find the following lines, and uncomment
   them (i.e., remove the ``#`` character at the beginning of the
   line).

   .. code::

      $ModLoad imudp
      $UDPServerRun 514

      $ModLoad imtcp
      $TCPServerRun 514

   Then, restart the ``rsyslog`` service.

   .. code:: console

      # systemctl restart rsyslog

   Finally, specify the host server that will receive logs. Since this
   is the :bdg-secondary-line:`SRV1` node, we need its hostname.

   .. code:: console

      zextras$ carbonio prov mcf zimbraLogHostname srv1_hostname

   .. note:: Since ``zimbraLogHostname`` is a global attribute, this
      command must be run only once on one node.

.. card:: Other Nodes Setup
   
   Once the Log Server node has properly been initialised, on **all other
   nodes**, execute

   .. code:: console

      # /opt/zextras/libexec/zmsyslogsetup  && service rsyslog restart

