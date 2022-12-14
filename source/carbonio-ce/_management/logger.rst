.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _logger_node_config:

Logger Node Configuration
-------------------------

In all Multi-Server installation in which the **Logger** is installed
on a dedicated node, it needs a specific configuration, as its purpose
is to collect all *log files* from the other nodes. Once configured,
the other nodes must be set up to use the Logger node.

.. card::

   Logger Node Setup
   ^^^^
   
   On the Logger node, open file :file:`/etc/rsyslog.conf`, find the
   following lines, and uncomment them (i.e., remove the ``#``
   character at the beginning of the line).

   .. code::

      $ModLoad imudp
      $UDPServerRun 514

      $ModLoad imtcp
      $TCPServerRun 514

   Then, restart the ``rsyslog`` service.

   .. code:: console

      # systemctl restart rsyslog

   Finally, initialise the logging service for all nodes.

   .. code:: console

      # su - zextras -c "/opt/zextras/libexec/zmloggerinit"


.. card::

   Other Nodes Setup
   ^^^^
   
   Once the Logger node has properly been initialised, on **all other
   nodes**, execute

   .. code:: console

      # /opt/zextras/libexec/zmsyslogsetup  && service rsyslog restart
